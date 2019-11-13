import logging
from django.dispatch.dispatcher import receiver
from django.db.models.signals import pre_save
from django.db import transaction
from ..models import Asset, Parity, OnlineInvestment
from rest_framework.exceptions import ValidationError, PermissionDenied

logger = logging.getLogger(__name__)


@receiver(pre_save, sender=OnlineInvestment)
@transaction.atomic
def online_investment_pre(sender, instance: OnlineInvestment, **kwargs):
    user = instance.user
    base_eq = instance.base_equipment
    target_eq = instance.target_equipment
    base_amount = instance.base_amount

    if not user.email_verified:
        raise PermissionDenied("Verify your e-mail account before making an online investment.")

    asset = Asset.objects.filter(user=user,
                                 equipment=base_eq).first()
    if asset is None:
        raise ValidationError("You don't have any asset from the base equipment.")

    balance = asset.serializable_value('amount')
    if balance < base_amount:
        raise ValidationError("You don't have enough balance to perform this action.")

    latest = Parity.objects.order_by('-date').filter(base_equipment=base_eq,
                                                     target_equipment=target_eq).first()

    if latest is None:
        raise ValidationError("This conversion does not exist.")

    # TODO insert credit-card or IBAN logic

    target_amount = latest.close * base_amount

    target_asset = Asset.objects.filter(user=user,
                                        equipment=target_eq).first()

    if target_asset is None:
        Asset.objects.create(equipment=target_eq,
                             user=user,
                             amount=target_amount)

    else:
        target_asset.amount += target_amount
        target_asset.save()

    asset.amount = balance - base_amount
    asset.save()
    instance.target_amount = target_amount
