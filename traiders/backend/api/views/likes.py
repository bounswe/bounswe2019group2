from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.exceptions import PermissionDenied
from rest_framework.pagination import LimitOffsetPagination

from ..models.likes import Like
from ..serializers.likes import LikeSerializer


class LikeViewSet(mixins.CreateModelMixin,
                  mixins.DestroyModelMixin,
                  mixins.RetrieveModelMixin,
                  GenericViewSet):
    serializer_class = LikeSerializer
    queryset = Like.objects.all()
    permission_classes = (IsAuthenticatedOrReadOnly,)
    pagination_class = LimitOffsetPagination

    def check_object_permissions(self, request, like):
        # Another user can only retrieve; cannot delete
        if self.action != 'retrieve' and request.user != like.user:
            raise PermissionDenied
