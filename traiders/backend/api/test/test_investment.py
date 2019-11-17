from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status
from rest_framework.authtoken.models import Token

from ..models import *


class InvestmentandAPIViewTestCase(APITestCase):
    def setUp(self):
        data = {
            'username': 'moneyhunter001',
            'first_name': 'Josh',
            'last_name': 'Mathews',
            'email': 'moneyhunter0@example.com',
            'iban': '1234567891234567891234567891234567',
            'is_trader': True,
            'city': "Cairo"
        }

        self.user = User(**data)
        self.user.set_password('fSDfs2v1')
        self.user.save()

        self.key = Token.objects.create(user=self.user).key

        # Basic user
        basic_data = {
            'username': 'rizelee04',
            'first_name': 'Mahmut',
            'last_name': 'Cay',
            'email': 'rizelee@example.com',
        }

        self.user2 = User(**basic_data)
        self.user2.set_password('fSDfs2v1')
        self.user2.save()

        self.key2 = Token.objects.create(user=self.user2).key

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

        self.eq1 = Equipment.objects.create(**equipment1_data)
        self.eq2 = Equipment.objects.create(**equipment2_data)
        self.eq3 = Equipment.objects.create(**equipment3_data)

        Parity.objects.create(base_equipment=self.eq3,
                              target_equipment=self.eq2,
                              open=1.0, close=1.5, high=1.6, low=0.9)

    def test_add_asset(self):
        url = reverse('asset-list')
        data = {
            'equipment': 'TRY',
            'amount': 1000
        }
        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # Basic User
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.key2)
        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

        # Trader user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.key)
        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_create(self):

        # Add asset first
        url = reverse('asset-list')
        data = {
            'equipment': 'TRY',
            'amount': 1000
        }
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.key)
        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        # Then make investment
        url = reverse('onlineinvestment-list')
        data = {
            'base_equipment': 'TRY',
            'target_equipment': 'EUR',
            'base_amount': 10000
        }
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.key)

        # Balance is not enough
        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

        data['base_amount'] = 100
        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        asset = Asset.objects.get(user=self.user,
                                  equipment=self.eq3)

        # Make sure balance is correct
        self.assertAlmostEqual(asset.amount, 900)

    def test_credit_card(self):
        # Add asset first
        url = reverse('asset-list')
        data = {
            'equipment': 'TRY',
            'amount': 1000
        }
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.key)
        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        url = reverse('onlineinvestment-list')
        data = {
            'base_equipment': 'TRY',
            'target_equipment': 'EUR',
            'base_amount': 100,
            'credit_card': '5243100000010101',
            'credt_card_valid_until': '09/21',
            'credit_card_ccv': 100
        }

        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        asset = Asset.objects.get(user=self.user,
                                  equipment=self.eq3)

        # Make sure balance has not changed
        self.assertAlmostEqual(asset.amount, 1000)
