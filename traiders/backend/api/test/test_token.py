from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status

from ..models import User


class TokenViewSetTests(APITestCase):
    def setUp(self):
        data = {
            'username': 'moneyhunter001',
            'first_name': 'Josh',
            'last_name': 'Mathews',
            'email': 'moneyhunter0@example.com',
        }

        user = User(**data)
        user.set_password('fSDfs2v1')
        user.save()

    def test_successful(self):
        url = reverse('token-list')

        data = {
            'username': 'moneyhunter001',
            'password': 'fSDfs2v1'
        }

        response = self.client.post(url, data)

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertTrue('key' in response.data)

        # login again to receive the same key
        key = response.data.get('key')
        response = self.client.post(url, data)

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertTrue('key' in response.data)

        self.assertEqual(key, response.data.get('key'))

    def test_wrong_username(self):
        url = reverse('token-list')

        data = {
            'username': 'wrong_username',
            'password': 'fSDfs2v1'
        }

        response = self.client.post(url, data)

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_wrong_password(self):
        url = reverse('token-list')

        data = {
            'username': 'moneyhunter001',
            'password': 'wrongpassword'
        }

        response = self.client.post(url, data)

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_missing_fields(self):
        url = reverse('token-list')

        data = {
            'username': 'moneyhunter001',
            'password': 'fSDfs2v1'
        }

        for key_to_exclude in data:
            missing_data = {**data}
            del missing_data[key_to_exclude]

            response = self.client.post(url, missing_data)
            self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
