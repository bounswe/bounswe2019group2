from django_filters import rest_framework as filters

from ..models import ManualInvestment, OnlineInvestment


class BaseInvestmentFilterSet(filters.FilterSet):
    base_equipment = filters.CharFilter(field_name='base_equipment__symbol',
                                        label='Filter by base equipment symbol.')
    target_equipment = filters.CharFilter(field_name='target_equipment__symbol',
                                          label='Filter by target equipment symbol.')

    class Meta:
        abstract = True


class OnlineInvestmentFilterSet(BaseInvestmentFilterSet):

    class Meta:
        model = OnlineInvestment
        fields = ["base_equipment", "target_equipment"]


class ManualInvestmentFilterSet(BaseInvestmentFilterSet):

    class Meta:
        model = ManualInvestment
        fields = ["base_equipment", "target_equipment"]
