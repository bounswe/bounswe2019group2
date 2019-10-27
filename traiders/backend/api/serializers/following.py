from rest_framework import serializers
from rest_framework.exceptions import PermissionDenied
from ..models import Following
from django.db import models


class FollowingSerializer(serializers.HyperlinkedModelSerializer):

    def create(self, validated_data):
        request = self.context['request']
        validated_data['user_following'] = request.user

        # if user is not private, status is ACCEPTED
        if validated_data['user_followed'].is_private:
            validated_data['status'] = Following.PENDING
        else:
            validated_data['status'] = Following.ACCEPTED

        return super().create(validated_data)

    def validate_user_followed(self, user_followed):
        request = self.context['request']

        if request.user == user_followed:
            raise serializers.ValidationError('You cannot follow yourself.')

        return user_followed

    def get_fields(self):
        fields = super().get_fields()
        view = self.context.get('view', None)

        # user_followed can be written only when creating
        if view.action != 'create':
            fields['user_followed'].read_only = True

        # status can be written only when updating (accepting)
        if view.action not in ('update', 'partial_update'):
            fields['status'].read_only = True

        return fields

    class Meta:
        model = Following
        fields = ['url', 'id', 'user_following', 'user_followed', 'status']
        read_only_fields = ['url', 'id', 'user_following']
