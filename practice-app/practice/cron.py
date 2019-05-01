import sys
import requests
from datetime import datetime
from api.models import Equipment, Parity
from django_cron import CronJobBase, Schedule
from django.utils import timezone
import pytz


class GetExchangeRates(CronJobBase):
    RUN_EVERY_MINS = 5

    schedule = Schedule(run_every_mins=RUN_EVERY_MINS)
    code = 'practice.GetExchangeRates'

    def do(self):

        names = []
        symbols = []

        equipments = Equipment.objects.all()

        for equipment in equipments:
            names.append(equipment.name)
            symbols.append(equipment.symbol)

        for base_symbol in symbols:
            for target_symbol in symbols:
                if base_symbol != 'EUR' and target_symbol != 'EUR':
                    if base_symbol != target_symbol:

                        try:
                            response = requests.get(
                                "https://api.exchangeratesapi.io/latest?symbols={},{}".format(base_symbol,
                                                                                              target_symbol))
                        except requests.exceptions.RequestException as e:
                            print(e)
                            sys.exit(1)

                        response_as_json = response.json()

                        base_equipment = Equipment.objects.get(symbol=base_symbol)
                        target_equipment = Equipment.objects.get(symbol=target_symbol)
                        ratio = response_as_json['rates'][target_symbol] / response_as_json['rates'][base_symbol]
                        date = timezone.now()

                        ##################################
                        date_unaware = datetime.strptime(response_as_json['date'], '%Y-%m-%d')
                        date_aware = pytz.utc.localize(date_unaware)
                        ##################################

                        if not Parity.objects.filter(base_equipment=base_equipment, target_equipment=target_equipment,
                                                     ratio=ratio, date=date).exists():
                            Parity(base_equipment=base_equipment, target_equipment=target_equipment, ratio=ratio,
                                   date=date).save()
