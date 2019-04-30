from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from login import models as lm
from login import serializers as ls
from rest_framework import status as st


class LoginAPIView(APIView):
    def post(self, *args, **kwargs):
        data = self.request.data
        serializer = ls.LoginSerializer(data=data)
        serializer.is_valid(raise_exception=True)
        return Response(serializer.data, status=st.HTTP_200_OK)