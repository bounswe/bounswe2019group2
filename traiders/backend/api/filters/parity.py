from django.db.models import Q
from django_filters import rest_framework as filters

from ..models import Equipment


class ParityFilterSet(filters.FilterSet):
    base_equipment = filters.CharFilter(field_name='base_equipment__symbol',
                                        label='Filter by base equipment symbol.')
    target_equipment = filters.CharFilter(field_name='target_equipment__symbol',
                                          label='Filter by target equipment symbol.')
    category = filters.CharFilter(method='filter_category',
                                  label='Filter by category. '
                                        'A parity is returned if its base or target is in category.')

    def filter_category(self, queryset, name, value):
        bases = Equipment.objects.filter(**{name: value})
        targets = Equipment.objects.filter(**{name: value})
        return queryset.filter(Q(base_equipment__in=bases) | Q(target_equipment__in=targets))
