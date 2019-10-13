from rest_framework.viewsets import ReadOnlyModelViewSet
from rest_framework.filters import BaseFilterBackend
from django.shortcuts import get_object_or_404
from django.db.models import Q

from ..models import Parity, Equipment
from ..serializers import ParitySerializer


class ParityFilterBackend(BaseFilterBackend):
    def filter_queryset(self, request, queryset, view):
        base = request.query_params.get("base_equipment")
        target = request.query_params.get("target_equipment")
        category = request.query_params.get("category")
        filters = {}
        if base is not None:
            filters["base_equipment"] = get_object_or_404(Equipment, symbol=base)
        if target is not None:
            filters["target_equipment"] = get_object_or_404(Equipment, symbol=target)
        if base is None and target is None and category is None:
            return queryset
        elif category is not None:
            bases = Equipment.objects.filter(category=category)
            targets = Equipment.objects.filter(category=category)
            return queryset.filter(Q(base_equipment__in=bases) | Q(target_equipment__in=targets), **filters)
        else:
            return queryset.filter(**filters)

    def get_schema_operation_parameters(self, view):
        return [
            {
                'name': 'base_equipment',
                'required': False,
                'in': 'query',
                'description': 'Base equipment symbol',
                'type': 'string'
            },
            {
                'name': 'target_equipment',
                'required': False,
                'in': 'query',
                'description': 'Target equipment symbol',
                'type': 'string'
            },
            {
                'name': 'category',
                'required': False,
                'in': 'query',
                'description': 'Category of either equipment',
                'type': 'string'
            },
        ]


class ParityViewSet(ReadOnlyModelViewSet):
    """
    list:
    Lists all parities.
    Use query parameters `base_equipment`, `target_equipment` and `category` to filter the results.
    """
    serializer_class = ParitySerializer
    filter_backends = [ParityFilterBackend]
    queryset = Parity.objects.all()
