from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status
from rest_framework.authtoken.models import Token

from ..models import *


class NotificationViewSetTests(APITestCase):
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

        Parity.objects.create(base_equipment=self.lira,
                              target_equipment=self.euro,
                              open=1.0, close=1.5, high=1.6, low=0.9)

        Asset.objects.create(user=self.user,
                             equipment=self.lira,
                             amount=1000)

        Following.objects.create(user_following=self.user2, user_followed=self.user, status=Following.ACCEPTED)

        event_data = {
            "calendarId": "a",
            "category": 'a',
            "actual": 1,
            "previous": 1,
            "sourceURL": "https://www.google.com/",
            "importance": 1,
            "event": 1,
        }
        self.event = Event(**event_data)
        self.event.save()

    def test_article_notification(self):
        url = reverse('article-list')

        data = {
            'title': 'The Trade War That Never Stops',
            'content': 'Over the weekend, the White House suspended the tariff increases against Chinese goods '
                       'that were scheduled to be imposed',
        }

        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        self.client.post(url, data, format='json')
        article_pk = Article.objects.get(author=self.user).pk
        ref_url = reverse('article-detail', kwargs={'pk': article_pk})
        notification = Notification.objects.get(user=self.user2)
        self.assertEqual(ref_url, notification.reference_url)

    def test_event_notification(self):
        self.event.followed_by.add(self.user)
        self.assertEqual(Notification.objects.filter(user=self.user).count(), 0)
        self.event.actual = 3
        self.event.save()
        self.assertEqual(Notification.objects.filter(user=self.user).count(), 1)

    def test_stoploss_order_notification(self):
        url = reverse('stoplossorder-list')
        data = {
            'base_equipment': 'TRY',
            'target_equipment': 'EUR',
            'sell_amount': 100,
            'sell_ratio': 0.2
        }

        # Trader user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        self.client.post(url, data)

        asset = Asset.objects.get(user=self.user,
                                  equipment=self.lira)

        Parity.objects.create(base_equipment=self.lira,
                              target_equipment=self.euro,
                              open=0.25,
                              high=0.25,
                              close=0.25,
                              low=0.25)
        notification = Notification.objects.get(user=self.user)
        self.assertEqual("StopLossOrder", notification.reference_obj)
        self.assertEqual(self.user, notification.user)

    def test_buyorder_notification(self):
        url = reverse('buyorder-list')
        data = {
            'base_equipment': 'TRY',
            'target_equipment': 'EUR',
            'buy_amount': 100,
            'buy_ratio': 0.2
        }

        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        self.client.post(url, data)

        Parity.objects.create(base_equipment=self.lira,
                              target_equipment=self.euro,
                              open=0.12,
                              high=0.12,
                              close=0.12,
                              low=0.12)
        notification = Notification.objects.get(user=self.user)
        self.assertEqual("BuyOrder", notification.reference_obj)
        self.assertEqual(self.user, notification.user)


def test_retrieve(self):
    data = {
        "user": self.user,
        "message": "There are news and updates about the event you have followed.",
        "reference_obj": "Event",
        "reference_url": "https://www.google.com/",
    }
    notification = Notification(**data)
    notification.save()
    pk = notification.pk
    url = reverse('notification-detail', kwargs={'pk': pk})
    response = self.client.get(url)

    expected_fields = {
        'url', 'user', 'message', 'reference_obj', 'reference_url', 'seen', 'id'
    }
    self.assertSetEqual(expected_fields, set(response.data.keys()))

def test_update(self):
    data = {
        "user": self.user2,
        "message": "There are news and updates about the event you have followed.",
        "reference_obj": "Event",
        "reference_url": "https://www.google.com/",
    }
    notification = Notification(**data)
    notification.save()
    pk = notification.pk
    url = reverse('notification-detail', kwargs={'pk': pk})
    self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
    self.client.patch(url, {'seen': True}, format='json')

    expected_fields = {
        'url', 'user', 'message', 'reference_obj', 'reference_url', 'id'
    }
    self.assertSetEqual(expected_fields, set(response.data.keys()))

def test_list_without_filter(self):
    url = reverse('article-list')

    data1 = {
        'title': 'American Economy',
        'content': 'It is predicted that American economy in the third quarter..',
    }
    data2 = {
        'title': 'British Economy',
        'content': 'It is predicted that British economy in the third quarter..',
    }

    self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
    self.client.post(url, data1, format='json')
    self.client.post(url, data2, format='json')
    self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth2_key)
    url = reverse('notification-list')
    response = self.client.get(url)

    # to list portfolios, user is needed
    self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)


def test_list_with_filter_by_user(self):
    url = reverse('article-list')

    data1 = {
        'title': 'American Economy',
        'content': 'It is predicted that American economy in the third quarter..',
    }
    data2 = {
        'title': 'British Economy',
        'content': 'It is predicted that British economy in the third quarter..',
    }

    self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
    self.client.post(url, data1, format='json')
    self.client.post(url, data2, format='json')

    self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth2_key)
    url = f"{reverse('notification-list')}?user={self.user.pk}"
    response = self.client.get(url)
    self.assertEqual(response.status_code, status.HTTP_200_OK)
    notifications = response.data
    self.assertEqual(len(notifications), 2)  # check the number of notifications returned

    expected_fields = {
        'url', 'user', 'reference_url', 'reference_obj', 'message', 'seen', 'id'
    }
    self.assertSetEqual(set(notifications[0].keys()), expected_fields)
