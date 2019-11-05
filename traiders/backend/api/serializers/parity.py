from rest_framework import serializers
from ..models import Parity
from .equipment import EquipmentSerializer


class ParitySerializer(serializers.HyperlinkedModelSerializer):
    base_equipment = EquipmentSerializer(read_only=True)
    target_equipment = EquipmentSerializer(read_only=True)

    ratio = serializers.SerializerMethodField(method_name='get_ratio')

    def get_ratio(self, parity):
        return str(parity.close)

    class Meta:
        model = Parity
        fields = ["url", "id", "base_equipment", "target_equipment",
                  "ratio", "open", "close", "high", "low", "date"]
