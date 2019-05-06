from rest_framework.test import APITestCase
from rest_framework import status
from django.contrib.auth.models import User
from django.utils.timezone import datetime, make_aware

from .models import Parity, Equipment, ManualInvestment


class RegisterTestCase(APITestCase):

    def test_user_create(self):
        response = self.client.post('/register/', data={'username': 'newuser', 'password': '1234qazx',
                                                       'email': 'yeni@email.com'})

        self.assertEqual(response.status_code, status.HTTP_200_OK)

        self.assertEqual(response.data, {'message': 'User newuser is registered'})


class InvalidRegisterTestCase(APITestCase):
    def setUp(self):
        user = User(username='newuser', email='yeni@email.com')
        user.set_password('1234qazx')
        user.save()

    def test_user_same(self):
        response = self.client.post('/register/', data={'username': 'newuser', 'password': '1234qazx',
                                                       'email': 'yeni@email.com'})

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

        self.assertEqual(response.data, {'message': 'Email or username is invalid'})

    def test_same_email(self):
        response = self.client.post('/register/', data={'username': 'invester', 'password': '1234qazx',
                                                       'email': 'yeni@email.com'})

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

        self.assertEqual(response.data, {'message': 'Email or username is invalid'})

    def test_same_username(self):
        response = self.client.post('/register/', data={'username': 'newuser', 'password': '1234qazx',
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
        response = self.client.post('/login/', data={'email': '', 'password': '1234'})

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


class ParityListTestCase(APITestCase):
    def setUp(self):
        e1 = Equipment(symbol='SYM1', name='curr 1', category='currency')
        e2 = Equipment(symbol='SYM2', name='curr 2', category='currency')
        e3 = Equipment(symbol='SYM3', name='curr 3', category='currency')

        e1.save()
        e2.save()
        e3.save()

        Parity(base_equipment=e1, target_equipment=e2, ratio=1.23).save()
        Parity(base_equipment=e1, target_equipment=e2, ratio=1.24).save()
        Parity(base_equipment=e1, target_equipment=e2, ratio=1.50).save()

        Parity(base_equipment=e2, target_equipment=e3, ratio=2.44).save()
        Parity(base_equipment=e2, target_equipment=e3, ratio=2.50).save()

    def test(self):
        response = self.client.get('/parity/')

        self.assertEqual(response.status_code, status.HTTP_200_OK)

        data = response.data

        self.assertEqual(len(data), 2)

        self.assertTrue({'base': 'SYM1', 'target': 'SYM2'} in data)
        self.assertTrue({'base': 'SYM2', 'target': 'SYM3'} in data)


class InvestmentProfitTestCase(APITestCase):
    def setUp(self):
        user = User(username="sam", email="sam@gmail.com")
        user.set_password("1234")
        user.save()
        e1 = Equipment(symbol='SYM1', name='curr 1', category='currency')
        e2 = Equipment(symbol='SYM2', name='curr 2', category='currency')
        e3 = Equipment(symbol='SYM3', name='curr 3', category='currency')
        e1.save(), e2.save(), e3.save()
        Parity(base_equipment=e1, target_equipment=e2, ratio=1.50).save()
        Parity(base_equipment=e2, target_equipment=e1, ratio=1 / 1.50).save()
        Parity(base_equipment=e1, target_equipment=e3, ratio=2.50).save()
        Parity(base_equipment=e3, target_equipment=e1, ratio=1 / 2.50).save()
        Parity(base_equipment=e2, target_equipment=e3, ratio=5).save()
        Parity(base_equipment=e3, target_equipment=e2, ratio=1 / 5).save()
        ManualInvestment(base_equipment=e1, target_equipment=e2,
                         base_amount=200, target_amount=100, made_by=user).save()


    def test_single_investment(self):
        response = self.client.post('/login/', data={'email': 'sam@gmail.com', 'password': '1234'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertTrue("token" in response.data)
        token = response.data["token"]
        token = "jwt " + token

        self.client.credentials(HTTP_AUTHORIZATION=token)
        response = self.client.get('/investments/')

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        investment_id = response.json()["investments"][0]["id"]
        response = self.client.post('/investments/profit',
                                    data={"investment_id": investment_id, "symbol": "SYM1"})

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        profit = response.data["profit"]
        self.assertEqual(profit, -133.33)
        response = self.client.post('/investments/total_profit',
                                    data={"symbol": "SYM1"})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data["total_profit"], -133.33)

    def test_invalid_symbol(self):
        response = self.client.post('/login/', data={'email': 'sam@gmail.com', 'password': '1234'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertTrue("token" in response.data)
        token = response.data["token"]
        token = "jwt " + token

        self.client.credentials(HTTP_AUTHORIZATION=token)
        response = self.client.get('/investments/')

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        investment_id = response.json()["investments"][0]["id"]
        response = self.client.post('/investments/profit',
                                    data={"investment_id": investment_id, "symbol": "SYM5"})
        self.assertTrue(response.status_code, status.HTTP_404_NOT_FOUND)


class TotalProfitTestCase(APITestCase):
    def setUp(self):
        user = User(username="sam", email="sam@gmail.com")
        user.set_password("1234")
        user.save()
        e1 = Equipment(symbol='SYM1', name='curr 1', category='currency')
        e2 = Equipment(symbol='SYM2', name='curr 2', category='currency')
        e3 = Equipment(symbol='SYM3', name='curr 3', category='currency')
        e1.save(), e2.save(), e3.save()
        Parity(base_equipment=e1, target_equipment=e2, ratio=1.50).save()
        Parity(base_equipment=e2, target_equipment=e1, ratio=1 / 1.50).save()
        Parity(base_equipment=e1, target_equipment=e3, ratio=2.50).save()
        Parity(base_equipment=e3, target_equipment=e1, ratio=1 / 2.50).save()
        Parity(base_equipment=e2, target_equipment=e3, ratio=5).save()
        Parity(base_equipment=e3, target_equipment=e2, ratio=1 / 5).save()
        ManualInvestment(base_equipment=e1, target_equipment=e2,
                         base_amount=200, target_amount=100, made_by=user).save()
        ManualInvestment(base_equipment=e1, target_equipment=e3,
                        base_amount=300, target_amount=100, made_by=user).save()


    def test_multiple_investment(self):
        response = self.client.post('/login/', data={'email': 'sam@gmail.com', 'password': '1234'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertTrue("token" in response.data)
        token = response.data["token"]
        token = "jwt " + token

        self.client.credentials(HTTP_AUTHORIZATION=token)

        response = self.client.post('/investments/total_profit',
                                    data={"symbol": "SYM2"})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data["total_profit"], -630)

    def test_invalid_symbol(self):
        response = self.client.post('/login/', data={'email': 'sam@gmail.com', 'password': '1234'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertTrue("token" in response.data)
        token = response.data["token"]
        token = "jwt " + token

        self.client.credentials(HTTP_AUTHORIZATION=token)

        response = self.client.post('/investments/total_profit',
                                    data={"symbol": "SYM6"})
        self.assertTrue(response.status_code, status.HTTP_404_NOT_FOUND)


class InvestmentDeleteTestCase(APITestCase):
    def setUp(self):
        user1 = User(username="jack", email="jack@gmail.com")
        user1.set_password("12345")
        user1.save()
        user2 = User(username="sam", email="sam@gmail.com")
        user2.set_password("1234")
        user2.save()
        e1 = Equipment(symbol='SYM1', name='curr 1', category='currency')
        e2 = Equipment(symbol='SYM2', name='curr 2', category='currency')
        e3 = Equipment(symbol='SYM3', name='curr 3', category='currency')
        e1.save(), e2.save(), e3.save()
        Parity(base_equipment=e1, target_equipment=e2, ratio=1.50).save()
        Parity(base_equipment=e2, target_equipment=e1, ratio=1 / 1.50).save()
        Parity(base_equipment=e1, target_equipment=e3, ratio=2.50).save()
        Parity(base_equipment=e3, target_equipment=e1, ratio=1 / 2.50).save()
        Parity(base_equipment=e2, target_equipment=e3, ratio=5).save()
        Parity(base_equipment=e3, target_equipment=e2, ratio=1 / 5).save()
        ManualInvestment(base_equipment=e1, target_equipment=e2,
                         base_amount=200, target_amount=100, made_by=user2).save()

    def test_delete_investment(self):
        response = self.client.post('/login/', data={'email': 'sam@gmail.com', 'password': '1234'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertTrue("token" in response.data)
        token = response.data["token"]
        token = "jwt " + token

        self.client.credentials(HTTP_AUTHORIZATION=token)
        response = self.client.get('/investments/')

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        investment_id = str(response.json()["investments"][0]["id"])

        response = self.client.delete('/investments/', data={'id': investment_id})
  
        self.assertEqual(response.status_code, status.HTTP_200_OK)


    def test_invalid_delete_investment(self):
        response = self.client.post('/login/', data={'email': 'sam@gmail.com', 'password': '1234'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertTrue("token" in response.data)
        token = response.data["token"]
        token = "jwt " + token

        self.client.credentials(HTTP_AUTHORIZATION=token)
        response = self.client.get('/investments/')

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        investment_id = str(response.json()["investments"][0]["id"])
        
        response = self.client.post('/login/', data={'email': 'jack@gmail.com', 'password': '12345'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertTrue("token" in response.data)
        token = response.data["token"]
        token = "jwt " + token

        self.client.credentials(HTTP_AUTHORIZATION=token)
        response = self.client.delete('/investments/', data={'id': investment_id})
  
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.assertEqual(response.data, {'message': 'User does not have investment with id: ' + str(investment_id)})