from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
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


class RegisterView(APIView):
    def put(self, request):
        try:
            username = request.data['username']
            password = request.data['password']
            email = request.data['email']
            if User.objects.filter(email=email).exists():
                raise Exception
            user = User(username=username, email=email)
            user.set_password(password)
            user.save()
            return Response({
                'message': f'User {username} is registered'
            })
        except:
            return Response({
                'message': 'Email or username is invalid'}, status=status.HTTP_400_BAD_REQUEST)


class LoginAPIView(APIView):
    def post(self, *args, **kwargs):
        data = self.request.data
        serializer = ls.LoginSerializer(data=data)
        serializer.is_valid(raise_exception=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


class InvestmentProfitAPIView(APIView):
    authentication_classes = (JSONWebTokenAuthentication,)
    permission_classes = (IsAuthenticated,)

    # Helper function for calculating profit of an investment with respect to given currency.
    # Default is Turkish Liras.

    @staticmethod
    def _get_profit(investment, symbol="TRY"):
        default_eq = Equipment.objects.get(symbol=symbol)
        base_eq = investment.base_equipment
        target_eq = investment.target_equipment
        base_amount = investment.base_amount
        target_amount = investment.target_amount

        # If the sold equipment is the same as default equipment, ratio is 1.
        if base_eq.symbol == default_eq.symbol:
            base_default = 1
        else:
            base_default = Parity.objects.order_by('-date').filter(base_equipment=base_eq,
                                                                   target_equipment=default_eq)[0].ratio
        # If the bought equipment is the same as default equipment, ratio is 1.
        if target_eq.symbol == default_eq.symbol:
            target_default = 1
        else:
            target_default = Parity.objects.order_by('-date').filter(base_equipment=target_eq,
                                                                     target_equipment=default_eq)[0].ratio
        current = target_amount * target_default
        would_be = base_amount * base_default
        profit = float(current - would_be)

        return profit

    def post(self, request):
        user_id = request.user.id
        user = User.objects.get(id=user_id)
        symbol = request.POST.get('symbol')

        # If no symbol is given, use TRY as default.

        if symbol is None:
            symbol = "TRY"

        # If no such investment exists in the DB, returning 400.
        else:
            symbols = Equipment.objects.values("symbol")
            symbols = [obj["symbol"] for obj in symbols]

            if symbol not in symbols:
                return Response({
                    'message': 'There is no such currency with symbol ' + str(symbol)},
                    status=status.HTTP_400_BAD_REQUEST)

        investment_id = request.POST.get('id')

        # If no such investment exists in the DB, returning 400.
        try:
            investment = ManualInvestment.objects.get(id=investment_id,
                                                      made_by=user)
        except:
            return Response({
                'message': 'User does not have investment with id: ' + str(investment_id)},
                status=status.HTTP_400_BAD_REQUEST)

        profit = self._get_profit(investment=investment,
                                  symbol=symbol)
        return Response({
            'id': investment_id,
            'profit': profit
        })


class TotalProfitAPIView(APIView):
    authentication_classes = (JSONWebTokenAuthentication,)
    permission_classes = (IsAuthenticated,)

    # Helper function for calculating total profit with respect to given symbol.
    # Default is Turkish Liras

    def _get_total_profit(self, user_id, symbol="TRY"):

        user = User.objects.get(id=user_id)
        # Getting investments of a particular user
        investments = ManualInvestment.objects.filter(made_by=user)
        profit = 0
        for investment in investments:
            # Using the profit calculation of individual profit API.
            profit += InvestmentProfitAPIView._get_profit(investment, symbol)

        return profit

    def get(self, request):
        # If get request, the endpoint will return profit in terms of TRY.
        user_id = request.user.id
        profit = self._get_total_profit(user_id=user_id,
                                        symbol="TRY")
        return Response({
            'total_profit': profit
        })

    def post(self, request):
        user_id = request.user.id
        symbol = request.POST.get('symbol')

        symbols = Equipment.objects.values("symbol")
        symbols = [obj["symbol"] for obj in symbols]

        # If a non-existent symbol is given, return 400 status code.

        if symbol not in symbols:
            return Response({
                'message': 'There is no such currency with symbol ' + str(symbol)},
                status=status.HTTP_400_BAD_REQUEST)

        profit = self._get_total_profit(user_id=user_id,
                                        symbol=symbol)
        return Response({
            'total_profit': profit
        })
