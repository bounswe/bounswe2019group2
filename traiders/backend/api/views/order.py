from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticated
from django_filters.rest_framework import DjangoFilterBackend

from ..models import BuyOrder, StopLossOrder
from ..serializers import BuyOrderSerializer, StopLossOrderSerializer
from ..filters import BuyOrderFilterSet, StopLossOrderFilterSet


class BuyOrderViewSet(mixins.ListModelMixin,
                      mixins.RetrieveModelMixin,
                      mixins.CreateModelMixin,
                      mixins.DestroyModelMixin,
                      GenericViewSet):
    """
    View, create and delete manual investments
    """
    permission_classes = (IsAuthenticated,)
    serializer_class = BuyOrderSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = BuyOrderFilterSet

    def get_queryset(self):
        return BuyOrder.objects.all().filter(user=self.request.user)


class StopLossOrderViewSet(mixins.ListModelMixin,
                           mixins.RetrieveModelMixin,
                           mixins.CreateModelMixin,
                           mixins.DestroyModelMixin,
                           GenericViewSet):
    """
    View, create and delete manual investments
    """
    permission_classes = (IsAuthenticated,)
    serializer_class = StopLossOrderSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = StopLossOrderFilterSet

    def get_queryset(self):
        return StopLossOrder.objects.all().filter(user=self.request.user)
