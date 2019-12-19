from rest_framework import serializers

from ..models import Notification


class NotificationSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Notification
        fields = ["url", "user", "message", "reference_obj", "reference_url", "id"]
        read_only_fields = ["url", "user", "message", "reference_obj", "reference_url", "id"]
