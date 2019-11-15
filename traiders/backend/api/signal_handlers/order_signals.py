import logging
from django.dispatch.dispatcher import receiver
from django.db.models.signals import post_save
from django.db import transaction
from ..models import BuyOrder, Parity, StopLossOrder, Asset

logger = logging.getLogger(__name__)


@receiver(post_save, sender=Parity)
@transaction.atomic
def handle_orders(sender, instance: Parity, created, **kwargs):
    logger.info(f'Handling orders after saving a parity for: {instance}')

    base_eq = instance.base_equipment
    target_eq = instance.target_equipment
    ratio = instance.close

    buy_orders = BuyOrder.objects.filter(base_equipment=base_eq,
                                         target_equipment=target_eq)

    stoploss_orders = StopLossOrder.objects.filter(base_equipment=base_eq,
                                                   target_equipment=target_eq)

    for order in buy_orders:
        if order.buy_ratio > ratio:
            user = order.user
            buy_amount = order.buy_amount
            target_amount = ratio * buy_amount
            target_asset = Asset.objects.filter(user=user,
                                                equipment=target_eq).first()

            if target_asset is not None:
                target_asset.amount = target_asset.amount + target_amount
                target_asset.save()

            else:
                target_asset = Asset.objects.create(equipment=target_eq,
                                                    amount=target_amount,
                                                    user=user)
                target_asset.save()
            order.delete()

    for order in stoploss_orders:
        if order.sell_ratio < ratio:
            user = order.user
            sell_amount = order.sell_amount
            target_amount = ratio * sell_amount
            target_asset = Asset.objects.filter(user=user,
                                                equipment=target_eq).first()

            if target_asset is not None:
                target_asset.amount = target_asset.amount + target_amount
                target_asset.save()

            else:
                target_asset = Asset.objects.create(equipment=target_eq,
                                                    amount=target_amount,
                                                    user=user)
                target_asset.save()
            order.delete()
