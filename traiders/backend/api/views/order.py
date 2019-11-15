from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticated
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status
from rest_framework.response import Response

from ..models import BuyOrder, StopLossOrder, Asset
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

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        eq = instance.base_equipment
        user = instance.user
        asset = Asset.objects.filter(user=user,
                                     equipment=eq).first()
        amount = instance.buy_amount

        if asset is not None:
            asset.amount = asset.amount + amount
            asset.save()
        else:
            asset = Asset.objects.create(user=user,
                                         equipment=eq,
                                         amount=amount)
            asset.save()
        self.perform_destroy(instance)
        return Response(status=status.HTTP_204_NO_CONTENT)

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

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        eq = instance.base_equipment
        user = instance.user
        asset = Asset.objects.filter(user=user,
                                     equipment=eq).first()
        amount = instance.sell_amount

        # Adding the amount back to the balance of the user

        if asset is not None:
            asset.amount = asset.amount + amount
            asset.save()
        else:
            asset = Asset.objects.create(user=user,
                                         equipment=eq,
                                         amount=amount)
            asset.save()
        self.perform_destroy(instance)
        return Response(status=status.HTTP_204_NO_CONTENT)

    def get_queryset(self):
        return StopLossOrder.objects.all().filter(user=self.request.user)
