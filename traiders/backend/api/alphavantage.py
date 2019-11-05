from urllib.parse import urljoin
from django.utils.timezone import datetime, make_aware
import logging

import requests as rq

logger = logging.getLogger(__name__)


ALPHA_VANTAGE_BASE_URL = 'https://www.alphavantage.co/'
ALPHA_VANTAGE_CATEGORY_LIST_PATH = {
    'currency': 'physical_currency_list/',
    'crypto': 'digital_currency_list/'
}
ALPHA_VANTAGE_KEYS = []  # TODO get keys from settings


class QuotaError(Exception):
    pass


def fetch_equipment_data(category):
    logger.info(f'fetching equipment data for "{category}"')

    path = ALPHA_VANTAGE_CATEGORY_LIST_PATH[category]
    url = urljoin(ALPHA_VANTAGE_BASE_URL, path)

    csv_text = rq.get(url).text
    csv_lines = csv_text.splitlines()

    equipment_datas = []

    for line in csv_lines[1:]:
        symbol, name = line.split(',')

        equipment_datas.append({
            'symbol': symbol,
            'name': name,
            'category': category
        })

    return equipment_datas


def do_request(url, params):
    """
    try API keys
    """
    for key in ALPHA_VANTAGE_KEYS:
        response = rq.get(url, params={
            **params,
            'apikey': key
        })

        if response.status_code != 200:
            logger.error(f'"GET {response.url}" status={response.status_code}')
            raise Exception

        data = response.json()

        if 'Error Message' in data:
            logger.error(f'"GET {response.url}" error message = {data["Error Message"]}')
            raise Exception

        if 'Note' in data and 'frequency' in data['Note']:  # quota restriction
            logger.info(f'"GET {response.url}" exceeded quota')
            continue

        return data

    # failed with all keys
    raise QuotaError


def fetch_from_forex(base_symbol, target_symbol, outputsize):
    logger.info(f'fetching from forex')

    url = urljoin(ALPHA_VANTAGE_BASE_URL, 'query')

    params = {
        'function': 'FX_DAILY',
        'from_symbol': base_symbol,
        'to_symbol': target_symbol,
        'outputsize': outputsize
    }

    data = do_request(url, params)

    time_series = data['Time Series FX (Daily)']

    parities = []

    for date, rates in time_series.items():
        parities.append({
            'date': make_aware(datetime.strptime(date, '%Y-%m-%d')),
            'open': rates['1. open'],
            'high': rates['2. high'],
            'low': rates['3. low'],
            'close': rates['4. close']
        })

    try:
        last_updated = datetime.strptime(data['Meta Data']['5. Last Refreshed'], '%Y-%m-%d %H:%M:%S')
    except Exception:
        last_updated = datetime.strptime(data['Meta Data']['5. Last Refreshed'], '%Y-%m-%d')

    last_updated = make_aware(last_updated)

    return last_updated, parities


def fetch_parities(base_symbol, base_category, target_symbol, target_category, outputsize):
    # TODO decide AV function to use FX_DAILY, DIGITAL_CURRENCY based on categories

    logger.info(f'fetch_parities base={base_symbol} target={target_symbol}')

    return fetch_from_forex(base_symbol, target_symbol, outputsize)
