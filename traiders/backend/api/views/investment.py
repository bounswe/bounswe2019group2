from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticated
from django_filters.rest_framework import DjangoFilterBackend

from ..models import ManualInvestment, Asset, OnlineInvestment
from ..serializers import ManualInvestmentSerializer, AssetSerializer, OnlineInvestmentSerializer
from ..filters import ManualInvestmentFilterSet, OnlineInvestmentFilterSet


class ManualInvestmentViewSet(mixins.ListModelMixin,
                              mixins.RetrieveModelMixin,
                              mixins.CreateModelMixin,
                              mixins.DestroyModelMixin,
                              GenericViewSet):
    """
    View, create and delete manual investments
    """
    permission_classes = (IsAuthenticated,)
    serializer_class = ManualInvestmentSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = ManualInvestmentFilterSet

    def get_queryset(self):
        return ManualInvestment.objects.all().filter(user=self.request.user)


class OnlineInvestmentViewSet(mixins.ListModelMixin,
                              mixins.RetrieveModelMixin,
                              mixins.CreateModelMixin,
                              mixins.DestroyModelMixin,
                              GenericViewSet):
    """
    View, create and delete manual investments
    """
    permission_classes = (IsAuthenticated,)
    serializer_class = OnlineInvestmentSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = OnlineInvestmentFilterSet

    def get_queryset(self):
        return OnlineInvestment.objects.all().filter(user=self.request.user)


class AssetViewSet(mixins.ListModelMixin,
                   mixins.RetrieveModelMixin,
                   GenericViewSet):
    """
    View assets
    """
    permission_classes = (IsAuthenticated,)
    serializer_class = AssetSerializer

    def get_queryset(self):
        return Asset.objects.all().filter(user=self.request.user)
