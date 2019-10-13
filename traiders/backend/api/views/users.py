from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.exceptions import PermissionDenied

from ..models.users import User
from ..serializers.users import UserSerializer


class UserViewSet(mixins.CreateModelMixin,
                  mixins.RetrieveModelMixin,
                  mixins.UpdateModelMixin,
                  mixins.DestroyModelMixin,
                  GenericViewSet):
    """
    View and edit users

    create:
    Registers a new user.
    """
    serializer_class = UserSerializer
    queryset = User.objects.all()

    def check_object_permissions(self, request, user):
        # Another user can only retrieve; cannot update, delete, update or partial_update
        # TODO Add condition for private profiles
        if self.action != 'retrieve' and request.user != user:
            raise PermissionDenied
