from urllib.parse import urljoin
from django.utils.timezone import datetime, make_aware
import logging
import os

import requests as rq

logger = logging.getLogger(__name__)

ALPHA_VANTAGE_BASE_URL = 'https://www.alphavantage.co/'
ALPHA_VANTAGE_CATEGORY_LIST_PATH = {
    'currency': 'physical_currency_list/',
    'crypto': 'digital_currency_list/'
}
ALPHA_VANTAGE_KEYS = os.environ.get('ALPHA_VANTAGE_KEYS', '').split(',')


class QuotaError(Exception):
    def __init__(self):
        super().__init__('AlphaVantage quota exceed')


class NoKeys(Exception):
    def __init__(self):
        super().__init__('no AlphaVantage keys')


def _handle_fetch_stock_equipments():
    # return some popular stocks for now
    # TODO maybe we can use `SYMBOL_SEARCH` to get names of symbols automatically
    return [
        {'symbol': 'GOOGL', 'name': 'Alphabet Inc.', 'category': 'stock'},
        {'symbol': 'FB', 'name': 'Facebook Inc.', 'category': 'stock'},
        {'symbol': 'AAPL', 'name': 'Apple Inc.', 'category': 'stock'},
        {'symbol': 'BABA', 'name': 'Alibaba Group Holding Limited', 'category': 'stock'},
        {'symbol': 'SPY', 'name': 'SPDR S&P 500 ETF', 'category': 'stock'},
        {'symbol': 'IWM', 'name': 'iShares Russell 2000 ETF', 'category': 'stock'},
        {'symbol': 'VNQ', 'name': 'Vanguard Real Estate Index Fund ETF Shares', 'category': 'stock'},
        {'symbol': 'AGTHX', 'name': 'American Funds The Growth Fund of America Class A', 'category': 'stock'},
    ]


def fetch_equipment_data(category):
    logger.info(f'fetching equipment data for "{category}"')

    if category == 'stock':  # AlphaVantage does not provide a list of stock symbols
        return _handle_fetch_stock_equipments()

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
    if not ALPHA_VANTAGE_KEYS:
        raise NoKeys

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


def _fetch_from_forex(base_symbol, target_symbol, outputsize):
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


def _fetch_from_digital(base_symbol, target_symbol, outputsize):
    logger.info(f'fetching from digital')

    url = urljoin(ALPHA_VANTAGE_BASE_URL, 'query')

    params = {
        'function': 'DIGITAL_CURRENCY_DAILY',
        'symbol': base_symbol,
        'market': target_symbol,
        'outputsize': outputsize
    }

    data = do_request(url, params)

    time_series = data['Time Series (Digital Currency Daily)']

    parities = []

    for date, rates in time_series.items():
        parity = {
            'date': make_aware(datetime.strptime(date, '%Y-%m-%d'))
        }

        for their_key, value in rates.items():
            for our_key in ['open', 'close', 'high', 'low']:
                if 'a. ' + our_key in their_key:
                    parity[our_key] = value

        if set(parity.keys()) != {'open', 'close', 'high', 'low', 'date'}:
            logger.error('values could not be found in response')
            raise Exception('invalid response from AlphaVantage')

        parities.append(parity)

    try:
        last_updated = datetime.strptime(data['Meta Data']['6. Last Refreshed'], '%Y-%m-%d %H:%M:%S')
    except Exception:
        last_updated = datetime.strptime(data['Meta Data']['6. Last Refreshed'], '%Y-%m-%d')

    last_updated = make_aware(last_updated)

    return last_updated, parities


def _fetch_from_stock(symbol, outputsize):
    logger.info(f'fetching from stock')

    url = urljoin(ALPHA_VANTAGE_BASE_URL, 'query')

    params = {
        'function': 'TIME_SERIES_DAILY',
        'symbol': symbol,
        'outputsize': outputsize
    }

    data = do_request(url, params)

    time_series = data['Time Series (Daily)']

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
        last_updated = datetime.strptime(data['Meta Data']['3. Last Refreshed'], '%Y-%m-%d %H:%M:%S')
    except Exception:
        last_updated = datetime.strptime(data['Meta Data']['3. Last Refreshed'], '%Y-%m-%d')

    last_updated = make_aware(last_updated)

    return last_updated, parities


def fetch_parities(base_symbol, base_category, target_symbol, target_category, outputsize):
    logger.info(f'fetch_parities base={base_symbol} target={target_symbol}')

    # note: this is as far as alphavantage supports.
    #       if we need parities that are not in one of these conversions,
    #       we'll have to calculate them ourselves.
    if base_category == 'currency' and target_category == 'currency':
        return _fetch_from_forex(base_symbol, target_symbol, outputsize)
    elif base_category == 'crypto' and target_category == 'currency':
        return _fetch_from_digital(base_symbol, target_symbol, outputsize)
    elif base_category == 'stock' and target_category == 'currency' and target_symbol == 'USD':
        return _fetch_from_stock(base_symbol, outputsize)
    else:
        raise Exception(f'conversion between {base_symbol} and {target_symbol} is not supported')
