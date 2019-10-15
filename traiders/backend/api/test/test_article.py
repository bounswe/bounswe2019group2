from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status
from django.utils import timezone
from rest_framework.authtoken.models import Token

from ..models import Article, User


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

        data = {
            'author': self.user,
            'title': 'Uncertainty',
            'content': 'Uncertainty has been a common theme throughout 2019, and the third quarter proved no different.',
        }
        self.article = Article(**data)
        self.article.save()

        data2 = {
            'author': self.user,
            'title': 'CDF',
            'content': 'ŞLALSKDŞA',
        }
        self.article2 = Article(**data2)
        self.article2.save()

        data3 = {
            'author': self.user,
            'title': 'LASKDLA',
            'content': 'ASŞLDKA',
        }
        self.article3 = Article(**data3)
        self.article3.save()

    def test_create(self):
        url = reverse('article-list')

        data = {
            'title': 'The Trade War That Never Stops',
            'content': 'Over the weekend, the White House suspended the tariff increases against Chinese goods '
                       'that were scheduled to be imposed',
        }

        # test without token
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # test with token
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Article.objects.filter(**data, author=self.user).count(), 1)

    def test_update(self):
        pk = self.article.pk
        url = reverse('article-detail', kwargs={'pk': pk})
        message = 'ABCD'

        # test without token
        response = self.client.patch(url, {'title': message}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # test with different user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.patch(url, {'content': message}, format='json')
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        # test with correct user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.patch(url, {'title': message}, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_delete(self):
        # Consider other possible DELETE responses, eg. 200, 202, 205
        pk = self.article.pk
        url = reverse('article-detail', kwargs={'pk': pk})

        # test without token
        response = self.client.delete(url, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        pk2 = self.article2.pk
        url2 = reverse('article-detail', kwargs={'pk': pk2})

        # test with different user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.delete(url2)
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        pk3 = self.article3.pk
        url3 = reverse('article-detail', kwargs={'pk': pk3})

        # test with correct user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.delete(url3)
        # self.assertIn(response.status_code,
        #               [status.HTTP_204_NO_CONTENT, status.HTTP_200_OK, status.HTTP_205_RESET_CONTENT,
        #                status.HTTP_202_ACCEPTED])
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)

    def test_retrieve(self):
        pk = self.article.pk
        url = reverse('article-detail', kwargs={'pk': pk})
        response = self.client.get(url)

        # TODO add image field properly later depending on how to store image
        expected_fields = {
            'url', 'author', 'title', 'created_at', 'content', 'image',
        }
        self.assertSetEqual(expected_fields, set(response.data.keys()))
