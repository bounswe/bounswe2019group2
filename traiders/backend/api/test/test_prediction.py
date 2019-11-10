import datetime
from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status
from rest_framework.authtoken.models import Token
from django.utils.timezone import make_aware

from ..models import Prediction, User, Equipment, Parity


class PredictionViewTestCase(APITestCase):
    def setUp(self):
        data = {
            'username': 'moneyhunter001',
            'first_name': 'Josh',
            'last_name': 'Mathews',
            'email': 'moneyhunter0@example.com',
        }

        self.user = User(**data)
        self.user.set_password('fSDfs2v1')
        self.user.save()

        self.key = Token.objects.create(user=self.user).key

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

        self.eq1 = Equipment.objects.create(**equipment1_data)
        self.eq2 = Equipment.objects.create(**equipment2_data)
        self.eq_pair = {
            'base_equipment': self.eq1,
            'target_equipment': self.eq2,
        }

        self.today = datetime.date.today()

        Parity.objects.create(**self.eq_pair, ratio=1.0,
                              date=make_aware(datetime.datetime.combine(self.today, datetime.time(18))))

    def test_create(self):
        url = reverse('prediction-list')

        data = {
            'base_equipment': 'USD',
            'target_equipment': 'EUR',
            'direction': 1
        }

        # try without authentication
        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.key)

        # try without required fields
        for missing_key in data:
            missing_data = {**data}
            del missing_data[missing_key]
            response = self.client.post(url, missing_data)
            self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        self.assertTrue(
            Prediction.objects.filter(**self.eq_pair,
                                      date=datetime.date.today(),
                                      user=self.user).exists()
        )

        # test create again
        response = self.client.post(url, data)
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_list(self):
        Prediction.objects.create(**self.eq_pair, date=datetime.date.today(),
                                  user=self.user,
                                  direction=Prediction.WILL_INCREASE)

        url = reverse('prediction-list')

        # try without authentication
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.key)

        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        self.assertEqual(len(response.data), 1)

    def test_list_with_filter(self):
        Prediction.objects.create(**self.eq_pair, date=datetime.date.today(),
                                  user=self.user,
                                  direction=Prediction.WILL_INCREASE)

        url = reverse('prediction-list') + f'?base_equipment={self.eq1.symbol}&target_equipment={self.eq2.symbol}'

        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.key)

        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        self.assertEqual(len(response.data), 1)

    def test_evaluate_successful(self):
        pass  # TODO implement after implementing evaluation
        # pred = Prediction.objects.create(**self.eq_pair,
        #                                  direction=Prediction.WILL_INCREASE,
        #                                  user=self.user)
        #
        # Parity.objects.create(**self.eq_pair, ratio=1.1,
        #                       date=make_aware(datetime.datetime.combine(self.today, datetime.time(19))))
        #
        # self.assertEqual(pred.result, Prediction.SUCCESSFUL)
