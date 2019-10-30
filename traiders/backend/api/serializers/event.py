from rest_framework import serializers
from ..models import Event
from django_countries.serializer_fields import CountryField
from django.contrib.auth.models import AnonymousUser


class IsFollowingField(serializers.BooleanField):
    def get_attribute(self, instance: Event):
        if self.context['request'].user.is_anonymous:
            return False
        return instance.followed_by.filter(pk=self.context['request'].user.pk).exists()


class EventSerializer(serializers.HyperlinkedModelSerializer):
    country = CountryField(country_dict=True, read_only=True)
    is_following = IsFollowingField()

    class Meta:
        model = Event
        fields = ["is_following", "url", "id", "date", "country", "calendarId", "category",
                  "actual", "previous", "forecast", "sourceURL", "importance"]

    def update(self, instance: Event, validated_data: dict):
        is_following = validated_data.pop('is_following', None)

        followers = instance.followed_by.all()
        if is_following is True:
            if self.context['request'].user.is_anonymous:
                raise serializers.ValidationError('A guest user cannot follow an event. '
                                                  'Please login to perform this action.')
            if self.context['request'].user in followers:
                raise serializers.ValidationError('You already follow this event.')
            instance.followed_by.add(self.context['request'].user)
        elif is_following is False:
            if self.context['request'].user.is_anonymous:
                raise serializers.ValidationError('A guest user cannot unfollow an event. '
                                                  'Please login to perform this action.')
            if self.context['request'].user not in followers:
                raise serializers.ValidationError('You already do not follow this event.')
            instance.followed_by.remove(self.context['request'].user)

        return super().update(instance, validated_data)
