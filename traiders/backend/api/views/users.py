from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins
from rest_framework.exceptions import PermissionDenied
from django.db.models import Count, Avg
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import serializers

from ..models import User, Following, Prediction, Equipment
from ..serializers import EquipmentSerializer, UserSerializer


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


class UserSuccessViewSet(GenericViewSet):
    """
    View user success rates
    """
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ('user',)

    class serializer_class(serializers.Serializer):  # this is just for schema generation, not used
        base_equipment = EquipmentSerializer()
        target_equipment = EquipmentSerializer()
        success_rate = serializers.FloatField()
        prediction_count = serializers.IntegerField()
        user = UserSerializer

    def get_queryset(self):
        return (
            Prediction.objects
                      .exclude(result=Prediction.PENDING)  # exclude pending predictions
                      .values('user', 'base_equipment', 'target_equipment')  # group by user and parity
                      .annotate(count=Count('pk'), average=Avg('result'))  # count and average for each group
                      .filter(count__gte=5)  # condition for visibility
        )

    def list(self, request):
        queryset = self.filter_queryset(self.get_queryset())

        success_list = []
        for item in queryset:
            base_eq = Equipment.objects.get(pk=item['base_equipment'])
            target_eq = Equipment.objects.get(pk=item['target_equipment'])
            user = User.objects.get(pk=item['user'])

            context = self.get_serializer_context()
            base_eq = EquipmentSerializer(base_eq, context=context).data
            target_eq = EquipmentSerializer(target_eq, context=context).data
            user = UserSerializer(user, context=context).data

            success_list.append({'base_equipment': base_eq,
                                 'target_equipment': target_eq,
                                 'success_rate': item['average'],
                                 'prediction_count': item['count'],
                                 'user': user})

        return Response(success_list)
