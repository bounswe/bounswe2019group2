from rest_framework import serializers
from ..models import Following


class FollowingSerializer(serializers.HyperlinkedModelSerializer):

    def validate(self, data):
        request = self.context['request']
        sending_user = request.user
        if getattr(request, 'method', None) == "POST":
            following = data.get("user_following", None)
            if (following is not None) and (sending_user != following):
                raise serializers.ValidationError("A user can only send a follow request on "
                                                  "their behalf.")

            follower = data.get("user_followed", None)
            if (following is not None) and (follower is not None):
                if following == follower:
                    raise serializers.ValidationError("Users cannot follow themselves.")
        return data

    def get_fields(self, *args, **kwargs):
        fields = super(FollowingSerializer, self).get_fields(*args, **kwargs)
        request = self.context.get('request', None)

        if request and getattr(request, 'method', None) == "PUT":
            fields['from_user'].read_only = True

        following = request.query_params.get("user_following", None)
        followed = request.query_params.get("user_followed", None)
        if getattr(request, 'method', None) == "GET" and (following is None) and (followed is None):
            raise serializers.ValidationError('Please provide a user to see who is '
                                              'following them or who they follow.')
        return fields

    class Meta:
        model = Following
        fields = ["url", "id", "user_following", "user_followed"]
