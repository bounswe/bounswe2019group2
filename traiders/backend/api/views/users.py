from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.exceptions import PermissionDenied

from ..models import User, Following
from ..serializers.users import UserSerializer


class UserViewSet(mixins.CreateModelMixin,
                  mixins.RetrieveModelMixin,
                  mixins.UpdateModelMixin,
                  mixins.DestroyModelMixin,
                  GenericViewSet):
    """
    View and edit users
    """
    serializer_class = UserSerializer
    queryset = User.objects.all()

    def check_object_permissions(self, request, user):
        # Another user can only retrieve; cannot update, delete, update or partial_update
        if self.action != 'retrieve' and request.user != user:
            raise PermissionDenied

        elif self.action == 'retrieve' and user.is_private and request.user != user:
            if request.user.is_anonymous or not Following.objects.filter(user_following=request.user,
                                                                         user_followed=user,
                                                                         status=Following.ACCEPTED).exists():
                raise PermissionDenied("User profile is private. Please request to follow")
