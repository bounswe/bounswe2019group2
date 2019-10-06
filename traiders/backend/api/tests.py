from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status

from .models import User


class UserViewSetTests(APITestCase):
    def setUp(self):
        data = {
            'username': 'marry48',
            'first_name': 'Marry',
            'last_name': 'Smith',
            'email': 'me@marrysmith.com',
        }

        user = User(**data)
        user.set_password('sG2sf032')
        user.save()

    def test_create(self):
        url = reverse('user-list')
        password = 'g5Hs-s34'
        data = {
            'username': 'john56',
            'first_name': 'John',
            'last_name': 'Doe',
            'email': 'johndoe@example.com',
            'password': password
        }

        response = self.client.post(url, data, format='json')

        # test status code
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        # test if created
        del data['password']  # dont check equality of password because it is hashed
        self.assertEqual(User.objects.filter(**data).count(), 1)
        # test password separately
        self.assertTrue(User.objects.get(**data).check_password(password))

    def test_create_without_required(self):
        url = reverse('user-list')
        password = 'g5Hs-s34'
        data = {
            'username': 'john56',
            'first_name': 'John',
            'last_name': 'Doe',
            'email': 'johndoe@example.com',
            'password': password
        }

        # test without a required field
        for key in data:
            missing_data = {**data}
            del missing_data[key]
            response = self.client.post(url, missing_data, format='json')

            # test status code
            self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_create_trader_without_iban(self):
        url = reverse('user-list')
        password = 'g5Hs-s34'
        data = {
            'username': 'john56',
            'first_name': 'John',
            'last_name': 'Doe',
            'email': 'johndoe@example.com',
            'password': password,
            'is_trader': True
        }

        response = self.client.post(url, data, format='json')

        # test status code
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_update_name_and_username(self):
        pk = User.objects.get(username='marry48').pk

        url = reverse('user-detail', kwargs={'pk': pk})
        data = {
            'username': 'marry123',
            'first_name': 'Marry Ava'
        }

        response = self.client.patch(url, data, format='json')

        # test status code
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        # test if updated
        self.assertEqual(User.objects.filter(pk=pk, **data).count(), 1)

    def test_update_password(self):
        pk = User.objects.get(username='marry48').pk

        url = reverse('user-detail', kwargs={'pk': pk})
        password = 'ghI0dd.s'

        response = self.client.patch(url, {'password': password}, format='json')

        # test status code
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        # test if updated
        self.assertTrue(User.objects.get(pk=pk).check_password(password))

    def test_become_trader_without_iban(self):
        pk = User.objects.get(username='marry48').pk

        url = reverse('user-detail', kwargs={'pk': pk})
        data = {
            'is_trader': True,
        }

        response = self.client.patch(url, data, format='json')

        # test status code
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_become_trader_with_iban(self):
        pk = User.objects.get(username='marry48').pk

        url = reverse('user-detail', kwargs={'pk': pk})
        data = {
            'is_trader': True,
            'iban': '1234567890123456789012345678901234'
        }

        response = self.client.patch(url, data, format='json')

        # test status code
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_retrieve_user(self):
        user = User.objects.get(username='marry48')

        url = reverse('user-detail', kwargs={'pk': user.pk})

        response = self.client.get(url)

        expected_fields = [
            'url', 'username', 'first_name', 'last_name', 'email',
            'date_joined', 'is_trader', 'iban', 'preferred_currency'
        ]

        for expected in expected_fields:
            self.assertTrue(expected in response.data.keys())

        self.assertEqual(len(expected_fields), len(response.data))