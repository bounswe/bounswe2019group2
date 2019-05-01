from rest_framework.test import APITestCase
from rest_framework import status
from django.contrib.auth.models import User


class HelloWorldTestCase(APITestCase):
    def test_get(self):
        response = self.client.get('/helloworld/')

        self.assertEqual(response.status_code, status.HTTP_200_OK)

        self.assertEqual(response.data, {'message': 'Hello, stranger.'})

    def test_post(self):
        response = self.client.post('/helloworld/', data={'name': 'John Doe'})

        self.assertEqual(response.status_code, status.HTTP_200_OK)

        self.assertEqual(response.data, {'message': 'Hello, John Doe.'})


class RegisterTestCase(APITestCase):

    def test_user_create(self):
        response = self.client.put('/register/', data={'username': 'newuser', 'password': '1234qazx',
                                                       'email': 'yeni@email.com'})

        self.assertEqual(response.status_code, status.HTTP_200_OK)

        self.assertEqual(response.data, {'message': 'User newuser is registered'})


class InvalidRegisterTestCase(APITestCase):
    def setUp(self):
        user = User(username='newuser', email='yeni@email.com')
        user.set_password('1234qazx')
        user.save()

    def test_user_same(self):
        response = self.client.put('/register/', data={'username': 'newuser', 'password': '1234qazx',
                                                        'email': 'yeni@email.com'})

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

        self.assertEqual(response.data, {'message': 'Email or username is invalid'})

    def test_same_email(self):
        response = self.client.put('/register/', data={'username': 'invester', 'password': '1234qazx',
                                                        'email': 'yeni@email.com'})

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

        self.assertEqual(response.data, {'message': 'Email or username is invalid'})

    def test_same_username(self):
        response = self.client.put('/register/', data={'username': 'newuser', 'password': '1234qazx',
                                                        'email': 'yenibiri@email.com'})

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

        self.assertEqual(response.data, {'message': 'Email or username is invalid'})

        
class AuthApiTestCase(APITestCase):
    def setUp(self):
        user = User(username="john", email="john@gmail.com")
        user.set_password("4321")
        user.save()

    def test_login(self):
        response = self.client.post('/login/', data={'email': 'john@gmail.com', 'password': '4321'})

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertTrue("token" in response.data)
        self.assertTrue("user" in response.data)
        self.assertEqual(response.data["user"]["username"], "john")

    def test_invalid_login(self):
        response = self.client.post('/login/', data={'email': 'john@gmail.com', 'password': '1234'})

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertFalse("token" in response.data)
        self.assertFalse("user" in response.data)

    def test_invalid_login2(self):
        response = self.client.post('/login/', data={'email':'', 'password': '1234'})

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertFalse("token" in response.data)
        self.assertFalse("user" in response.data)

