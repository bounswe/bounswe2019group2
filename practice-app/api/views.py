from rest_framework.views import APIView
from rest_framework.response import Response
from django.utils import timezone
from api.models import Equipment, Parity
from datetime import datetime

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

class UptodateParityView(APIView):
	def get(self, request):
		return Response({
			'message': 'Hello, buddy.'
		})

	def post(self, request):
		base_symbol = request.data['base_symbol']
		target_symbol = request.data['target_symbol']
		base_equipment = Equipment.objects.get(symbol=base_symbol)
		target_equipment = Equipment.objects.get(symbol=target_symbol)
		filtered = Parity.objects.filter(base_equipment = base_equipment, target_equipment = target_equipment)
		return Response({
			'Base Equipment': filtered[0].base_equipment.symbol,
			'Target Equipment': filtered[0].target_equipment.symbol,
			'Ratio': filtered[0].ratio
		})