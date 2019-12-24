from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status
from django.utils import timezone
from rest_framework.authtoken.models import Token

from ..models import *


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
            'title': 'Risk',
            'content': 'High risk environments attract high income players.',
        }
        self.article = Article(**data)
        self.article.save()

        self.article_comment = ArticleComment(user=self.user2, content='Totally agreed. One example is myself',
                                              article=self.article)
        self.article_comment.save()

        data = {
            'name': 'U.S. Dollars',
            'category': 'currency',
            'symbol': 'USD'
        }
        self.equipment = Equipment(**data)
        self.equipment.save()

        self.equipment_comment = EquipmentComment(user=self.user2,
                                                  content='My favourite investment tool',
                                                  equipment=self.equipment)
        self.equipment_comment.save()

    def test_equipment_comment_like(self):
        pk = self.equipment_comment.pk
        url = reverse('equipmentcomment-detail', kwargs={'pk': pk})
        is_liked = True
        # test liking without a token
        response = self.client.patch(url, {'is_liked': is_liked}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # test with a user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key)
        response = self.client.patch(url, {'is_liked': True}, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        # test if updated
        self.assertEqual(self.user in EquipmentComment.objects.get(pk=pk).liked_by.all(),
                         True)

    def test_equipment_comment_unlike(self):
        pk = self.equipment_comment.pk
        url = reverse('equipmentcomment-detail', kwargs={'pk': pk})
        is_liked = True

        # Like a comment
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.patch(url, {'is_liked': is_liked}, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        # Unike a comment
        is_liked = False
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.patch(url, {'is_liked': is_liked}, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        # test if updated
        self.assertEqual(self.user2 in EquipmentComment.objects.get(pk=pk).liked_by.all(),
                         False)

    def test_equipment_comment_try_liking_twice(self):
        pk = self.equipment_comment.pk
        url = reverse('equipmentcomment-detail', kwargs={'pk': pk})

        # like a comment
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.patch(url, {'is_liked': True}, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        # try liking again
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.patch(url, {'is_liked': True}, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_article_comment_like(self):
        pk = self.equipment_comment.pk
        url = reverse('articlecomment-detail', kwargs={'pk': pk})
        is_liked = True
        # test liking without a token
        response = self.client.patch(url, {'is_liked': is_liked}, format='json')
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED)

        # test with a user
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.patch(url, {'is_liked': True}, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        # test if updated
        self.assertEqual(self.user2 in ArticleComment.objects.get(pk=pk).liked_by.all(),
                         True)

    def test_article_comment_unlike(self):
        pk = self.equipment_comment.pk
        url = reverse('articlecomment-detail', kwargs={'pk': pk})
        is_liked = True

        # Like a comment
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.patch(url, {'is_liked': is_liked}, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        # Unike a comment
        is_liked = False
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.patch(url, {'is_liked': is_liked}, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

        # test if updated
        self.assertEqual(self.user2 in ArticleComment.objects.get(pk=pk).liked_by.all(),
                         False)

    def test_article_comment_unliking_already_not_liked(self):
        pk = self.equipment_comment.pk
        url = reverse('articlecomment-detail', kwargs={'pk': pk})

        # like a comment
        self.client.credentials(HTTP_AUTHORIZATION='Token ' + self.auth_key2)
        response = self.client.patch(url, {'is_liked': False}, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
