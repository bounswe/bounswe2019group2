from rest_framework import serializers

from ..models import Notification


class NotificationSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Notification
        fields = ["url", "user", "message", "reference_obj", "reference_url", "seen", "id"]
        read_only_fields = ["url", "user", "message", "reference_obj", "reference_url", "id"]
        extra_kwargs = {
            'seen': {
                'required': True
            }
        }