from rest_framework.viewsets import ReadOnlyModelViewSet
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import mixins
from rest_framework.viewsets import GenericViewSet

from ..models import Parity, Equipment
from ..serializers import ParitySerializer
from ..filters import ParityFilterSet


class ParityViewSet(ReadOnlyModelViewSet):
    serializer_class = ParitySerializer
    queryset = Parity.objects.all()
    filter_backends = [DjangoFilterBackend]
    filterset_class = ParityFilterSet


class ParityLatestViewSet(ReadOnlyModelViewSet):
    serializer_class = ParitySerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = ParityFilterSet

    def get_queryset(self):
        parities = []
        for base in Equipment.objects.all():
            for target in Equipment.objects.all():
                parity = Parity.objects.order_by('-date').filter(base_equipment=base,
                                                                 target_equipment=target)

                if len(parity) != 0:
                    parities.append(parity[0].id)
        return Parity.objects.filter(id__in=parities)

