from rest_framework import serializers
from ..models import Prediction
from datetime import datetime


class PredictionSerializer(serializers.HyperlinkedModelSerializer):

    def create(self, validated_data):
        # We need to check if another prediction is made.
        parity = validated_data['parity']
        by_user = validated_data['by_user']
        if 'date' in validated_data:
            date = validated_data['date']
        else:
            date = datetime.now().date()
        try:
            Prediction.objects.get(by_user=by_user,
                                   parity=parity,
                                   date=date)

        except Prediction.DoesNotExist:
            return super().create(validated_data)

        raise serializers.ValidationError('You have already made another prediction today '
                                          'for the given parity.')

    def validate(self, data):
        request = self.context['request']

        # Unless admin is adding the instance
        # We need the by_user field

        if request.method == 'POST':
            if 'by_user' not in data:
                request = self.context['request']
                data['by_user'] = request.user

        return data

    class Meta:
        model = Prediction
        fields = ["url", "id", "by_user", "date", "parity",
                  "direction", "result"]
        read_only_fields = ["result", "date", "by_user"]
