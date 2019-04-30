from django.db.models import Q
from rest_framework import serializers
from login.models import *
from rest_framework_jwt.settings import api_settings

jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = RegisteredUser
        fields = [
            "id",
            "username",
            "first_name",
            "last_name",
            "balance"
        ]


class LoginSerializer(serializers.ModelSerializer):
    token = serializers.CharField(allow_blank=True, read_only=True)
    user = UserSerializer(read_only=True)

    class Meta:
        model = RegisteredUser
        fields = [
            'token',
            'user',
            'email',
            'password'
        ]
        extra_kwargs = {
            "password": {"write_only": True},
            "email": {"write_only": True}
        }

    def validate(self, data):
        email = data.get("email")
        user = RegisteredUser.objects.filter(email=email)
        if user.exists():
            password = data['password']
            user = user.first()
            if user.check_password(password):
                payload = jwt_payload_handler(user)
                token = jwt_encode_handler(payload)
                data["token"] = token
                data["user"] = user
                return data
            else:
                raise serializers.ValidationError({"detail": "Incorrect credentials"})
        else:
            raise serializers.ValidationError({"detail": "Incorrect credentials"})