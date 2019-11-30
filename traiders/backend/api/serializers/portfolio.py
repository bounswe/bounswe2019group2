from rest_framework import serializers
from ..models import Portfolio
from django.contrib.auth.models import AnonymousUser


class IsFollowingField(serializers.BooleanField):
    def get_attribute(self, instance: Portfolio):
        return instance.followed_by.filter(pk=self.context['request'].user.pk).exists()


class PortfolioSerializer(serializers.HyperlinkedModelSerializer):
    is_following = IsFollowingField()

    def get_fields(self):
        fields = super().get_fields()
        view = self.context.get('view')
        if view and self.context['request'].user != fields['user']:
            fields['name'].read_only = True
            fields['parities'].read_only = True
            fields['user'].read_only = True
        return fields

    class Meta:
        model = Portfolio
        fields = ["name", "user", "followed_by", "parities"]

    def update(self, instance: Portfolio, validated_data: dict):
        is_following = validated_data.pop('is_following', None)

        if isinstance(self.context['request'].user, AnonymousUser):
            raise serializers.ValidationError('A guest user cannot follow a portfolio. '
                                              'Please login to perform this action.')

        followers = instance.followed_by.all()
        if is_following is True:
            if self.context['request'].user in followers:
                raise serializers.ValidationError('You already follow this event.')
            if self.context['request'].user in followers:
                raise serializers.ValidationError('A user cannot follow his/her own portfolio.')
            instance.followed_by.add(self.context['request'].user)
        elif is_following is False:
            if self.context['request'].user not in followers:
                raise serializers.ValidationError('You already do not follow this event.')
            instance.followed_by.remove(self.context['request'].user)

        return super().update(instance, validated_data)
