from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status
from rest_framework.authtoken.models import Token

from ..models import User, Following


class UserViewSetTests(APITestCase):
    def setUp(self):
        data = {
            'username': 'marry48',
            'first_name': 'Marry',
            'last_name': 'Smith',
            'email': 'me@marrysmith.com',
            'city': 'New York City',
            'country': 'US',
        }

        user = User(**data)
        user.set_password('sG2sf032')
        user.save()

        # create a token for the test user
        token = Token.objects.create(user=user)
        self.auth_key = token.key

        data = {
            'username': 'private_ryan',
            'first_name': 'James',
            'last_name': 'Ryan',
            'email': 'ryan@army.com',
            'city': 'Washington D.C.',
            'country': 'US',
            'is_private': True
        }
        user = User(**data)
        user.set_password('fsfST4rf')
        user.save()

    def test_create_with_country_name(self):
        url = reverse('user-list')
        password = 'g5Hs-s34'
        data = {
            'username': 'john56',
            'first_name': 'John',
            'last_name': 'Doe',
            'email': 'johndoe@example.com',
            'password': password,
            'city': 'Birmingham',
            'country': 'United Kingdom'
        }

        response = self.client.post(url, data, format='json')

        # test status code
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        # test if created
        del data['password']  # dont check equality of password because it is hashed
        data['country'] = 'GB'  # filter works only with code
        self.assertEqual(User.objects.filter(**data).count(), 1)
        # test password separately
        self.assertTrue(User.objects.get(**data).check_password(password))

    def test_create_with_country_code(self):
        url = reverse('user-list')
        password = 'g5Hs-s34'
        data = {
            'username': 'john56',
            'first_name': 'John',
            'last_name': 'Doe',
            'email': 'johndoe@example.com',
            'password': password,
            'city': 'Birmingham',
            'country': 'GB'
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
            'password': password,
            'city': 'Birmingham',
            'country': 'United Kingdom'
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
            'is_trader': True,
            'city': 'Birmingham',
            'country': 'United Kingdom'
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

        # try without authentication, expect to get 403
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        # try with authentication
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.patch(url, data, format='json')

        # test status code
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        # test if updated
        self.assertEqual(User.objects.filter(pk=pk, **data).count(), 1)

    def test_update_password(self):
        pk = User.objects.get(username='marry48').pk

        url = reverse('user-detail', kwargs={'pk': pk})
        password = 'ghI0dd.s'

        # try without authentication, expect 403
        response = self.client.patch(url, {'password': password}, format='json')
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        # try with authentication
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
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

        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.patch(url, data, format='json')

        # test status code
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_become_trader_with_valid_iban(self):
        pk = User.objects.get(username='marry48').pk

        url = reverse('user-detail', kwargs={'pk': pk})
        data = {
            'is_trader': True,
            'iban': 'DE89370400440532013000'
        }

        # without authentication
        response = self.client.patch(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        # with authentication
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.patch(url, data, format='json')

        # test status code
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_become_trader_with_invalid_iban(self):
        pk = User.objects.get(username='marry48').pk

        url = reverse('user-detail', kwargs={'pk': pk})
        data = {
            'is_trader': True,
            'iban': 'TR12341234123412341234123412341234'
        }

        # with authentication
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.patch(url, data, format='json')

        # test status code
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_retrieve_user(self):
        user = User.objects.get(username='marry48')

        url = reverse('user-detail', kwargs={'pk': user.pk})

        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        expected_fields = {
            'url', 'username', 'first_name', 'last_name', 'email',
            'date_joined', 'is_trader', 'iban', 'city', 'country', 'is_private',
            'avatar'
        }

        self.assertSetEqual(expected_fields, set(response.data.keys()))

    def test_retrieve_private_user(self):
        user = User.objects.get(username='private_ryan')

        url = reverse('user-detail', kwargs={'pk': user.pk})

        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

    def test_retrieve_private_user_with_following(self):
        following = Following.objects.create(user_following=User.objects.get(username='marry48'),
                                             user_followed=User.objects.get(username='private_ryan'),
                                             status=Following.PENDING)

        user = User.objects.get(username='private_ryan')
        url = reverse('user-detail', kwargs={'pk': user.pk})

        # should deny without accepting
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        # should work after accepting
        following.status = Following.ACCEPTED
        following.save()
        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_update_city_country(self):
        user = User.objects.get(username='marry48')

        url = reverse('user-detail', kwargs={'pk': user.pk})
        data = {
            'city': 'Ankara',
            'country': 'Turkey'
        }

        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.patch(url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_200_OK)

        self.assertEqual(User.objects.filter(username='marry48',
                                             city=data['city'],
                                             country='TR').count(), 1)
