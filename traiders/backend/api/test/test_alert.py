from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status
from rest_framework.authtoken.models import Token

from ..models import *


class AlertViewSetTests(APITestCase):
    def setUp(self):
        self.user_data = {
            'username': 'moneyhunter001',
            'first_name': 'Josh',
            'last_name': 'Mathews',
            'email': 'moneyhunter0@example.com',
            'iban': '1234567891234567891234567891234567',
            'is_trader': True,
            'city': "Cairo",
            'email_verified': True
        }

        self.user = User(**self.user_data)
        self.user.set_password('A7b8CdjK')
        self.user.save()
        # create a token for the test user
        token = Token.objects.create(user=self.user)
        self.auth_key = token.key

        self.user2_data = {
            'username': 'fake_profile',
            'first_name': 'Jim',
            'last_name': 'Kean',
            'email': 'jk@natlanta.com',
        }

        self.user2 = User(**self.user2_data)
        self.user2.set_password('Th9oBsc7j')
        self.user2.save()
        token2 = Token.objects.create(user=self.user2)
        self.auth_key2 = token2.key

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
        self.dollar = Equipment(**equipment1_data)
        self.euro = Equipment(**equipment2_data)
        self.lira = Equipment(**equipment3_data)
        self.dollar.save()
        self.euro.save()
        self.lira.save()

        self.parity = Parity.objects.create(base_equipment=self.euro,
                                            target_equipment=self.lira,
                                            open=3.5, close=4.5, high=4.6, low=3.4)
        alert1_data = {
            'user': self.user2,
            'base_symbol': 'EUR',
            'target_symbol': 'USD',
            'ratio': 5.0,
            'increasing': 'True',
        }
        self.alert1 = Alert(**alert1_data)
        self.alert1.save()

        alert2_data = {
            'user': self.user2,
            'base_symbol': 'TRY',
            'target_symbol': 'USD',
            'ratio': 5.0,
            'increasing': 'True',
        }
        self.alert2 = Alert(**alert2_data)
        self.alert2.save()

    def test_create(self):
        url = reverse('alert-list')

        data = {
            'base_symbol': 'USD',
            'target_symbol': 'TRY',
            'ratio': 5.0,
            'increasing': 'True',
        }

        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_alert_with_upper_bound(self):
        url = reverse('alert-list')
        self.parity.close = 4.5
        self.parity.save()

        data = {
            'user': self.user,
            'base_symbol': 'EUR',
            'target_symbol': 'TRY',
            'ratio': 5.0,
            'increasing': True,
        }
        alert = Alert(**data)
        alert.save()

        self.parity.close = 5.5
        self.parity.save()
        notification = Notification.objects.get(user=self.user)
        self.assertEqual(reverse('parity-detail', kwargs={'pk': self.parity.pk}), notification.reference_url)

    def test_alert_with_lower_bound(self):
        url = reverse('alert-list')
        self.parity.close = 4.5
        self.parity.save()

        data = {
            'base_symbol': 'EUR',
            'target_symbol': 'TRY',
            'ratio': 4.0,
            'increasing': False,
        }

        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        self.client.post(url, data, format='json')
        self.parity.close = 3.5
        self.parity.save()
        notification = Notification.objects.get(user=self.user)
        self.assertEqual(reverse('parity-detail', kwargs={'pk': self.parity.pk}), notification.reference_url)

    def test_retrieve(self):
        url = reverse('alert-detail', kwargs={'pk': self.alert1.pk})
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.get(url)

        expected_fields = {
            "url", "user", "base_symbol", "target_symbol", "ratio", "increasing", "id"
        }
        self.assertSetEqual(expected_fields, set(response.data.keys()))

    def test_list(self):
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.get(reverse('alert-list'))
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        alerts = response.data
        self.assertEqual(len(alerts), 2)  # check the number of alerts returned

        expected_fields = {
            "url", "user", "base_symbol", "target_symbol", "ratio", "increasing", "id"
        }
        self.assertSetEqual(set(alerts[0].keys()), expected_fields)
