from django_filters import rest_framework as filters

from ..models import Event
from django_countries import Countries


class EventFilterSet(filters.FilterSet):
    # Filtering by country and importance level
    importance = filters.MultipleChoiceFilter(field_name="importance",
                                              label="filter by importance",
                                              choices=[(i, i) for i in range(1, 4)])
    country = filters.MultipleChoiceFilter(field_name="country",
                                           label="filter by country",
                                           choices=Countries())

    class Meta:
        model = Event
        fields = ["importance", "country"]
