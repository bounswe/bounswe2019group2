from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status
from rest_framework.authtoken.models import Token

from ..models import *


class OrderViewTestCase(APITestCase):
    def setUp(self):
        data = {
            'username': 'moneyhunter001',
            'first_name': 'Josh',
            'last_name': 'Mathews',
            'email': 'moneyhunter0@example.com',
            'iban': '1234567891234567891234567891234567',
            'is_trader': True,
            'city': "Cairo",
            'email_verified': True
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

        Asset.objects.create(user=self.user,
                             equipment=self.eq3,
                             amount=1000)

    def test_add_buy_order(self):
        url = reverse('buyorder-list')
        data = {
            'base_equipment': 'TRY',
            'target_equipment': 'EUR',
            'buy_amount': 100,
            'buy_ratio': 0.2
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

        asset = Asset.objects.get(user=self.user,
                                  equipment=self.eq3)

        self.assertAlmostEqual(asset.amount, 900)
        self.assertAlmostEqual(asset.on_hold_for_investment, 100)

    def test_working_buy_order(self):
        url = reverse('buyorder-list')
        data = {
            'base_equipment': 'TRY',
            'target_equipment': 'EUR',
            'buy_amount': 100,
            'buy_ratio': 0.2
        }

        # Trader user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.key)
        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        order = BuyOrder.objects.get(user=self.user,
                                     base_equipment=self.eq3,
                                     target_equipment=self.eq2)
        orderid = order.pk

        asset = Asset.objects.get(user=self.user,
                                  equipment=self.eq3)

        self.assertAlmostEqual(asset.amount, 900)
        self.assertAlmostEqual(asset.on_hold_for_investment, 100)

        Parity.objects.create(base_equipment=self.eq3,
                              target_equipment=self.eq2,
                              open=0.12,
                              high=0.12,
                              close=0.12,
                              low=0.12)

        # Assert order is deleted
        order = BuyOrder.objects.filter(pk=orderid).first()
        self.assertIsNone(order)

        # Assert the balance
        asset = Asset.objects.get(user=self.user,
                                  equipment=self.eq3)
        target_asset = Asset.objects.get(user=self.user,
                                         equipment=self.eq2)

        self.assertAlmostEqual(asset.amount, 900)
        self.assertAlmostEqual(asset.on_hold_for_investment, 0)
        self.assertAlmostEqual(target_asset.amount, 12)

        # Assert investment is created
        investment = OnlineInvestment.objects.filter(base_equipment=self.eq3,
                                                     target_equipment=self.eq2).first()
        self.assertAlmostEqual(investment.base_amount, 100)
        self.assertAlmostEqual(investment.target_amount, 12)

    def test_add_stoploss_order(self):
        url = reverse('stoplossorder-list')
        data = {
            'base_equipment': 'TRY',
            'target_equipment': 'EUR',
            'sell_amount': 100,
            'sell_ratio': 0.2
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

        asset = Asset.objects.get(user=self.user,
                                  equipment=self.eq3)

        self.assertAlmostEqual(asset.amount, 900)
        self.assertAlmostEqual(asset.on_hold_for_investment, 100)

    def test_working_stoploss_order(self):
        url = reverse('stoplossorder-list')
        data = {
            'base_equipment': 'TRY',
            'target_equipment': 'EUR',
            'sell_amount': 100,
            'sell_ratio': 0.2
        }

        # Trader user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.key)
        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        order = StopLossOrder.objects.get(user=self.user,
                                          base_equipment=self.eq3,
                                          target_equipment=self.eq2)
        orderid = order.pk

        asset = Asset.objects.get(user=self.user,
                                  equipment=self.eq3)

        self.assertAlmostEqual(asset.amount, 900)
        self.assertAlmostEqual(asset.on_hold_for_investment, 100)

        Parity.objects.create(base_equipment=self.eq3,
                              target_equipment=self.eq2,
                              open=0.25,
                              high=0.25,
                              close=0.25,
                              low=0.25)

        # Assert order is deleted
        order = StopLossOrder.objects.filter(pk=orderid).first()
        self.assertIsNone(order)

        # Assert the balance
        asset = Asset.objects.get(user=self.user,
                                  equipment=self.eq3)
        target_asset = Asset.objects.get(user=self.user,
                                         equipment=self.eq2)

        self.assertAlmostEqual(asset.amount, 900)
        self.assertAlmostEqual(asset.on_hold_for_investment, 0)
        self.assertAlmostEqual(target_asset.amount, 25)

        # Assert investment is created
        investment = OnlineInvestment.objects.filter(base_equipment=self.eq3,
                                                     target_equipment=self.eq2).first()
        self.assertAlmostEqual(investment.base_amount, 100)
        self.assertAlmostEqual(investment.target_amount, 25)
