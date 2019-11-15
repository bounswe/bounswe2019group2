from django_filters import rest_framework as filters

from ..models import Prediction


class PredictionFilterSet(filters.FilterSet):
    base_equipment = filters.CharFilter(field_name='base_equipment__symbol',
                                        label='Filter by base equipment symbol.')
    target_equipment = filters.CharFilter(field_name='target_equipment__symbol',
                                          label='Filter by target equipment symbol.')

    class Meta:
        model = Prediction
        fields = ["base_equipment", "target_equipment"]
