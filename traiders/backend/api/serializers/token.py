import logging
import requests as rq

from django.conf import settings
from rest_framework.authtoken.models import Token
from rest_framework import serializers

from ..models import User
from .users import UserSerializer

logger = logging.getLogger(__name__)


class TokenSerializer(serializers.Serializer):
    username = serializers.CharField(label='Username',
                                     write_only=True,
                                     required=False)
    password = serializers.CharField(label='Password',
                                     write_only=True,
                                     required=False,
                                     style={'input_type': 'password'})
    google_auth_code = serializers.CharField(label='Google authCode',
                                             required=False)

    key = serializers.CharField(read_only=True)
    user = UserSerializer(read_only=True)

    def validate_username_password(self, username, password):
        user = None
        try:
            user = User.objects.get(username=username)
        except User.DoesNotExist:
            pass

        if not user or not user.check_password(password):
            raise serializers.ValidationError('Unable to login with provided username and password.',
                                              code='authorization')

        return {'user': user}

    def validate_auth_code(self, auth_code):
        data = {
            'grant_type': 'authorization_code',
            'client_id': settings.GOOGLE_OAUTH_ID,
            'client_secret': settings.GOOGLE_OAUTH_SECRET,
            'redirect_uri': 'http://localhost:8000/',
            'code': auth_code,
        }

        response = rq.post('https://www.googleapis.com/oauth2/v4/token', json=data)

        try:
            params = {
                'access_token': response.json()['access_token']
            }
        except Exception as e:
            logger.exception(f'Failed to get access_token from google, '
                             f'status={response.status_code}'
                             f'message={response.text}')
            raise serializers.ValidationError('Could not get access_token')

        response = rq.get('https://www.googleapis.com/userinfo/v2/me', params=params)

        try:
            data = response.json()
            email = data['email']
            user = User.objects.filter(email=email).first()
            if not user:
                user = User(email=email,
                            first_name=data['given_name'],
                            last_name=data['family_name'],
                            username=email.split('@')[0],
                            city='Istanbul',  # TODO maybe get city and country somehow
                            email_verified=True)
            return {'user': user}
        except Exception as e:
            logger.exception(f'Failed to get user info from google, '
                             f'status={response.status_code}'
                             f'message={response.text}')
            raise serializers.ValidationError('Could not get user info')

    def validate(self, attrs):
        if 'username' in attrs and 'password' in attrs:
            username = attrs.get('username')
            password = attrs.get('password')
            return self.validate_username_password(username, password)
        elif 'google_auth_code' in attrs:
            auth_code = attrs.get('google_auth_code')
            return self.validate_auth_code(auth_code)
        else:
            raise serializers.ValidationError('Either provide username and password or google_auth_code')

    def create(self, validated_data):
        validated_data['user'].save()
        token, _ = Token.objects.get_or_create(**validated_data)
        return token
