from rest_framework import serializers, exceptions
from ..models import Portfolio, PortfolioItem, Equipment
from ..serializers import UserSerializer


class IsFollowingField(serializers.BooleanField):
    def get_attribute(self, instance: Portfolio):
        return instance.followed_by.filter(pk=self.context['request'].user.pk).exists()


class PortfolioItemSerializer(serializers.HyperlinkedModelSerializer):
    target_equipment = serializers.CharField(source='target_equipment.symbol')
    base_equipment = serializers.CharField(source='base_equipment.symbol')

    def create(self, validated_data):
        if validated_data['portfolio'].user != self.context['request'].user:
            raise exceptions.PermissionDenied("Cant add items to others' portfolios")

        def _find_equipment(data):
            return Equipment.objects.filter(**data).first()

        for key in ['base_equipment', 'target_equipment']:
            validated_data[key] = _find_equipment(validated_data[key])

        return PortfolioItem.objects.create(**validated_data)

    class Meta:
        model = PortfolioItem
        fields = ['url', 'target_equipment', 'base_equipment', 'portfolio', 'id']


class PortfolioSerializer(serializers.HyperlinkedModelSerializer):
    is_following = IsFollowingField(required=False)
    user = UserSerializer(read_only=True)
    portfolio_items = PortfolioItemSerializer(many=True, read_only=True)

    class Meta:
        model = Portfolio
        fields = ["url", "id", "name", "user", "is_following", "portfolio_items"]
        read_only_fields = ["user", "portfolio_items"]

    def create(self, validated_data):
        validated_data['user'] = self.context['request'].user
        return super().create(validated_data)

    def update(self, instance: Portfolio, validated_data: dict):
        is_following = validated_data.pop('is_following', None)
        name = validated_data.pop('name', None)
        user = instance.user
        followers = instance.followed_by.all()
        if is_following is True:
            if self.context['request'].user == user:
                raise serializers.ValidationError('A user cannot follow his/her own portfolio.')
            if self.context['request'].user not in followers:
                instance.followed_by.add(self.context['request'].user)
        elif is_following is False:
            if self.context['request'].user in followers:
                instance.followed_by.remove(self.context['request'].user)

        # another user cannot change the name of portfolio
        if name is not None and name != instance.name and self.context['request'].user != user:
            raise serializers.ValidationError("A user cannot update the name of another user's portfolio.")

        return super().update(instance, validated_data)
