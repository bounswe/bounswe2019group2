from rest_framework import serializers
from ..models import Prediction


class PredictionSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Prediction
        fields = ["url", "id", "by_user", "date", "parity",
                  "direction", "result"]
        read_only_fields = ["result", "date", "by_user"]
