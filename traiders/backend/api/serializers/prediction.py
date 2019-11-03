from rest_framework import serializers
from ..models import Prediction
from .parity import ParitySerializer


class PredictionSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Prediction
        fields = ["url", "id", "by_user", "date", "base_equipment",
                  "target_equipment", "direction", "result"]
        read_only_fields = ["result"]
