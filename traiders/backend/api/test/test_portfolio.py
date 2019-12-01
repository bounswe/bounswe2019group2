from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status
from rest_framework.authtoken.models import Token

from ..models import User, Portfolio, EquipmentPair, Equipment


class ArticleViewSetTests(APITestCase):
    def setUp(self):
        user_data = {
            'username': 'investorNYC',
            'first_name': 'Jesse',
            'last_name': 'Kean',
            'email': 'jk@newyork.com',
        }

        self.user = User(**user_data)
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

        self.equipment_pair = EquipmentPair()
        self.equipment_pair.base_equipment = self.euro
        self.equipment_pair.target_equipment = self.dollar

        self.equipment_pair2 = EquipmentPair
        self.equipment_pair2.base_equipment = self.euro
        self.equipment_pair2.target_equipment = self.lira

        data = {
            'name': 'My Portfolio',
            'user': self.user,
            'parities': self.equipment_pair,
        }
        self.portfolio = Portfolio(**data)
        self.portfolio.save()


    def test_create(self):
        url = reverse('portfolio-list')

        data = {
            'name': 'Important Currencies',
            'parities': self.equipment_pair2,
        }

        # test without token
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # test with token
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Portfolio.objects.filter(**data, user=self.user2).count(), 1)

    def test_update_name(self):
        pk = self.portfolio.pk
        url = reverse('portfolio-detail', kwargs={'pk': pk})
        name = 'Portfolio'

        # test without token
        response = self.client.patch(url, {'name': name}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # test with different user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.patch(url, {'name': name}, format='json')
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        # test with correct user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.patch(url, {'name': name}, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_update_parities(self):
        pk = self.portfolio.pk
        url = reverse('portfolio-detail', kwargs={'pk': pk})
        parities = self.equipment_pair2

        # test without token
        response = self.client.patch(url, {'parities': parities}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # test with different user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.patch(url, {'parities': parities}, format='json')
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        # test with correct user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.patch(url, {'parities': parities}, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_delete(self):
        pk = self.portfolio.pk
        url = reverse('portfolio-detail', kwargs={'pk': pk})

        # test without token
        response = self.client.delete(url, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # test with different user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        # test with correct user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)

    def test_retrieve(self):
        pk = self.portfolio.pk
        url = reverse('portfolio-detail', kwargs={'pk': pk})
        response = self.client.get(url)

        expected_fields = {
            'url', 'user', 'name', 'parities', 'followed_by', 'id'
        }
        self.assertSetEqual(expected_fields, set(response.data.keys()))

    def test_list(self):
        url = reverse('portfolio-list')
        response = self.client.get(url)

        self.assertEqual(response.status_code, status.HTTP_200_OK)

        portfolios = response.data
        self.assertEqual(len(portfolios), 2)  # check the number of articles returned

