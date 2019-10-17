from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.exceptions import PermissionDenied


from ..models import Comment
from ..serializers import CommentSerializer


class CommentViewSet(mixins.CreateModelMixin,
                     mixins.RetrieveModelMixin,
                     mixins.UpdateModelMixin,
                     mixins.DestroyModelMixin,
                     mixins.ListModelMixin,
                     GenericViewSet):
    """
    View and edit comments
    """
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = CommentSerializer
    queryset = Comment.objects.all()

    def check_object_permissions(self, request, comment):
        # Another user can only retrieve; cannot update, delete, update or partial_update
        if self.action != 'retrieve' and request.user != comment.user:
            raise PermissionDenied
