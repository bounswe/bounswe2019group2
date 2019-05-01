from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status as st
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.permissions import IsAuthenticated

from . import serializers as ls
from .models import ManualInvestment, Parity, Equipment, User


class HelloWorldView(APIView):
    def get(self, request):
        return Response({
            'message': 'Hello, stranger.'
        })

    def post(self, request):
        name = request.data['name']

        return Response({
            'message': f'Hello, {name}.'
        })


class LoginAPIView(APIView):
    def post(self, *args, **kwargs):
        data = self.request.data
        serializer = ls.LoginSerializer(data=data)
        serializer.is_valid(raise_exception=True)
        return Response(serializer.data, status=st.HTTP_200_OK)


class TotalProfitAPIView(APIView):
    authentication_classes = (JSONWebTokenAuthentication,)
    permission_classes = (IsAuthenticated,)

    # Helper function for calculating total profit with respect to given symbol.
    # Default is Turkish Liras

    def get_total_profit(self, username, symbol="TRY"):
        user = User.objects.filter(username=username)[0]

        # Getting investments of a particular user

        investments = ManualInvestment.objects.filter(made_by=user)
        default_eq = Equipment.objects.filter(symbol=symbol)[0]
        profit = 0

        for investment in investments:

            base_eq = investment.base_equipment
            target_eq = investment.target_equipment
            base_amount = investment.base_amount
            target_amount = investment.target_amount

            # If the sold equipment is the same as default eqipment, ratio is 1.
            if base_eq.symbol == default_eq.symbol:
                base_default = 1

            else:
                base_default = Parity.objects.order_by('-date').filter(base_equipment=base_eq,
                                                                          target_equipment=default_eq)[0].ratio

            # If the bought equipment is the same as default eqipment, ratio is 1.
            if target_eq.symbol == default_eq.symbol:
                target_default = 1
            else:
                target_default = Parity.objects.order_by('-date').filter(base_equipment=target_eq,
                                                                         target_equipment=default_eq)[0].ratio
            current = target_amount*target_default
            would_be = base_amount*base_default
            profit += float(current-would_be)

        return profit

    def get(self, request):
        # If get request, the endpoint will return profit in terms of TRY.

        username = request.user.id
        profit = self.get_total_profit(username)
        return Response({
            'total_profit': profit
        })

    def post(self, request):
        username = request.user.id
        symbol = request.data['symbol']
        profit = self.get_total_profit(username=username,
                                       symbol=symbol)
        return Response({
            'total_profit': profit
        })
