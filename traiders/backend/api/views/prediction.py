from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticated
from rest_framework.exceptions import PermissionDenied
from django.utils import timezone
from django_filters.rest_framework import DjangoFilterBackend

from ..models import Prediction
from ..serializers import PredictionSerializer
from ..filters import PredictionFilterSet


class PredictionViewSet(mixins.ListModelMixin,
                        mixins.RetrieveModelMixin,
                        mixins.CreateModelMixin,
                        GenericViewSet):
    """
    View and edit comments
    """
    permission_classes = (IsAuthenticated,)
    serializer_class = PredictionSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = PredictionFilterSet

    def get_queryset(self):
        return Prediction.objects.all().filter(user=self.request.user,
                                               date=timezone.now().date())
