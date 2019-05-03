from rest_framework.views import APIView
from rest_framework.response import Response
from api.models import Parity


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


class ParityListView(APIView):
    def get(self, request):
        parities = Parity.objects.all()
        parity_names = []

        for parity in parities:
            parity_names.append((parity.base_equipment.symbol, parity.target_equipment.symbol))
        parity_names = set(parity_names)
        parity_names.sort()
        json_formatted = []

        for parity_name in parity_names:
            json_formatted.append({
                "base": parity_name[0],
                "target": parity_name[1]})

        return Response({
            'parity_list': json_formatted
        })
