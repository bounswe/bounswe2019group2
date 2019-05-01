from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status as st
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.permissions import IsAuthenticated

from . import serializers as ls


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


class InvestmentsView(APIView):
    authentication_classes = (JSONWebTokenAuthentication,)
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        investments = request.user.manualinvestment_set.all()

        response = {
            'investments': []
        }

        for investment in investments:
            response['investments'].append({
                'base_symbol': investment.base_equipment.symbol,
                'target_symbol': investment.target_equipment.symbol,
                'base_amount': investment.base_amount,
                'target_amount': investment.target_amount,
                'date': investment.date
            })

        return Response(response)

