from rest_framework.viewsets import ReadOnlyModelViewSet

from ..models import Parity, Equipment
from ..serializers import ParitySerializer
from django.shortcuts import get_object_or_404


class ParityViewSet(ReadOnlyModelViewSet):
    serializer_class = ParitySerializer

    def get_queryset(self):
        base = self.request.query_params.get("base_equipment")
        target = self.request.query_params.get("target_equipment")
        filters = {}
        if base is not None:
            filters["base_equipment"] = get_object_or_404(Equipment, symbol=base)
        if target is not None:
            filters["target_equipment"] = get_object_or_404(Equipment, symbol=target)
        if base is None and target is None:
            return Parity.objects.all()
        else:
            return Parity.objects.filter(**filters)
