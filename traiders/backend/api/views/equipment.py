from rest_framework.viewsets import ReadOnlyModelViewSet

from ..models import Equipment
from ..serializers import EquipmentSerializer
from ..filters import EquipmentFilterSet
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.pagination import LimitOffsetPagination


class EquipmentViewSet(ReadOnlyModelViewSet):
    serializer_class = EquipmentSerializer
    queryset = Equipment.objects.all()
    pagination_class = LimitOffsetPagination
    filter_backends = [DjangoFilterBackend]
    filterset_class = EquipmentFilterSet
