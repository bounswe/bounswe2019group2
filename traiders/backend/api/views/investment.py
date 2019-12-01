from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticated
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.response import Response
from rest_framework import serializers
from rest_framework.exceptions import ValidationError

from ..models import *
from ..serializers import *
from ..filters import *


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
        return ManualInvestment.objects.all().filter(user=self.request.user).order_by('pk')


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
        return OnlineInvestment.objects.all().filter(user=self.request.user).order_by('pk')


class AssetViewSet(mixins.ListModelMixin,
                   mixins.RetrieveModelMixin,
                   mixins.CreateModelMixin,
                   GenericViewSet):
    """
    View assets
    """
    permission_classes = (IsAuthenticated,)
    serializer_class = AssetSerializer

    def get_queryset(self):
        return Asset.objects.all().filter(user=self.request.user)


class ProfitLossViewSet(GenericViewSet):
    """
    View user success rates
    """

    @staticmethod
    def _get_profit(investment, equipment):
        base_eq = investment.base_equipment
        target_eq = investment.target_equipment
        base_amount = investment.base_amount
        target_amount = investment.target_amount

        # If the sold equipment is the same as the requested equipment, ratio is 1.
        if base_eq == equipment:
            base_ratio = 1
        else:
            base_ratio = Parity.objects.order_by('-date').filter(base_equipment=base_eq,
                                                                 target_equipment=equipment).first().close

        # If the bought equipment is the same as the requested, ratio is 1.
        if target_eq == equipment:
            target_ratio = 1
        else:
            target_ratio = Parity.objects.order_by('-date').filter(base_equipment=target_eq,
                                                                   target_equipment=equipment).first().close

        current = target_amount * target_ratio
        would_be = base_amount * base_ratio
        profit = float(current - would_be)
        return profit

    def get_queryset(self):
        return (
            ManualInvestment.objects.all()
        )

    class serializer_class(serializers.Serializer):  # this is just for schema generation, not used
        user = UserSerializer()
        profit = serializers.FloatField()
        equipment = serializers.CharField()

    def list(self, request):
        data = {}
        manuals = ManualInvestment.objects.filter(user=self.request.user).order_by('pk')
        onlines = OnlineInvestment.objects.filter(user=self.request.user).order_by('pk')

        if 'equipment' not in self.request.query_params:
            raise ValidationError('Please provide an equipment to see the profit/loss')

        equipment = self.request.query_params['equipment']
        equipment = Equipment.objects.filter(symbol=equipment).first()
        if not equipment:
            raise serializers.ValidationError('Equipment not found')

        manual_profits = 0
        online_profits = 0

        context = self.get_serializer_context()

        data['manual_investments'] = []
        for manual in manuals:
            profit = self._get_profit(manual, equipment)
            investment = ManualInvestmentSerializer(manual, context=context).data
            data['manual_investments'].append({'investment': investment, 'profit': profit})
            manual_profits += profit

        data['online_investments'] = []
        for online in onlines:
            profit = self._get_profit(online, equipment)
            investment = OnlineInvestmentSerializer(online, context=context).data
            data['online_investments'].append({'investment': investment, 'profit': profit})
            online_profits += profit

        data['manual_investment_profits'] = manual_profits
        data['online_investment_profits'] = online_profits
        data['total_profit'] = manual_profits + online_profits

        return Response(data)
