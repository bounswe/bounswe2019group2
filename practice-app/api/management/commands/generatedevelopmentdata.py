from random import random

from django.core.management.base import BaseCommand, CommandError
from django.utils import timezone

from ...models import Equipment, Parity


class Command(BaseCommand):
    help = 'Generates fake data for development'

    def handle(self, *args, **options):

        symbols = ['USD', 'EUR', 'TRY', 'GBP']
        names = ['U.S. Dollars', 'Euros', 'Turkish Liras', 'British Pounds']

        for symbol, name in zip(symbols, names):
            e = Equipment(symbol=symbol, name=name, category='currency')
            e.save()

        def fake_parity(base_symbol, target_symbol, ratio_range):
            base_equipment = Equipment.objects.get(symbol=base_symbol)
            target_equipment = Equipment.objects.get(symbol=target_symbol)

            dt = timezone.now()
            for _ in range(100):
                ratio = ratio_range[0] + (ratio_range[1] - ratio_range[0]) * random()

                p = Parity(base_equipment=base_equipment, target_equipment=target_equipment, ratio=ratio, date=dt)
                p.save()

                dt = dt - timezone.timedelta(days=1)

        fake_parity('USD', 'TRY', ratio_range=(3, 5))
        fake_parity('TRY', 'USD', ratio_range=(1/5, 1/3))
        fake_parity('EUR', 'USD', ratio_range=(1.1, 1.2))
        fake_parity('USD', 'EUR', ratio_range=(1/1.2, 1/1.1))
        fake_parity('GBP', 'TRY', ratio_range=(5, 8))
        fake_parity('TRY', 'GBP', ratio_range=(1/8, 1/5))

        self.stdout.write('Generating fake equipment and parities is done.')