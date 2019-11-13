from django.contrib.auth.hashers import make_password

from rest_framework import serializers
from ..models.users import User
from django_countries.serializer_fields import CountryField
from django_countries import Countries

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

    def validate(self, data):
        if data.get('is_trader') and not data.get('iban'):
            raise serializers.ValidationError('Trader users should specify their IBAN.')
        return data

    class Meta:
        model = User

        exclude = ['last_login', 'is_superuser', 'is_staff', 'is_active', 'groups', 'user_permissions']
        read_only_fields = ['id', 'date_joined']
        extra_kwargs = {
            'password': {'write_only': True,  # password is never read
                         'style': {'input_type': 'password'}},
            'email': {'required': True},
            'username': {'required': True},
            'first_name': {'required': True},
            'last_name': {'required': True},
        }
