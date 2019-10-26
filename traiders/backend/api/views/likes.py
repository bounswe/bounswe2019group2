from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.exceptions import PermissionDenied

from ..models.likes import Like
from ..serializers.likes import LikeSerializer


# def check_if_liked_already(request, like):
#     # If the article is already liked, then a new request will delete the like
#     already_liked = Like.objects.filter(user=like.user, article=like.article).exists()
#     if already_liked:
#         Like.objects.filter(user=request.user, article=like.article).delete()
#     else:
#         Like.objects.create(user=request.user, article=like.article)


class LikeViewSet(mixins.CreateModelMixin,
                  mixins.DestroyModelMixin,
                  mixins.RetrieveModelMixin,
                  GenericViewSet):
    serializer_class = LikeSerializer
    queryset = Like.objects.all()
    permission_classes = (IsAuthenticatedOrReadOnly,)

    def check_object_permissions(self, request, like):
        # Another user can only retrieve; cannot delete
        if self.action != 'retrieve' and request.user != like.user:
            raise PermissionDenied
