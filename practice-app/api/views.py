from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.models import User
from rest_framework import status


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
