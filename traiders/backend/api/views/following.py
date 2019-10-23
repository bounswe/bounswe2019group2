from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.exceptions import PermissionDenied
from rest_framework.pagination import LimitOffsetPagination
from django_filters.rest_framework import DjangoFilterBackend

from ..models import Following
from ..serializers import FollowingSerializer
from ..filters import FollowingFilterSet


class FollowingViewSet(mixins.CreateModelMixin,
                       mixins.RetrieveModelMixin,
                       mixins.UpdateModelMixin,
                       mixins.DestroyModelMixin,
                       mixins.ListModelMixin,
                       GenericViewSet):
    """
    View and edit articles
    """
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = FollowingSerializer
    queryset = Following.objects.all()
    pagination_class = LimitOffsetPagination
    filter_backends = [DjangoFilterBackend]
    filterset_class = FollowingFilterSet

    def check_object_permissions(self, request, following):
        # Another user can only retrieve; cannot update, delete, update or partial_update
        if self.action != 'retrieve' and request.user != following.user_following:
            raise PermissionDenied
