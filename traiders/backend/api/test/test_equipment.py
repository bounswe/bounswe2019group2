from django.urls import reverse
from rest_framework.test import APITestCase

from ..models import Equipment


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

    def test_list(self):
        url = reverse('equipment-list')
        response = self.client.get(url)
        equipments = response.data
        self.assertEqual(len(equipments), 3)

