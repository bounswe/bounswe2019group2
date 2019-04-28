from django_cron import CronJobBase, Schedule
import requests

class GetExchangeRates(CronJobBase):
    RUN_EVERY_MINS = 1

    schedule = Schedule(run_every_mins=RUN_EVERY_MINS)
    code = 'practice.GetExchangeRates'

    def do(self):
        response = str(requests.request('GET', 'https://api.exchangeratesapi.io/latest').json())
        with open('exchangeRates.txt', 'a') as log_file:
            log_file.write(response)
