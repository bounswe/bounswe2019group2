from rest_framework import serializers
from ..models import Event


class EventSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Event
        fields = ["url", "id", "date", "country", "calendarId", "category",
                  "actual", "previous", "forecast", "sourceURL", "importance"]
