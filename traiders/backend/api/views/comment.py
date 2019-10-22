from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.exceptions import PermissionDenied
from django_filters.rest_framework import DjangoFilterBackend

from ..models import ArticleComment, EquipmentComment
from ..serializers import ArticleCommentSerializer, EquipmentCommentSerializer
from ..filters import ArticleCommentFilterSet, EquipmentCommentFilterSet


class ArticleCommentViewSet(mixins.CreateModelMixin,
                            mixins.RetrieveModelMixin,
                            mixins.UpdateModelMixin,
                            mixins.DestroyModelMixin,
                            mixins.ListModelMixin,
                            GenericViewSet):
    """
    View and edit comments
    """
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = ArticleCommentSerializer
    queryset = ArticleComment.objects.all()
    filter_backends = [DjangoFilterBackend]
    filterset_class = ArticleCommentFilterSet

    def check_object_permissions(self, request, article_comment):
        # Another user can only retrieve; cannot update, delete, update or partial_update
        if self.action != 'retrieve' and request.user != article_comment.user:
            raise PermissionDenied


class EquipmentCommentViewSet(mixins.CreateModelMixin,
                              mixins.RetrieveModelMixin,
                              mixins.UpdateModelMixin,
                              mixins.DestroyModelMixin,
                              mixins.ListModelMixin,
                              GenericViewSet):
    """
    View and edit comments
    """
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = EquipmentCommentSerializer
    queryset = EquipmentComment.objects.all()
    filter_backends = [DjangoFilterBackend]
    filterset_class = EquipmentCommentFilterSet

    def check_object_permissions(self, request, equipment_comment):
        # Another user can only retrieve; cannot update, delete, update or partial_update
        if self.action != 'retrieve' and request.user != equipment_comment.user:
            raise PermissionDenied
