from rest_framework import serializers
from ..models import Parity


class ParitySerializer(serializers.HyperlinkedModelSerializer):
    def validate(self, data):
        if data.get('base_equipment') and not data.get('target_equipment'):
            raise serializers.ValidationError('You should either specify Base Equipment or Target Equipment')
        return data

    class Meta:
        model = Parity
        fields = ["base_equipment", "target_equipment", "ratio", "date"]
        extra_kwargs = {
            'base_equipment': {'required': False},
            'target_equipment': {'required': False}
        }
