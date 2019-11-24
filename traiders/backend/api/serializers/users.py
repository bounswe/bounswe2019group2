from django.contrib.auth.hashers import make_password
import requests as rq

from ..models.users import User
from django.core.mail import EmailMessage
from rest_framework import serializers
from django_countries.serializer_fields import CountryField
from django_countries import Countries
from django.template.loader import render_to_string
from django.urls import reverse

from ..utils import EmailVerificationTokenGenerator

options = Countries()


class UserSerializer(serializers.HyperlinkedModelSerializer):
    country = CountryField(country_dict=True)

    def validate_country(self, code_or_name):
        if options.name(code_or_name):  # given string is code
            return code_or_name

        code = options.by_name(code_or_name)
        if code:
            return code
        else:
            raise serializers.ValidationError(f'{code_or_name} is not a valid country name or code')

    @staticmethod
    def validate_password(password):
        return make_password(password)  # password hashing

    @staticmethod
    def validate_iban(iban):
        res = rq.get(f'https://openiban.com/validate/{iban}')

        if res.status_code != 200 or not res.json().get('valid'):
            raise serializers.ValidationError('Enter a valid IBAN')

        return iban

    def validate(self, data):
        if data.get('is_trader') and not data.get('iban'):
            raise serializers.ValidationError('Trader users should specify their IBAN.')
        return data

    def _send_verification_email(self, user):
        token_generator = EmailVerificationTokenGenerator()
        token = token_generator.make_token(user)

        link = self.context['request'].build_absolute_uri(
            f"{reverse('verify-email', args=(user.pk,))}?token={token}"
        )

        message = render_to_string('verification_email.txt', {
            'user': user,
            'link': link
        })

        email = EmailMessage(
            'Verify your TrAiders account',
            message,
            to=[user.email]
        )

        email.send()

    def create(self, validated_data):
        user = super().create(validated_data)
        self._send_verification_email(user)
        return user

    def update(self, instance, validated_data):
        is_email_updated = ('email' in validated_data) and (instance.email != validated_data['email'])
        user = super().update(instance, validated_data)
        if is_email_updated:
            user.email_verified = False
            user.save()
            self._send_verification_email(user)
        return user

    class Meta:
        model = User
        fields = ["url", "country", "id", "username", "first_name", "last_name", "email",
                  "date_joined", "is_trader", "iban", "is_trader", "city", "avatar", "is_private", "password"]
        read_only_fields = ['id', 'date_joined']
        extra_kwargs = {
            'password': {'write_only': True,  # password is never read
                         'style': {'input_type': 'password'}},
            'email': {'required': True},
            'username': {'required': True},
            'first_name': {'required': True},
            'last_name': {'required': True},
        }
