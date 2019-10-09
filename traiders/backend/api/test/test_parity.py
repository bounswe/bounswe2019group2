from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework.exceptions import ErrorDetail

from ..models import Equipment, Parity


class ParityViewsetTests(APITestCase):
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

        dollar = Equipment(**equipment1_data)
        euro = Equipment(**equipment2_data)
        turkish_liras = Equipment(**equipment3_data)
        dollar.save()
        euro.save()
        turkish_liras.save()

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

        eur_dollar = Parity(**parity1_data)
        dollar_try = Parity(**parity2_data)
        try_dollar = Parity(**parity3_data)
        eur_dollar.save()
        dollar_try.save()
        try_dollar.save()

    def test_list(self):
        url = reverse('parity-list')
        response = self.client.get(url)
        parities = response.data
        self.assertEqual(len(parities), 3)

    def test_get_by_target(self):
        response = self.client.get('/parity/', data={"target_equipment": "USD"})
        parities = response.data
        self.assertEqual(len(parities), 2)

    def test_get_by_base(self):
        response = self.client.get('/parity/', data={"base_equipment": "USD"})
        parities = response.data
        self.assertEqual(len(parities), 1)

    def test_get_not_existing(self):
        response = self.client.get('/parity/', data={"base_equipment": "GJF"})
        error = response.data
        self.assertEqual(len(error), 1)
        self.assertIn('detail', error)
        self.assertIsInstance(error['detail'], ErrorDetail)
        self.assertEqual(error['detail'].code, 'not_found')
