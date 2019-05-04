from datetime import datetime

from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.permissions import IsAuthenticated
from django.shortcuts import get_object_or_404

from . import serializers as ls
from .models import ManualInvestment, Parity, Equipment, User
from .serializers import ParitySerializer


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


class ParityListView(APIView):
    def get(self, request):
        parities = Parity.objects.all()
        parity_names = set()

        for parity in parities:
            parity_names.add((parity.base_equipment.symbol, parity.target_equipment.symbol))
        json_formatted = []

        for parity_name in sorted(parity_names):
            json_formatted.append({
                "base": parity_name[0],
                "target": parity_name[1]})

        return Response(json_formatted)


class LoginAPIView(APIView):
    def post(self, *args, **kwargs):
        data = self.request.data
        serializer = ls.LoginSerializer(data=data)
        serializer.is_valid(raise_exception=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


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
            profit += float(current - would_be)

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


class ParityView(APIView):
    def get_latest(self, request):
        base_symbol = request.query_params['base']
        target_symbol = request.query_params['target']
        base_equipment = Equipment.objects.get(symbol=base_symbol)
        target_equipment = Equipment.objects.get(symbol=target_symbol)

        filtered = Parity.objects.order_by('-date').filter(base_equipment=base_equipment,
                                                           target_equipment=target_equipment)[0]

        return Response(ParitySerializer(filtered).data)

    def get_historic(self, request, date):
        parities = Parity.objects

        # apply filters for 'base' and 'target' query params if given
        for base_or_target, symbol in request.query_params.items():
            if base_or_target in ['base', 'target']:
                eq = get_object_or_404(Equipment, symbol=symbol)
                parities = parities.filter(**{f'{base_or_target}_equipment': eq})

        # apply filters for date. we need to filter by year, month and day
        # because we store parity times in datetime fields.
        date = datetime.strptime(date, '%Y-%m-%d')
        parities = parities.filter(date__year=date.year,
                                   date__month=date.month,
                                   date__day=date.day)

        # sort parities to get the latest record in the given day
        parities = parities.order_by('base_equipment', 'target_equipment', '-date')
        parities = list(parities)

        # get latest parity record for each equipment pair
        # this part is useless at the moment, since we have only one parity record for a day.
        # but if we begin to consume a more frequent API in the future,
        # we choose the latest record from the records that have the same date

        latest_in_day = []

        for parity in parities:
            if (not latest_in_day or
                    latest_in_day[-1].base_equipment != parity.base_equipment or
                    latest_in_day[-1].target_equipment != parity.target_equipment):
                latest_in_day.append(parity)

        return Response(ParitySerializer(latest_in_day, many=True).data)

    def get(self, request, date):
        if date == 'latest':
            return self.get_latest(request)
        else:
            return self.get_historic(request, date)