import sys
import requests
from api.models import Equipment, Parity
from django_cron import CronJobBase, Schedule
from django.utils import timezone


class GetExchangeRates(CronJobBase):
    RUN_EVERY_MINS = 5

    schedule = Schedule(run_every_mins=RUN_EVERY_MINS)
    code = 'practice.GetExchangeRates'

    def do(self):

        equipments = Equipment.objects.all()

        symbols = [equipment.symbol for equipment in equipments]

        if "EUR" in symbols:
            symbols.remove("EUR")
            symbols_as_joined_without_eur = ",".join(symbols)
            symbols.append("EUR")

        symbols_as_joined = ",".join(symbols)

        for base_symbol in symbols:

            print("-----------", base_symbol, "-----------")

            try:
                response = requests.get(
                    "https://api.exchangeratesapi.io/latest?base={}&symbols={}".format(base_symbol,
                                                                                       symbols_as_joined if base_symbol != "EUR" else symbols_as_joined_without_eur))
            except requests.exceptions.RequestException as e:
                print(e)
                sys.exit(1)

            response_as_json = response.json()

            rates = response_as_json['rates']

            base_equipment = Equipment.objects.get(symbol=base_symbol)

            for target_symbol in symbols:
                target_equipment = Equipment.objects.get(symbol=target_symbol)
                ratio = rates[target_symbol]
                date = timezone.now()

                print(base_symbol, target_symbol, ratio, date)
                if not Parity.objects.filter(base_equipment=base_equipment, target_equipment=target_equipment,
                                             ratio=ratio, date=date).exists():
                    print("Saving to database")
                    Parity(base_equipment=base_equipment, target_equipment=target_equipment, ratio=ratio,
                           date=date).save()
