import logging
from django.dispatch.dispatcher import receiver
from django.db.models.signals import post_save, post_delete
from django.db import transaction

from .models import ParitySetting, Parity
from . import alphavantage as av

logger = logging.getLogger(__name__)


@receiver(post_delete, sender=ParitySetting)
@transaction.atomic
def delete_parity_history(sender, instance: ParitySetting, **kwargs):
    base_eq = instance.base_equipment
    target_eq = instance.target_equipment

    logger.info(f'deleting parity: {base_eq}/{target_eq}')

    # delete all parities managed by this parity setting
    Parity.objects.filter(base_equipment=base_eq,
                          target_equipment=target_eq).delete()


@receiver(post_save, sender=ParitySetting)
@transaction.atomic
def create_parity_history(sender, instance: ParitySetting, created, **kwargs):
    # handle only creation
    if not created:
        return

    logger.info(f'creating history for: {instance}')

    base_eq = instance.base_equipment
    target_eq = instance.target_equipment

    try:
        last_updated, parities = av.fetch_parities(base_eq.symbol, base_eq.category,
                                                   target_eq.symbol, target_eq.category,
                                                   outputsize='full')
    except Exception as e:
        logger.error(f'fetching history for {base_eq}/{target_eq} failed: {e}', exc_info=True)
        instance.delete()
        return

    for parity in parities:
        # ignore older than from_date
        if parity['date'] < instance.from_date:
            continue

        Parity.objects.create(base_equipment=base_eq, target_equipment=target_eq, **parity)

    instance.last_updated = last_updated
    instance.save()
