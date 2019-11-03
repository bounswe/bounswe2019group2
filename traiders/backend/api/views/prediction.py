from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.exceptions import PermissionDenied

from ..models import Prediction
from ..serializers import PredictionSerializer


class PredictionViewSet(mixins.CreateModelMixin,
                        mixins.RetrieveModelMixin,
                        mixins.UpdateModelMixin,
                        mixins.DestroyModelMixin,
                        GenericViewSet):
    """
    View and edit comments
    """
    permission_classes = (IsAuthenticatedOrReadOnly,)
    serializer_class = PredictionSerializer
    queryset = Prediction.objects.all()

    def check_object_permissions(self, request, prediction):
        # Another user cannot see, update or destroy another user's prediction
        if request.user != prediction.by_user:
            raise PermissionDenied
