from rest_framework.viewsets import ReadOnlyModelViewSet

from ..models import Parity, Equipment
from ..serializers import ParitySerializer
from django.shortcuts import get_object_or_404
from django.db.models import Q


class ParityViewSet(ReadOnlyModelViewSet):
    serializer_class = ParitySerializer

    def get_queryset(self):
        base = self.request.query_params.get("base_equipment")
        target = self.request.query_params.get("target_equipment")
        category = self.request.query_params.get("category")
        filters = {}
        if base is not None:
            filters["base_equipment"] = get_object_or_404(Equipment, symbol=base)
        if target is not None:
            filters["target_equipment"] = get_object_or_404(Equipment, symbol=target)
        if base is None and target is None and category is None:
            return Parity.objects.all()
        elif category is not None:
            bases = Equipment.objects.filter(category=category)
            targets = Equipment.objects.filter(category=category)
            return Parity.objects.filter(Q(base_equipment__in=bases) | Q(target_equipment__in=targets), **filters)
        else:
            return Parity.objects.filter(**filters)
