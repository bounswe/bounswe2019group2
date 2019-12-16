from rest_framework.viewsets import ReadOnlyModelViewSet
from ..models import Notification
from ..serializers import NotificationSerializer
from ..filters import NotificationFilterSet
from rest_framework.exceptions import PermissionDenied
from django_filters.rest_framework import DjangoFilterBackend


class NotificationViewSet(ReadOnlyModelViewSet):
    serializer_class = NotificationSerializer
    queryset = Notification.objects.all()
    filter_backends = [DjangoFilterBackend]
    filterset_class = NotificationFilterSet
