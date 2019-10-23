from rest_framework import serializers
from ..models import Following
from django.db import models


ACCEPTED = 1
PENDING = 0


class FollowingSerializer(serializers.HyperlinkedModelSerializer):

    def validate(self, data):
        request = self.context['request']
        following = request.user
        if getattr(request, 'method', None) == "POST":
            followed = data.get("user_followed", None)
            data["user_following"] = following
            try:
                obj = Following.objects.get(user_following=following,
                                            user_followed=followed)
            except models.ObjectDoesNotExist:
                obj = None

            if obj:
                raise serializers.ValidationError("The user already follows the requested user.")

            if not followed.is_private:
                data["status"] = ACCEPTED

            if (following is not None) and (followed is not None):
                if following == followed:
                    raise serializers.ValidationError("Users cannot follow themselves.")

        return data

    def get_fields(self, *args, **kwargs):
        fields = super(FollowingSerializer, self).get_fields(*args, **kwargs)
        request = self.context.get('request', None)

        req_type = getattr(request, 'method', None)
        if request and req_type in ["PUT", "POST"]:
            fields['user_following'].read_only = True
            fields['status'].read_only = True

        if request and req_type == "GET":
            following = request.query_params.get("user_following", None)
            followed = request.query_params.get("user_followed", None)
            pk = request.parser_context["kwargs"].get("pk", None)
            if (following is None) and (followed is None) and (pk is None):
                raise serializers.ValidationError('Please provide a user to see who is '
                                                  'following them or who they follow.')
        return fields

    class Meta:
        model = Following
        fields = ["url", "id", "user_following", "user_followed", "status"]
