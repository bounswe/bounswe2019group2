from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status
from rest_framework.authtoken.models import Token

from ..models import User, Following


class FollowingViewSetTests(APITestCase):
    def setUp(self):
        data = [
            {
                'username': 'marry48',
                'first_name': 'Marry',
                'last_name': 'Smith',
                'email': 'me@marrysmith.com',
                'city': 'New York City',
                'country': 'United States',
                'is_private': False
            },
            {
                'username': 'hasan56',
                'first_name': 'Hasan',
                'last_name': 'Demir',
                'email': 'hasan@mail.com',
                'city': 'Kayseri',
                'country': 'Turkey',
                'is_private': True
            },
            {
                'username': 'nese45',
                'first_name': 'Nese',
                'last_name': 'Toprak',
                'email': 'nese@mail.com',
                'city': 'Ankara',
                'country': 'Turkey',
                'is_private': True
            }
        ]

        passwords = ['fsfFS2ds', 'sdfsEdfs', '4efdfgds']

        self.users = []
        self.tokens = []
        for d, p in zip(data, passwords):
            user = User(**d)
            user.set_password(p)
            user.save()
            token = Token.objects.create(user=user)
            self.users.append(user)
            self.tokens.append(token.key)

        # nese follows marry
        Following.objects.create(user_following=self.users[2], user_followed=self.users[0], status=Following.ACCEPTED)

        # marry request to follow hasan
        Following.objects.create(user_following=self.users[0], user_followed=self.users[1], status=Following.PENDING)

        # hasan follows nese
        Following.objects.create(user_following=self.users[1], user_followed=self.users[2], status=Following.ACCEPTED)

    def test_create_for_private(self):
        # nese will try to follow hasan

        url = reverse('following-list')
        data = {
            'user_followed': reverse('user-detail', kwargs={'pk': self.users[1].pk})
        }

        # try without logging in
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.tokens[2])
        response = self.client.post(url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        # ensure a follow request is created
        self.assertEqual(Following.objects.filter(user_following=self.users[2],
                                                  user_followed=self.users[1],
                                                  status=Following.PENDING).count(), 1)

    def test_create_for_public(self):
        # hasan will try to follow marry

        url = reverse('following-list')
        data = {
            'user_followed': reverse('user-detail', kwargs={'pk': self.users[0].pk})
        }

        # try without logging in
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.tokens[1])
        response = self.client.post(url, data, format='json')

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

        # ensure a follow is created
        self.assertEqual(Following.objects.filter(user_following=self.users[1],
                                                  user_followed=self.users[0],
                                                  status=Following.ACCEPTED).count(), 1)

    def test_delete_follow_request(self):
        url = reverse('following-detail', kwargs={'pk': Following.objects.get(user_following=self.users[0],
                                                                              user_followed=self.users[1]).pk})

        # try as anonymous
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # try as nese
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.tokens[2])
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        # try as hasan
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.tokens[1])
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)

        # ensure deleted
        self.assertFalse(Following.objects.filter(user_following=self.users[0],
                                                  user_followed=self.users[1]).exists())

    def test_accept(self):
        url = reverse('following-detail', kwargs={'pk': Following.objects.get(user_following=self.users[0],
                                                                              user_followed=self.users[1]).pk})

        # try as anonymous
        response = self.client.patch(url, data={'status': Following.ACCEPTED})
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # try as nese
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.tokens[2])
        response = self.client.patch(url, data={'status': Following.ACCEPTED})
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        # try as marry
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.tokens[0])
        response = self.client.patch(url, data={'status': Following.ACCEPTED})
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        # try as hasan
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.tokens[1])
        response = self.client.patch(url, data={'status': Following.ACCEPTED})
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        self.assertTrue(Following.objects.filter(user_following=self.users[0],
                                                 user_followed=self.users[1],
                                                 status=Following.ACCEPTED).exists())

    def test_list(self):
        url = reverse('following-list')

        response = self.client.get(url)
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

        response = self.client.get(url + f'?user_followed={self.users[2].pk}')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)

        response = self.client.get(url + f'?user_followed={self.users[1].pk}')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)

        response = self.client.get(url + f'?user_followed={self.users[1].pk}&status={Following.ACCEPTED}')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 0)
