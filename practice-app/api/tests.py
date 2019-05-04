from rest_framework.test import APITestCase
from rest_framework import status
from django.contrib.auth.models import User
from django.utils.timezone import datetime, make_aware

from .models import Parity, Equipment


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


class ParityViewTestCase(APITestCase):
    def setUp(self):
        e1 = Equipment(symbol='SYM1', name='curr 1', category='currency')
        e2 = Equipment(symbol='SYM2', name='curr 2', category='currency')
        e3 = Equipment(symbol='SYM3', name='curr 3', category='currency')

        e1.save()
        e2.save()
        e3.save()

        dt1 = make_aware(datetime(1969, 1, 12, 17, 0, 0))
        dt2 = make_aware(datetime(1969, 1, 12, 19, 0, 0))
        dt3 = make_aware(datetime(1969, 1, 12, 14, 0, 0))
        dt4 = make_aware(datetime(1970, 10, 5, 17, 0, 0))

        Parity(base_equipment=e1, target_equipment=e2, date=dt1, ratio=1.23).save()
        Parity(base_equipment=e1, target_equipment=e2, date=dt2, ratio=1.24).save()
        Parity(base_equipment=e1, target_equipment=e2, date=dt4, ratio=1.50).save()

        Parity(base_equipment=e2, target_equipment=e3, date=dt3, ratio=2.44).save()
        Parity(base_equipment=e2, target_equipment=e3, date=dt4, ratio=2.50).save()

    def test_without_filter(self):
        response = self.client.get('/parity/1969-01-12/')

        self.assertTrue(response.status_code, status.HTTP_200_OK)

        data = response.data

        self.assertEqual(len(data), 2)

        self.assertEqual(data[0]['base_equipment'], {'symbol': 'SYM1'})
        self.assertEqual(data[0]['target_equipment'], {'symbol': 'SYM2'})
        self.assertAlmostEqual(float(data[0]['ratio']), 1.24)

        self.assertEqual(data[1]['base_equipment'], {'symbol': 'SYM2'})
        self.assertEqual(data[1]['target_equipment'], {'symbol': 'SYM3'})
        self.assertAlmostEqual(float(data[1]['ratio']), 2.44)

    def test_filter(self):
        response = self.client.get('/parity/1969-01-12/?base=SYM1&target=SYM2')

        self.assertTrue(response.status_code, status.HTTP_200_OK)

        data = response.data

        self.assertEqual(len(data), 1)

        self.assertEqual(data[0]['base_equipment'], {'symbol': 'SYM1'})
        self.assertEqual(data[0]['target_equipment'], {'symbol': 'SYM2'})
        self.assertAlmostEqual(float(data[0]['ratio']), 1.24)

    def test_not_found(self):
        response = self.client.get('/parity/1969-01-12/?target=FOO')

        self.assertTrue(response.status_code, status.HTTP_404_NOT_FOUND)

    def test_latest(self):
        response = self.client.get('/parity/latest/?base=SYM1&target=SYM2')

        self.assertTrue(response.status_code, status.HTTP_200_OK)

        data = response.data

        self.assertEqual(data['base_equipment'], {'symbol': 'SYM1'})
        self.assertEqual(data['target_equipment'], {'symbol': 'SYM2'})
        self.assertAlmostEqual(float(data['ratio']), 1.50)
