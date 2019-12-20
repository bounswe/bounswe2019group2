from rest_framework.viewsets import ReadOnlyModelViewSet, GenericViewSet
from ..models import Notification
from ..serializers import NotificationSerializer
from ..filters import NotificationFilterSet
from rest_framework.exceptions import PermissionDenied
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import mixins


class NotificationViewSet(mixins.RetrieveModelMixin,
                          mixins.UpdateModelMixin,
                          mixins.ListModelMixin,
                          GenericViewSet):
    serializer_class = NotificationSerializer
    queryset = Notification.objects.all()
    filter_backends = [DjangoFilterBackend]
    filterset_class = NotificationFilterSet

    def check_object_permissions(self, request, notification):
        # Another user cannot
        if (
                self.action == 'retrieve' or self.action == 'update' or self.action == 'partial_update') and request.user != notification.user:
            raise PermissionDenied
