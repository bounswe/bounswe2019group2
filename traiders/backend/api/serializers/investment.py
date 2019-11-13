from rest_framework import serializers
from ..models import ManualInvestment, Equipment, Asset, OnlineInvestment
from ..serializers import *


class ManualInvestmentSerializer(serializers.HyperlinkedModelSerializer):
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
        model = ManualInvestment
        fields = ["url", "id", "user", "base_equipment", "target_equipment",
                  "base_amount", "target_amount", "date"]
        read_only_fields = ["user"]


class OnlineInvestmentSerializer(serializers.HyperlinkedModelSerializer):
    base_equipment = serializers.CharField()
    target_equipment = serializers.CharField()
    target_amount = serializers.DecimalField(read_only=True,
                                             max_digits=15,
                                             decimal_places=3)
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
        model = OnlineInvestment
        fields = ["url", "id", "user", "base_equipment", "target_equipment",
                  "base_amount", "target_amount", "date"]
        read_only_fields = ["user", "target_amount"]


class AssetSerializer(serializers.HyperlinkedModelSerializer):
    equipment = EquipmentSerializer(read_only=True)
    user = UserSerializer(read_only=True)
    amount = serializers.DecimalField(read_only=True,
                                      max_digits=15,
                                      decimal_places=3,
                                      coerce_to_string=False)

    class Meta:
        model = Asset
        fields = ["url", "id", "user", "equipment", "amount"]
        read_only_fields = ["user", "equipment", "amount"]
