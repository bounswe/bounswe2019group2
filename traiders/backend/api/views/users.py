from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from django.db import models
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
        # TODO Add condition for private profiles
        if self.action != 'retrieve' and request.user != user:
            raise PermissionDenied
        elif self.action == 'retrieve':
            viewer = request.user
            if viewer == user:
                return
            try:
                Following.objects.get(user_following=viewer, user_followed=user)
            except models.ObjectDoesNotExist:
                raise PermissionDenied("User profile is private. Please request to follow")
