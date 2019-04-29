import requests
import sys
from django_cron import CronJobBase, Schedule
from django.utils import timezone
from api.models import Equipment, Parity


class GetExchangeRates(CronJobBase):
    RUN_EVERY_MINS = 5

    schedule = Schedule(run_every_mins=RUN_EVERY_MINS)
    code = 'practice.GetExchangeRates'

    symbols = ['USD',
               'JPY',
               'GBP',
               'CHF',
               'CAD',
               'AUD',
               'NZD',
               'ZAR',
               'TRY']

    names = ['U.S. Dollar',
             'Japanese Yen',
             'British Pound',
             'Swiss Franc',
             'Canadian Dollar',
             'Australian Dollar',
             'New Zealand Dollar',
             'South African Rand',
             'Turkish Lira']

    def do(self):

        for symbol, name in zip(GetExchangeRates.symbols, GetExchangeRates.names):
            if not Equipment.objects.filter(symbol=symbol, name=name, category='currency').exists():
                Equipment(symbol=symbol, name=name, category='currency').save()

        for base_symbol in GetExchangeRates.symbols:
            for target_symbol in GetExchangeRates.symbols:
                if base_symbol != target_symbol:

                    try:
                        response = requests.get(
                            "https://api.exchangeratesapi.io/latest?symbols={},{}".format(base_symbol, target_symbol))
                    except requests.exceptions.RequestException as e:
                        print(e)
                        sys.exit(1)

                    response_as_json = response.json()

                    base_equipment = Equipment.objects.get(symbol=base_symbol)
                    target_equipment = Equipment.objects.get(symbol=target_symbol)
                    ratio = response_as_json['rates'][target_symbol] / response_as_json['rates'][base_symbol]
                    dt = timezone.now()

                    if not Parity.objects.filter(base_equipment=base_equipment, target_equipment=target_equipment,
                                                 ratio=ratio, date=dt).exists():
                        Parity(base_equipment=base_equipment, target_equipment=target_equipment, ratio=ratio,
                               date=dt).save()
