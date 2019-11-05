from rest_framework.viewsets import ReadOnlyModelViewSet
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.pagination import LimitOffsetPagination

from ..models import Parity, ParitySetting
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
        for parity_setting in ParitySetting.objects.all():
            parity = Parity.objects.order_by('-date').filter(base_equipment=parity_setting.base_equipment,
                                                             target_equipment=parity_setting.target_equipment).first()
            if parity:
                parities.append(parity.id)

        return Parity.objects.filter(id__in=parities)
