from rest_framework.viewsets import ReadOnlyModelViewSet
from django_filters.rest_framework import DjangoFilterBackend

from ..models import Parity, Equipment
from ..serializers import ParitySerializer
from ..filters import ParityFilterSet


class ParityViewSet(ReadOnlyModelViewSet):
    serializer_class = ParitySerializer
    queryset = Parity.objects.all()
    filter_backends = [DjangoFilterBackend]
    filterset_class = ParityFilterSet
