from rest_framework.viewsets import GenericViewSet
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import mixins
from ..models import Portfolio
from ..serializers import PortfolioSerializer
from rest_framework.exceptions import PermissionDenied



class PortfolioViewSet(mixins.CreateModelMixin,
                       mixins.RetrieveModelMixin,
                       mixins.UpdateModelMixin,
                       mixins.DestroyModelMixin,
                       GenericViewSet):
    serializer_class = PortfolioSerializer
    queryset = Portfolio.objects.all()
    filter_backends = [DjangoFilterBackend]

    def check_object_permissions(self, request, portfolio):
        # Another user can only retrieve; cannot update, delete, update or partial_update
        if self.action != 'retrieve' and request.user != portfolio.owner:
            raise PermissionDenied



