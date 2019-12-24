from rest_framework import serializers

from ..models import Alert


class AlertSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Alert
        fields = ["url", "user", "base_symbol", "target_symbol", "ratio", "increasing", "id"]
        read_only_fields = ['id', 'url', 'user']

    def validate(self, attrs):
        attrs['user'] = self.context['request'].user
        return attrs
