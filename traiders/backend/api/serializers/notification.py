from rest_framework import serializers

from ..models import Notification


class NotificationSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Notification
        fields = ["url", "user", "message", "reference_obj", "reference_url", "seen", "id"]
        read_only_fields = ["url", "user", "message", "reference_obj", "reference_url", "id"]

    def update(self, instance: Notification, validated_data: dict):
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