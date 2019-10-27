from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status
from django.utils import timezone
from rest_framework.authtoken.models import Token

from ..models import Article, User, ArticleComment


class ArticleCommentViewSetTests(APITestCase):
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

        self.article_comment = ArticleComment(user=self.user2, content='agreed.', article=self.article)
        self.article_comment.save()

    def test_create(self):
        url = reverse('articlecomment-list')

        data = {
            'content': 'thank you, user2',
            'article': reverse('article-detail', kwargs={'pk': self.article.pk})
        }

        # test without token
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # test with token
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(ArticleComment.objects.filter(article=self.article, user=self.user).count(), 1)

    def test_update(self):
        pk = self.article_comment.pk
        url = reverse('articlecomment-detail', kwargs={'pk': pk})
        content = 'updated content'

        # test without token
        response = self.client.patch(url, {'content': content}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # test with different user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.patch(url, {'content': content}, format='json')
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        # test with correct user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.patch(url, {'content': content}, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        # test if updated
        self.assertEqual(ArticleComment.objects.get(pk=pk).content, content)

    def test_delete(self):
        pk = self.article_comment.pk
        url = reverse('articlecomment-detail', kwargs={'pk': pk})

        # test without token
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # test with different user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

        # test with correct user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.delete(url)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)

        # test if deleted
        self.assertFalse(ArticleComment.objects.exists())

    def test_retrieve(self):
        pk = self.article_comment.pk
        url = reverse('articlecomment-detail', kwargs={'pk': pk})
        response = self.client.get(url)

        expected_fields = {
            'url', 'user', 'article', 'created_at', 'content', 'image', 'id'
        }
        self.assertSetEqual(set(response.data.keys()), expected_fields)

    def test_list_without_filter(self):
        url = reverse('articlecomment-list')
        response = self.client.get(url)

        # listing without article filter is not allowed
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_list_with_filter(self):
        url = f"{reverse('articlecomment-list')}?article={self.article.pk}"
        response = self.client.get(url)

        self.assertEqual(response.status_code, status.HTTP_200_OK)

        comments = response.data
        self.assertEqual(len(comments), 1)  # check the number of articles returned

        expected_fields = {'content', 'article', 'url', 'created_at', 'image', 'user', 'id'}

        self.assertSetEqual(set(comments[0].keys()), expected_fields)
