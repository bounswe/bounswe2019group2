from rest_framework import serializers
from ..models import Portfolio, EquipmentPair
from django.contrib.auth.models import AnonymousUser


class IsFollowingField(serializers.BooleanField):
    def get_attribute(self, instance: Portfolio):
        return instance.followed_by.filter(pk=self.context['request'].user.pk).exists()

class EquipmentPairSerializer(serializers.ModelSerializer):
    class Meta:
        model = EquipmentPair
        fields = ['target_equipment', 'base_equipment', 'id']


class PortfolioSerializer(serializers.HyperlinkedModelSerializer):
    is_following = IsFollowingField()
    parities = EquipmentPairSerializer(many=True)

    class Meta:
        model = Portfolio
        fields = ["url", "id", "name", "user", "parities", "is_following"]
        read_only_fields = ["user"]

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
        current_parities = validated_data.pop('parities', None)
        if 'parities' in validated_data:
            parities = []
            for parity_data in current_parities:
                eq_pair = EquipmentPair(**parity_data)
                eq_pair.save()
                parities.append(eq_pair)
            instance.parities.set(parities)

        return super().update(instance, validated_data)
