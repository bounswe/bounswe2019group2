import decimal
import logging

from django.db import transaction
from django.db.models.signals import post_save
from django.dispatch.dispatcher import receiver
from django.urls import reverse

from ..models import BuyOrder, Parity, StopLossOrder, Asset, OnlineInvestment, Notification

logger = logging.getLogger(__name__)


@receiver(post_save, sender=Parity)
@transaction.atomic
def handle_orders(sender, instance: Parity, created, **kwargs):
    logger.info(f'Handling orders after saving a parity for: {instance}')

    base_eq = instance.base_equipment
    target_eq = instance.target_equipment
    ratio = decimal.Decimal(instance.close)

    buy_orders = BuyOrder.objects.filter(base_equipment=base_eq,
                                         target_equipment=target_eq,
                                         buy_ratio__gt=ratio)

    stoploss_orders = StopLossOrder.objects.filter(base_equipment=base_eq,
                                                   target_equipment=target_eq,
                                                   sell_ratio__lt=ratio)

    for order in buy_orders:
        user = order.user
        buy_amount = order.buy_amount
        target_amount = ratio * buy_amount

        base_asset = Asset.objects.get(user=user,
                                       equipment=base_eq)

        base_asset.amount = base_asset.serializable_value('amount') + buy_amount
        base_asset.on_hold_for_investment = base_asset.serializable_value('on_hold_for_investment') - buy_amount
        base_asset.save()
        investment = OnlineInvestment.objects.create(base_equipment=base_eq,
                                                     user=user,
                                                     target_equipment=target_eq,
                                                     base_amount=buy_amount,
                                                     target_amount=target_amount)
        pk = investment.pk
        url = reverse('onlineinvestment-detail', kwargs={'pk': pk})
        Notification.objects.create(user=user,
                                    message="Your buy order in case the parity " + base_eq.symbol + "/" + target_eq.symbol + " becomes lower than " + str(
                                        ratio) + " has been processed.",
                                    reference_obj="BuyOrder",
                                    reference_url=url)

        order.delete()

    for order in stoploss_orders:
        user = order.user
        sell_amount = order.sell_amount
        target_amount = ratio * sell_amount

        base_asset = Asset.objects.get(user=user,
                                       equipment=base_eq)

        base_asset.amount = base_asset.serializable_value('amount') + sell_amount
        base_asset.on_hold_for_investment = base_asset.serializable_value('on_hold_for_investment') - sell_amount

        base_asset.save()

        investment = OnlineInvestment.objects.create(base_equipment=base_eq,
                                                     target_equipment=target_eq,
                                                     user=user,
                                                     base_amount=sell_amount,
                                                     target_amount=target_amount)
        pk = investment.pk
        url = reverse('onlineinvestment-detail', kwargs={'pk': pk})
        Notification.objects.create(user=user,
                                    message="Your stop-loss order for " + target_eq.symbol + "/" + base_eq.symbol + " has been processed.",
                                    reference_obj="StopLossOrder",
                                    reference_url=url)
        order.delete()
