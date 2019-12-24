from rest_framework.viewsets import ReadOnlyModelViewSet
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.pagination import LimitOffsetPagination
from django.db.models import When, Case

from ..models import Parity, Equipment, ParitySetting
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
        latest_parities = []

        distinct_id_pairs = Parity.objects.order_by().values_list('base_equipment', 'target_equipment').distinct()

        for base, target in distinct_id_pairs:
            parity = Parity.objects.order_by('-date').filter(base_equipment_id=base,
                                                             target_equipment_id=target).first()

            parity_setting = ParitySetting.objects.filter(base_equipment=parity.base_equipment,
                                                          target_equipment=parity.target_equipment).first()
            order = 0
            if parity_setting:
                order = parity_setting.order

            latest_parities.append((order, parity.base_equipment.symbol, parity.target_equipment.symbol, parity.id))

        latest_parities.sort()
        if latest_parities:
            parity_ids = list(zip(*latest_parities))[-1]
        else:
            parity_ids = []

        preserved_order = Case(*[When(pk=pk, then=pos) for pos, pk in enumerate(parity_ids)])

        return Parity.objects.filter(id__in=parity_ids).order_by(preserved_order)
