from rest_framework.viewsets import ReadOnlyModelViewSet
from django.db.models import Q
from django_filters import rest_framework as filters

from ..models import Parity, Equipment
from ..serializers import ParitySerializer


class ParityFilterSet(filters.FilterSet):
    base_equipment = filters.CharFilter('base_equipment__symbol')
    target_equipment = filters.CharFilter('target_equipment__symbol')
    category = filters.CharFilter('category', method='filter_category')

    def filter_category(self, queryset, name, value):
        bases = Equipment.objects.filter(category=value)
        targets = Equipment.objects.filter(category=value)
        return queryset.filter(Q(base_equipment__in=bases) | Q(target_equipment__in=targets))


class ParityViewSet(ReadOnlyModelViewSet):
    serializer_class = ParitySerializer
    queryset = Parity.objects.all()
    filter_backends = [filters.DjangoFilterBackend]
    filterset_class = ParityFilterSet
