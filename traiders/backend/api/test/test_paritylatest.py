from django.urls import reverse
from rest_framework.test import APITestCase
from ..models import Equipment, Parity


class ParityLatestViewsetTests(APITestCase):
    def setUp(self):
        equipment1_data = {
            "symbol": "USD",
            "name": "US Dollars",
            "category": "Currency"
        }

        equipment2_data = {
            "symbol": "EUR",
            "name": "Euros",
            "category": "Currency"
        }

        equipment3_data = {
            "symbol": "TRY",
            "name": "Turkish Liras",
            "category": "Currency"
        }

        equipment4_data = {
            "symbol": "BTC",
            "name": "Bitcoin",
            "category": "Crypto"
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
            "base_equipment": bitcoin,
            "target_equipment": dollar,
            "ratio": 8257.79
        }

        parity4_data = {
            "base_equipment": turkish_liras,
            "target_equipment": bitcoin,
            "ratio": 0.000021
        }

        parity5_data = {
            "base_equipment": euro,
            "target_equipment": dollar,
            "ratio": 0.92
        }

        parity6_data = {
            "base_equipment": bitcoin,
            "target_equipment": dollar,
            "ratio": 8256
        }

        eur_dollar = Parity(**parity1_data)
        dollar_try = Parity(**parity2_data)
        btc_usd = Parity(**parity3_data)
        try_btc = Parity(**parity4_data)
        eur_dollar.save()
        dollar_try.save()
        btc_usd.save()
        try_btc.save()
        eur_dollar2 = Parity(**parity5_data)
        btc_usd2 = Parity(**parity6_data)
        eur_dollar2.save()
        btc_usd2.save()

    def test_list(self):
        url = reverse('parity-latest-list')
        response = self.client.get(url)
        parities = response.data
        self.assertEqual(len(parities), 4)

    def test_get_by_target(self):
        response = self.client.get('/parity/latest/', data={"target_equipment": "USD"})
        parities = response.data
        self.assertEqual(len(parities), 2)

    def test_value(self):
        response = self.client.get('/parity/latest/', data={"base_equipment": "EUR",
                                                            "target_equipment": "USD"})
        parity = response.data[0]
        self.assertAlmostEqual(float(parity['ratio']), 0.92)
