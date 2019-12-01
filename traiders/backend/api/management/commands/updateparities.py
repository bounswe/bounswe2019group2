import logging

from django.core.management.base import BaseCommand, CommandError
from django.db import transaction
from django.utils import timezone

from ...models import ParitySetting, Parity
from ... import alphavantage as av

logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = 'Fetches up-to-date parities from AlphaVantage'

    @transaction.atomic
    def handle(self, *args, **options):
        now = timezone.now()

        for ps in ParitySetting.objects.all():
            if ps.last_updated and ps.last_updated + ps.update_rate > now:  # dont update yet
                continue

            base_eq = ps.base_equipment
            target_eq = ps.target_equipment

            try:
                last_updated, parities = av.fetch_parities(base_eq.symbol, base_eq.category,
                                                           target_eq.symbol, target_eq.category,
                                                           outputsize='compact')
            except av.QuotaError as e:
                logger.error(f'quota exceed when updating {base_eq}/{target_eq}')
                return

            recent_parity_data = parities[0]
            del recent_parity_data['date']

            parity, created = Parity.objects.update_or_create(
                defaults=recent_parity_data,
                base_equipment=base_eq, target_equipment=target_eq, date=last_updated
            )

            if created:
                logger.info(f'{parity} created')
            else:
                logger.info(f'{parity} updated')

            ps.last_updated = now
            ps.save()
