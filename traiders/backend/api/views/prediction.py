from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.exceptions import PermissionDenied
from datetime import datetime

from ..models import Prediction
from ..serializers import PredictionSerializer


class PredictionViewSet(mixins.ListModelMixin,
                        mixins.CreateModelMixin,
                        mixins.UpdateModelMixin,
                        mixins.DestroyModelMixin,
                        GenericViewSet):
    """
    View and edit comments
    """
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = PredictionSerializer

    def get_queryset(self, *args, **kwargs):
        # Guest user does not have predictions
        # There for they cannot list the predictions
        if self.request.user.is_anonymous:
            raise PermissionDenied
        return Prediction.objects.all().filter(by_user=self.request.user,
                                               date=datetime.now().replace(hour=0,
                                                                           minute=0,
                                                                           second=0))

    def check_object_permissions(self, request, prediction):
        # Another user cannot see, update or destroy another user's prediction
        if request.user != prediction.by_user:
            raise PermissionDenied
