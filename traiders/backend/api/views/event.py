from rest_framework.viewsets import ReadOnlyModelViewSet
from django_filters.rest_framework import DjangoFilterBackend

from ..models import Event
from ..serializers import EventSerializer
from ..filters import EventFilterSet


class EventViewSet(ReadOnlyModelViewSet):
    serializer_class = EventSerializer
    queryset = Event.objects.all()
    filter_backends = [DjangoFilterBackend]
    filterset_class = EventFilterSet


class EventLatestViewSet(ReadOnlyModelViewSet):
    serializer_class = EventSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = EventFilterSet

    # TODO implement latest view
