from django_filters import rest_framework as filters
from ..models import BuyOrder, StopLossOrder


class BaseOrderFilterSet(filters.FilterSet):
    base_equipment = filters.CharFilter(field_name='base_equipment__symbol',
                                        label='Filter by base equipment symbol.')
    target_equipment = filters.CharFilter(field_name='target_equipment__symbol',
                                          label='Filter by target equipment symbol.')

    class Meta:
        abstract = True


class BuyOrderFilterSet(BaseOrderFilterSet):

    class Meta:
        model = BuyOrder
        fields = ["base_equipment", "target_equipment"]


class StopLossOrderFilterSet(BaseOrderFilterSet):

    class Meta:
        model = StopLossOrder
        fields = ["base_equipment", "target_equipment"]
