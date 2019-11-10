import datetime
from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status
from rest_framework.authtoken.models import Token
from django.utils.timezone import make_aware

from ..models import Prediction, User, Equipment, Parity


class UserSuccessViewTest(APITestCase):
    def setUp(self):
        user_data = [
            {
                'username': 'moneyhunter001',
                'first_name': 'Josh',
                'last_name': 'Mathews',
                'email': 'moneyhunter0@example.com',
            },
            {
                'username': 'foobar',
                'first_name': 'Foo',
                'last_name': 'Baar',
                'email': 'foobar@example.com',
            }
        ]

        self.users = []
        for data in user_data:
            u = User(**data)
            u.set_password('secretpassword')
            u.save()
            self.users.append(u)

        equipment_data = [
            {
                "symbol": "USD",
                "name": "US Dollars",
                "category": "Currency"
            },
            {
                "symbol": "EUR",
                "name": "Euros",
                "category": "Currency"
            },
            {
                "symbol": "TRY",
                "name": "Turkish Liras",
                "category": "Currency"
            },
        ]

        self.eqs = [
            Equipment.objects.create(**data) for data in equipment_data
        ]

        # user 0 makes 10 predictions in eq0/eq1 with 30% success
        for i in range(10):
            result = i < 3  # 30% success
            Prediction.objects.create(
                user=self.users[0],
                base_equipment=self.eqs[0],
                target_equipment=self.eqs[1],
                direction=Prediction.WILL_INCREASE,
                result=result,
                date=datetime.date(2018, 12, i + 1)
            )

        # user 0 makes 3 predictions in eq0/eq2, these wont count
        for i in range(3):
            Prediction.objects.create(
                user=self.users[0],
                base_equipment=self.eqs[0],
                target_equipment=self.eqs[2],
                direction=Prediction.WILL_INCREASE,
                result=Prediction.FAILED,
                date=datetime.date(2018, 11, i + 1)
            )

        # user 1 makes 5 predictions in eq2/eq1, 60% successful
        for i in range(5):
            result = i < 3  # 60%
            Prediction.objects.create(
                user=self.users[1],
                base_equipment=self.eqs[2],
                target_equipment=self.eqs[1],
                direction=Prediction.WILL_DECREASE,
                result=result,
                date=datetime.date(2018, 11, i + 1)
            )

    def test_list_with_filter_0(self):
        url = reverse('user-success-list') + f'?user={self.users[0].pk}'

        response = self.client.get(url)

        self.assertEqual(response.status_code, status.HTTP_200_OK)

        data = response.data

        self.assertEqual(len(data), 1)
        self.assertEqual(data[0]['base_equipment']['id'], self.eqs[0].id)
        self.assertEqual(data[0]['target_equipment']['id'], self.eqs[1].id)
        self.assertEqual(data[0]['prediction_count'], 10)
        self.assertAlmostEqual(data[0]['success_rate'], 0.3)

    def test_list_with_filter_1(self):
        url = reverse('user-success-list') + f'?user={self.users[1].pk}'

        response = self.client.get(url)

        self.assertEqual(response.status_code, status.HTTP_200_OK)

        data = response.data

        self.assertEqual(len(data), 1)
        self.assertEqual(data[0]['base_equipment']['id'], self.eqs[2].id)
        self.assertEqual(data[0]['target_equipment']['id'], self.eqs[1].id)
        self.assertEqual(data[0]['prediction_count'], 5)
        self.assertAlmostEqual(data[0]['success_rate'], 0.6)
