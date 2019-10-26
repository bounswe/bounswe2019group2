from rest_framework import serializers
from ..models import Like


class LikeSerializer(serializers.HyperlinkedModelSerializer):
    def validate(self, attrs):
        attrs['user'] = self.context['request'].user
        return attrs

    class Meta:
        model = Like
        fields = '__all__'
        read_only_fields = ['user']
