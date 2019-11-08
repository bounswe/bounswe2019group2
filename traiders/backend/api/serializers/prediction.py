from rest_framework import serializers
from ..models import Prediction, Equipment


class PredictionSerializer(serializers.HyperlinkedModelSerializer):
    base_equipment = serializers.CharField()
    target_equipment = serializers.CharField()

    def _get_equipment_or_raise(self, symbol):
        eq = Equipment.objects.filter(symbol=symbol).first()
        if not eq:
            raise serializers.ValidationError('Equipment not found')
        return eq

    validate_base_equipment = _get_equipment_or_raise
    validate_target_equipment = _get_equipment_or_raise

    def validate(self, data):
        request = self.context['request']
        data['by_user'] = request.user

        date_default = Prediction._meta.get_field('date').default()

        if Prediction.objects.filter(**data, date=date_default).exists():
            raise serializers.ValidationError('You have already made a prediction today '
                                              'for the given parity.')

        return data

    class Meta:
        model = Prediction
        fields = ["url", "id", "by_user", "base_equipment", "target_equipment", "direction"]
        read_only_fields = ["by_user"]