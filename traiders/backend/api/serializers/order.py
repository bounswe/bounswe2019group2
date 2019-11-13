from rest_framework import serializers
from ..models import Equipment, BuyOrder, StopLossOrder
from ..serializers import *


class OrderSerializerBase(serializers.HyperlinkedModelSerializer):
    base_equipment = serializers.CharField()
    target_equipment = serializers.CharField()
    user = UserSerializer(read_only=True)

    def _get_equipment_or_raise(self, symbol):
        eq = Equipment.objects.filter(symbol=symbol).first()
        if not eq:
            raise serializers.ValidationError('Equipment not found')
        return eq

    validate_base_equipment = _get_equipment_or_raise
    validate_target_equipment = _get_equipment_or_raise

    def validate(self, data):
        request = self.context['request']
        data['user'] = request.user
        return data

    class Meta:
        abstract = True


class StopLossOrderSerializer(OrderSerializerBase):
    class Meta:
        model = StopLossOrder
        fields = ["url", "id", "user", "base_equipment", "target_equipment",
                  "date", "sell_ratio", "sell_amount"]
        read_only_fields = ["user"]


class BuyOrderSerializer(OrderSerializerBase):
    class Meta:
        model = BuyOrder
        fields = ["url", "id", "user", "base_equipment", "target_equipment",
                  "date", "buy_ratio", "buy_amount"]
        read_only_fields = ["user"]

