from rest_framework import serializers
from ..models import ManualInvestment, Equipment, Asset, OnlineInvestment, Parity
from ..serializers import *
from rest_framework.exceptions import ValidationError, PermissionDenied


class BaseInvestmentSerializer(serializers.HyperlinkedModelSerializer):
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


class ManualInvestmentSerializer(BaseInvestmentSerializer):

    class Meta:
        model = ManualInvestment
        fields = ["url", "id", "user", "base_equipment", "target_equipment",
                  "base_amount", "target_amount", "date"]
        read_only_fields = ["user"]


def verify_credit_card(credit_card, credit_card_ccv, credit_card_valid_until):
    # TODO put credit card verification logic
    return False


class OnlineInvestmentSerializer(BaseInvestmentSerializer):
    target_amount = serializers.DecimalField(read_only=True,
                                             max_digits=15,
                                             decimal_places=3)

    credit_card = serializers.CharField(min_length=16,
                                        max_length=16,
                                        required=False)

    credit_card_valid_until = serializers.CharField(min_length=5,
                                                    max_length=5,
                                                    required=False)
    credit_card_ccv = serializers.CharField(min_length=3,
                                            max_length=3,
                                            required=False)

    def create(self, validated_data):
        user = validated_data["user"]
        base_eq = validated_data["base_equipment"]
        target_eq = validated_data["target_equipment"]
        base_amount = validated_data["base_amount"]

        if not user.is_trader:
            raise PermissionDenied("You should be a trader user to make an online investment.")

        if not user.email_verified:
            raise PermissionDenied("Verify your e-mail account before making an online investment.")

        if "credit_card" in validated_data:
            credit_card_valid_until = validated_data.pop("credit_card_valid_until", None)
            credit_card = validated_data.pop("credit_card")
            credit_card_ccv = validated_data.pop("credit_card_ccv", None)

            if not verify_credit_card(credit_card, credit_card_ccv, credit_card_valid_until):
                raise ValidationError("Your credit card information could not be verified."
                                      "Please make sure you have entered correct"
                                      " Number, Valid Until Date (MM/YY) and CCV (3 digits)")
        else:
            asset = Asset.objects.filter(user=user,
                                         equipment=base_eq).first()
            if asset is None:
                raise ValidationError("You don't have any asset from the base equipment."
                                      "Either provide a credit card or inject assets.")

            balance = asset.serializable_value('amount')
            if balance < base_amount:
                raise ValidationError("You don't have enough balance to perform this action."
                                      "Either provide a credit card or inject assets.")

        latest = Parity.objects.order_by('-date').filter(base_equipment=base_eq,
                                                         target_equipment=target_eq).first()

        if latest is None:
            raise ValidationError("This conversion does not exist.")

        target_amount = latest.close * base_amount
        validated_data["target_amount"] = target_amount
        return super().create(validated_data)

    class Meta:
        model = OnlineInvestment
        fields = ["url", "id", "user", "base_equipment", "target_equipment",
                  "base_amount", "target_amount", "date", "credit_card",
                  "credit_card_valid_until", "credit_card_ccv"]
        read_only_fields = ["user", "target_amount"]


class AssetSerializer(serializers.HyperlinkedModelSerializer):
    equipment = serializers.CharField()
    user = UserSerializer(read_only=True)
    amount = serializers.DecimalField(max_digits=15,
                                      decimal_places=3,
                                      coerce_to_string=False)

    def _get_equipment_or_raise(self, symbol):
        eq = Equipment.objects.filter(symbol=symbol).first()
        if not eq:
            raise serializers.ValidationError('Equipment not found')
        return eq

    validate_equipment = _get_equipment_or_raise

    def validate(self, data):
        request = self.context['request']
        data['user'] = request.user
        return data

    def create(self, validated_data):
        user = validated_data["user"]
        equipment = validated_data["equipment"]
        amount = validated_data["amount"]

        if user.iban == "":

            raise ValidationError("Please provide an IBAN to the system through your profile page.")

        if not user.is_trader:
            raise ValidationError("Please become a trader user to keep your assets in the system.")

        obj = Asset.objects.filter(user=user,
                                   equipment=equipment).first()

        if obj is not None:
            obj.amount = obj.amount + amount
            obj.save()
            return obj
        else:
            return super().create(validated_data)

    class Meta:
        model = Asset
        fields = ["url", "id", "user", "equipment", "amount"]
        read_only_fields = ["user"]
