import logging

from django.core.management.base import BaseCommand, CommandError
from django.db import transaction

from ...models import Equipment
from ... import alphavantage as av

logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = 'Fetches equipments from AlphaVantage'

    def add_arguments(self, parser):
        parser.add_argument('--force', action='store_true', help='Force delete existing equipment and parities')

    @transaction.atomic
    def handle(self, *args, **options):
        if Equipment.objects.exists() and not options.get('force'):
            raise CommandError('There are equipments in the database. '
                               'Running this command will delete them and their parities. '
                               'Use --force to delete.')

        logger.info('deleting all equipment and parities')
        Equipment.objects.all().delete()

        for category in ['currency', 'crypto']:
            try:
                equipment_datas = av.fetch_equipment_data(category)
            except Exception as e:
                raise CommandError(f'Problem when fetching {category}')

            for data in equipment_datas:
                Equipment.objects.create(**data)
