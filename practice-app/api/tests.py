from rest_framework.test import APITestCase
from rest_framework import status


class HelloWorldTestCase(APITestCase):
    def test_get(self):
        response = self.client.get('/helloworld/')

        self.assertEqual(response.status_code, status.HTTP_200_OK)

        self.assertEqual(response.data, {'message': 'Hello, stranger.'})

    def test_post(self):
        response = self.client.post('/helloworld/', data={'name': 'John Doe'})

        self.assertEqual(response.status_code, status.HTTP_200_OK)

        self.assertEqual(response.data, {'message': 'Hello, John Doe.'})