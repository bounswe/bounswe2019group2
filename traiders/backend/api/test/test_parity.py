from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework.exceptions import ErrorDetail

from ..models import Equipment, Parity


class ParityViewsetTests(APITestCase):
    def setUp(self):
        equipment1_data = {
            "symbol": "USD",
            "name": "US Dollars",
            "category": "currency"
        }

        equipment2_data = {
            "symbol": "EUR",
            "name": "Euros",
            "category": "currency"
        }

        equipment3_data = {
            "symbol": "TRY",
            "name": "Turkish Liras",
            "category": "currency"
        }

        equipment4_data = {
            "symbol": "BTC",
            "name": "Bitcoin",
            "category": "crypto"
        }

        dollar = Equipment(**equipment1_data)
        euro = Equipment(**equipment2_data)
        turkish_liras = Equipment(**equipment3_data)
        bitcoin = Equipment(**equipment4_data)
        dollar.save()
        euro.save()
        turkish_liras.save()
        bitcoin.save()

        parity1_data = {
            "base_equipment": euro,
            "target_equipment": dollar,
            "ratio": 0.9
        }
        parity2_data = {
            "base_equipment": dollar,
            "target_equipment": turkish_liras,
            "ratio": 5.8
        }

        parity3_data = {
            "base_equipment": turkish_liras,
            "target_equipment": dollar,
            "ratio": 0.15
        }

        parity4_data = {
            "base_equipment": bitcoin,
            "target_equipment": dollar,
            "ratio": 8257.79
        }

        parity5_data = {
            "base_equipment": turkish_liras,
            "target_equipment": bitcoin,
            "ratio": 0.000021
        }

        for data in [parity1_data, parity2_data, parity3_data, parity4_data, parity5_data]:
            for key in ['high', 'close', 'open', 'low']:
                data[key] = data['ratio']
            del data['ratio']

        eur_dollar = Parity(**parity1_data)
        dollar_try = Parity(**parity2_data)
        try_dollar = Parity(**parity3_data)
        btc_usd = Parity(**parity4_data)
        try_btc = Parity(**parity5_data)
        eur_dollar.save()
        dollar_try.save()
        try_dollar.save()
        btc_usd.save()
        try_btc.save()

    def test_list(self):
        url = reverse('parity-list')
        response = self.client.get(url)
        parities = response.data
        self.assertEqual(len(parities), 5)

    def test_get_by_target(self):
        response = self.client.get('/parity/', data={"target_equipment": "USD"})
        parities = response.data
        self.assertEqual(len(parities), 3)

    def test_get_by_base(self):
        response = self.client.get('/parity/', data={"base_equipment": "USD"})
        parities = response.data
        self.assertEqual(len(parities), 1)

    def test_get_by_category(self):
        response = self.client.get('/parity/', data={"category": "crypto"})
        self.assertEqual(response.status_code, 200)
        parities = response.data
        self.assertEqual(len(parities), 2)

    def test_get_not_existing(self):
        response = self.client.get('/parity/', data={"base_equipment": "GJF"})
        self.assertListEqual(response.data, [])
