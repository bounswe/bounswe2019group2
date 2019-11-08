from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.exceptions import PermissionDenied
from django.db.models import Count, Avg

from ..models import User, Following, Prediction, Equipment
from ..serializers.users import UserSerializer
from ..serializers import EquipmentSerializer
from rest_framework.response import Response


class UserViewSet(mixins.CreateModelMixin,
                  mixins.RetrieveModelMixin,
                  mixins.UpdateModelMixin,
                  mixins.DestroyModelMixin,
                  GenericViewSet):
    """
    View and edit users
    """
    serializer_class = UserSerializer
    queryset = User.objects.all()

    def check_object_permissions(self, request, user):
        # Another user can only retrieve; cannot update, delete, update or partial_update
        if self.action != 'retrieve' and request.user != user:
            raise PermissionDenied

        elif self.action == 'retrieve' and user.is_private and request.user != user:
            if request.user.is_anonymous or not Following.objects.filter(user_following=request.user,
                                                                         user_followed=user,
                                                                         status=Following.ACCEPTED).exists():
                raise PermissionDenied("User profile is private. Please request to follow")


class UserSuccessViewSet(mixins.RetrieveModelMixin,
                         GenericViewSet):
    """
    View and edit users
    """
    serializer_class = UserSerializer
    queryset = User.objects.all()

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        predictions = Prediction.objects.filter(by_user=instance).exclude(result=Prediction.PENDING)
        counts = predictions.values('parity__base_equipment',
                                    'parity__target_equipment').order_by().annotate(Count('pk'))

        success_list = []
        for item in counts:
            if item['pk__count'] >= 5:
                preds = predictions.filter(parity__base_equipment=item['parity__base_equipment'],
                                           parity__target_equipment=item['parity__target_equipment'])
                mean_success = preds.aggregate(Avg('result'))['result__avg']
                base_eq = Equipment.objects.get(pk=item['parity__base_equipment'])
                target_eq = Equipment.objects.get(pk=item['parity__target_equipment'])
                base_eq = EquipmentSerializer(base_eq, context=self.get_serializer_context()).data
                target_eq = EquipmentSerializer(target_eq, context=self.get_serializer_context()).data
                success_list.append({'base_equipment': base_eq,
                                     'target_equipment': target_eq,
                                     'success_rate': mean_success,
                                     'prediction_count': item['pk__count']})

        serializer = self.get_serializer(instance)
        response_dict = {'user': serializer.data,
                         'success_rates': success_list}

        return Response(response_dict)
