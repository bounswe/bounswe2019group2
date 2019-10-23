from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins, status
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.exceptions import PermissionDenied
from rest_framework.response import Response
from rest_framework.pagination import LimitOffsetPagination
from django_filters.rest_framework import DjangoFilterBackend

from ..models import Following
from ..serializers import FollowingSerializer
from ..filters import FollowingFilterSet


class FollowingViewSet(mixins.CreateModelMixin,
                       mixins.RetrieveModelMixin,
                       mixins.DestroyModelMixin,
                       mixins.ListModelMixin,
                       mixins.UpdateModelMixin,
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

    def list(self, request, *args, **kwargs):
        if 'user_following' not in request.query_params and 'user_followed' not in request.query_params:
            return Response({
                'non_field_errors': ['Please provide a user to see who is '
                                     'following them or who they follow.']
            }, status=status.HTTP_400_BAD_REQUEST)

        return super().list(request, *args, **kwargs)

    def check_object_permissions(self, request, following):
        # only follower or followee can delete the following relation
        if self.action == 'destroy' and request.user not in (following.user_followed, following.user_following):
            raise PermissionDenied
        # no one other than the followee can update because update will only be used for accepting
        if (self.action == 'update' or self.action == 'partial_update') and request.user != following.user_followed:
            raise PermissionDenied

        # and accepted following cannot be updated anymore
        if (self.action == 'update' or self.action == 'partial_update') and following.status == Following.ACCEPTED:
            raise PermissionDenied
