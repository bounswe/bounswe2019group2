from rest_framework.viewsets import GenericViewSet
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import mixins

from ..models import Event
from ..serializers import EventSerializer
from ..filters import EventFilterSet
from rest_framework.pagination import LimitOffsetPagination


class EventViewSet(mixins.RetrieveModelMixin,
                   mixins.ListModelMixin,
                   mixins.UpdateModelMixin,
                   GenericViewSet):
    serializer_class = EventSerializer
    queryset = Event.objects.all().order_by('-date')
    filter_backends = [DjangoFilterBackend]
    filterset_class = EventFilterSet
    pagination_class = LimitOffsetPagination
