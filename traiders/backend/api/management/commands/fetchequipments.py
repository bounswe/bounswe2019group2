import logging

from django.core.management.base import BaseCommand, CommandError
from django.db import transaction

from ...models import Equipment
from ... import alphavantage as av

logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = 'Fetches equipments from AlphaVantage'

    @transaction.atomic
    def handle(self, *args, **options):
        for category in ['currency', 'crypto', 'stock']:
            try:
                equipment_datas = av.fetch_equipment_data(category)
            except Exception as e:
                raise CommandError(f'Problem when fetching {category}')

            for data in equipment_datas:
                if not Equipment.objects.filter(symbol=data['symbol']).exists():
                    eq = Equipment.objects.create(**data)
                    logger.info(f'equipment created: {eq}')
