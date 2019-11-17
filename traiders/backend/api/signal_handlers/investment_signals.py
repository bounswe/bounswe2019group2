import logging
from django.dispatch.dispatcher import receiver
from django.db.models.signals import post_save, pre_save
from django.db import transaction
from ..models import Asset, Parity, OnlineInvestment
from rest_framework.exceptions import ValidationError, PermissionDenied

logger = logging.getLogger(__name__)


@receiver(post_save, sender=OnlineInvestment)
@transaction.atomic
def online_investment_post(sender, instance: OnlineInvestment, **kwargs):
    user = instance.user
    base_eq = instance.base_equipment
    target_eq = instance.target_equipment
    base_amount = instance.base_amount
    target_amount = instance.target_amount

    asset = Asset.objects.filter(user=user,
                                 equipment=base_eq).first()

    target_asset, _ = Asset.objects.get_or_create(user=user,
                                                  equipment=target_eq)

    target_asset.amount += target_amount
    target_asset.save()

    asset.amount = asset.amount - base_amount
    asset.save()
