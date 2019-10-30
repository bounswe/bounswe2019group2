from rest_framework import serializers
from ..models import Event
from django_countries.serializer_fields import CountryField


class EventSerializer(serializers.HyperlinkedModelSerializer):
    country = CountryField(country_dict=True, read_only=True)

    class Meta:
        model = Event
        fields = ["url", "id", "date", "country", "calendarId", "category",
                  "actual", "previous", "forecast", "sourceURL", "importance", "followed_by"]
