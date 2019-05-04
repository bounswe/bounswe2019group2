from django.core.management.base import BaseCommand
from django.utils import timezone
from ...models import Equipment, Parity
import datetime
import requests
import json
from decimal import *
YEAR_BEGIN = 2017

class Command(BaseCommand):
    help = 'Generates historic data related to parities'

    def _generate_parities(self):
        utc = timezone.utc
        today = datetime.datetime.utcnow().replace(tzinfo=utc).strftime('%Y-%m-%d')

        result = requests.get("https://api.exchangeratesapi.io/%s" % today).json()

        symbols = list()
        symbols.append(result["base"])
        for key, _ in result["rates"].items():
            symbols.append(key)

        with open("./api/management/equipment.json") as f:
            maps = json.load(f)

        for symbol in symbols:
            if not Equipment.objects.filter(symbol=symbol).exists():
                Equipment(name=maps[symbol]["name"], category="Currency", symbol=symbol).save()

    def _write_currency_history(self, symbol):
        utc = timezone.utc
        today = datetime.datetime.utcnow().replace(tzinfo=utc).strftime('%Y-%m-%d')
        YEAR_END = int(today[:4])

        print(symbol)
        base_equipment = Equipment.objects.get(symbol=symbol)

        for year in range(YEAR_BEGIN, YEAR_END+1):

            begins = "%d-01-01" % year
            if year == YEAR_END:
                ends = today
            else:
                ends = "%d-01-01" % (year+1)
            url = "https://api.exchangeratesapi.io/history?\
                                    start_at=%s&end_at=%s&base=%s" % (begins, ends, symbol)
            result = requests.get("https://api.exchangeratesapi.io/history?start_at=%s&end_at=%s&base=%s" %
                                  (begins, ends, symbol)).json()

            for date, rates in result["rates"].items():
                for target_symbol, rate in rates.items():

                    try:
                        target_equipment = Equipment.objects.get(symbol=target_symbol)
                    except _ as e:
                        print(e, target_symbol)

                    rate = Decimal(rate)

                    if not Parity.objects.filter(base_equipment=base_equipment, target_equipment=target_equipment,
                                                 date=date).exists():
                        rate = "%.3f" % rate
                        try:
                            Parity(base_equipment=base_equipment, target_equipment=target_equipment,
                                   ratio=rate, date=date).save()
                        except DecimalException as e:
                            pass

    def _generate_history(self):
        symbols = Equipment.objects.values("symbol")
        for symbol in symbols:
            self._write_currency_history(symbol["symbol"])

    def handle(self, *args, **options):
        self._generate_parities()
        self._generate_history()

        self.stdout.write('Generating historic data is done.')