from rest_framework import serializers
from ..models import Equipment, BuyOrder, StopLossOrder, Asset, Parity
from ..serializers import *
from rest_framework.exceptions import ValidationError, PermissionDenied


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

    def create(self, validated_data):
        user = validated_data["user"]
        base_eq = validated_data["base_equipment"]
        target_eq = validated_data["target_equipment"]
        sell_amount = validated_data["sell_amount"]

        if not user.is_trader:
            raise ValidationError("Please become a trader user to place Stop/Loss orders.")

        if not user.email_verified:
            raise PermissionDenied("Please verify your e-mail account before placing Stop/Loss orders.")

        latest = Parity.objects.order_by('-date').filter(base_equipment=base_eq,
                                                         target_equipment=target_eq).first()

        if latest is None:
            raise ValidationError("This conversion does not exist.")

        asset = Asset.objects.filter(user=user,
                                     equipment=base_eq).first()

        if asset is None:
            raise ValidationError("You don't have any asset from the base equipment."
                                  "Please inject assets before placing this Stop/Loss order.")

        balance = asset.serializable_value('amount')

        if balance < sell_amount:
            raise ValidationError("You don't have enough balance to perform this action."
                                  "Please inject assets before placing this Stop/Loss order.")

        # Subtract the amount of possible action money, i.e. put on hold.
        asset.amount = balance - sell_amount
        asset.save()
        return super().create(validated_data)

    class Meta:
        model = StopLossOrder
        fields = ["url", "id", "user", "base_equipment", "target_equipment",
                  "date", "sell_ratio", "sell_amount"]
        read_only_fields = ["user"]


class BuyOrderSerializer(OrderSerializerBase):

    def create(self, validated_data):
        user = validated_data["user"]
        base_eq = validated_data["base_equipment"]
        target_eq = validated_data["target_equipment"]
        buy_amount = validated_data["buy_amount"]

        if not user.is_trader:
            raise ValidationError("Please become a trader user to place buying orders.")

        if not user.email_verified:
            raise PermissionDenied("Please verify your e-mail account before placing buying orders.")

        latest = Parity.objects.order_by('-date').filter(base_equipment=base_eq,
                                                         target_equipment=target_eq).first()

        if latest is None:
            raise ValidationError("This conversion does not exist.")

        asset = Asset.objects.filter(user=user,
                                     equipment=base_eq).first()

        if asset is None:
            raise ValidationError("You don't have any asset from the base equipment."
                                  "Please inject assets before placing this buying order.")

        balance = asset.serializable_value('amount')

        if balance < buy_amount:
            raise ValidationError("You don't have enough balance to perform this action."
                                  "Please inject assets before placing this buying order.")

        # Subtract the amount of possible action money, i.e. put on hold.
        asset.amount = balance - buy_amount
        asset.save()
        return super().create(validated_data)

    class Meta:
        model = BuyOrder
        fields = ["url", "id", "user", "base_equipment", "target_equipment",
                  "date", "buy_ratio", "buy_amount"]
        read_only_fields = ["user"]
