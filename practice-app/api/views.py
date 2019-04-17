from rest_framework.views import APIView
from rest_framework.response import Response


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
