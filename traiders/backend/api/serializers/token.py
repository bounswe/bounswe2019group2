from rest_framework.authtoken.models import Token
from rest_framework import serializers

from ..models import User


class TokenSerializer(serializers.Serializer):
    username = serializers.CharField(label='Username',
                                     write_only=True,
                                     required=True)
    password = serializers.CharField(label='Password',
                                     write_only=True,
                                     required=True,
                                     style={'input_type': 'password'})

    key = serializers.CharField(read_only=True)
    user = serializers.HyperlinkedRelatedField(read_only=True, view_name='user-detail')

    def validate(self, attrs):
        username = attrs.get('username')
        password = attrs.get('password')

        user = None
        try:
            user = User.objects.get(username=username)
        except User.DoesNotExist:
            pass

        if not user or not user.check_password(password):
            raise serializers.ValidationError('Unable to login with provided username and password.',
                                              code='authorization')

        return {'user': user}

    def create(self, validated_data):
        token, _ = Token.objects.get_or_create(**validated_data)
        return token
