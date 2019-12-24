from rest_framework.viewsets import ReadOnlyModelViewSet, GenericViewSet
from ..models import Notification, Event, OnlineInvestment, Article
from ..serializers import NotificationSerializer
from rest_framework.exceptions import PermissionDenied
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response


class NotificationViewSet(mixins.RetrieveModelMixin,
                          mixins.UpdateModelMixin,
                          mixins.ListModelMixin,
                          GenericViewSet):
    serializer_class = NotificationSerializer
    filter_backends = [DjangoFilterBackend]
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Notification.objects.filter(user=self.request.user)

    def check_object_permissions(self, request, notification):
        # Another user cannot
        if request.user != notification.user:
            raise PermissionDenied
