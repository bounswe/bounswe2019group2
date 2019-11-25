
from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status
from rest_framework.authtoken.models import Token
from ..models import Like, Article, User


class PortfolioViewSetTests(APITestCase):
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

        data = {
            'author': self.user,
            'title': 'Brexit',
            'content': 'It is expected that Brexit will have negative impact on British economy.',
        }
        self.article2 = Article(**data)
        self.article2.save()

        data = {
            'user': self.user,
            'article': self.article2,
        }
        self.like = Like(**data)
        self.like.save()

    def test_create(self):
        url = reverse('like-list')
        pk = Article.objects.get(title='Uncertainty').pk
        data = reverse('article-detail', kwargs={'pk': pk})  # article url

        # test without token
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # test with token
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.post(url, {'article': data}, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Like.objects.filter(article=self.article, user=self.user).count(), 1)

    def test_delete(self):
        pk = self.like.pk
        url = reverse('like-detail', kwargs={'pk': pk})

        # test without token
        self.client.credentials(HTTP_AUTHORIZATION='Token ')
        response = self.client.delete(url)
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
        pk = self.like.pk
        url = reverse('like-detail', kwargs={'pk': pk})
        response = self.client.get(url)

        expected_fields = {
            'url', 'user', 'article',
        }
        self.assertSetEqual(expected_fields, set(response.data.keys()))

    def test_retrieve_article(self):
        url = reverse('like-list')

        # create article
        data = {
            'author': self.user,
            'title': 'Economic Crisis',
            'content': 'Emerging markets become more able to withstand a crisis.',
        }
        self.article3 = Article(**data)
        self.article3.save()
        article_url = reverse('article-detail', kwargs={'pk': self.article3.pk})

        # user1 and user2 likes the article
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        self.client.post(url, {'article': article_url}, format='json')
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        self.client.post(url, {'article': article_url}, format='json')

        # check the num_like of article
        response = self.client.get(article_url)
        num_likes = response.data['num_likes']
        self.assertEqual(num_likes, 2)

        # check if article is liked by user2
        like = response.data['like']
        user_url = 'http://testserver' + reverse('user-detail', kwargs={'pk': self.user2.pk})
        is_liked = like['user'] == user_url
        self.assertEqual(is_liked, True)
