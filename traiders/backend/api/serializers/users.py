from django.contrib.auth.hashers import make_password

from rest_framework import serializers
from ..models.users import User


class UserSerializer(serializers.HyperlinkedModelSerializer):
    @staticmethod
    def validate_password(password):
        return make_password(password)  # password hashing

    def validate(self, data):
        if data.get('is_trader') and not data.get('iban'):
            raise serializers.ValidationError('traders should specify IBAN')
        return data

    class Meta:
        model = User

        exclude = ['last_login', 'is_superuser', 'is_staff', 'is_active', 'groups', 'user_permissions']
        read_only_fields = ['id', 'date_joined']
        extra_kwargs = {
            'password': {'write_only': True},  # password is never read
            'email': {'required': True},
            'username': {'required': True},
            'first_name': {'required': True},
            'last_name': {'required': True},
        }
