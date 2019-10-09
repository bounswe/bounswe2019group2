from rest_framework import serializers
from ..models import Parity
from .equipment import EquipmentSerializer


class ParitySerializer(serializers.HyperlinkedModelSerializer):

    base_equipment = EquipmentSerializer(read_only=True)
    target_equipment = EquipmentSerializer(read_only=True)

    class Meta:
        model = Parity
        fields = ["url", "base_equipment", "target_equipment", "ratio", "date"]
