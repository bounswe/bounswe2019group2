from rest_framework.viewsets import ReadOnlyModelViewSet
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.pagination import LimitOffsetPagination

from ..models import Parity, Equipment
from ..serializers import ParitySerializer
from ..filters import ParityFilterSet


class ParityViewSet(ReadOnlyModelViewSet):
    serializer_class = ParitySerializer
    queryset = Parity.objects.all()
    filter_backends = [DjangoFilterBackend]
    filterset_class = ParityFilterSet
    pagination_class = LimitOffsetPagination


class ParityLatestViewSet(ReadOnlyModelViewSet):
    serializer_class = ParitySerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = ParityFilterSet
    pagination_class = LimitOffsetPagination

    def get_queryset(self):
        parities = []

        distinct_id_pairs = Parity.objects.order_by().values_list('base_equipment', 'target_equipment').distinct()

        for base, target in distinct_id_pairs:
            parity = Parity.objects.order_by('-date').filter(base_equipment_id=base,
                                                             target_equipment_id=target).first()

            parities.append(parity.id)

        return Parity.objects.filter(id__in=parities)
