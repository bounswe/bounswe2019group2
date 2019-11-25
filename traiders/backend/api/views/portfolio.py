from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.viewsets import GenericViewSet
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import mixins
from ..models import Portfolio
from ..serializers import PortfolioSerializer
from rest_framework.exceptions import PermissionDenied
from rest_framework.response import Response
from rest_framework import status


class PortfolioViewSet(mixins.CreateModelMixin,
                       mixins.RetrieveModelMixin,
                       mixins.UpdateModelMixin,
                       mixins.ListModelMixin,
                       mixins.DestroyModelMixin,
                       GenericViewSet):
    serializer_class = PortfolioSerializer
    queryset = Portfolio.objects.all()
    filter_backends = [DjangoFilterBackend]
    permission_classes = (IsAuthenticatedOrReadOnly,)

    def list(self, request, *args, **kwargs):
        if 'user' not in request.query_params:
            return Response({
                'user': 'Please provide a user to see his/her portfolios'
            }, status=status.HTTP_400_BAD_REQUEST)

        return super().list(request, *args, **kwargs)

    def check_object_permissions(self, request, portfolio):
        # Another user can only retrieve; cannot delete
        if (self.action == 'create' or self.action == 'destroy') and request.user != portfolio.user:
            raise PermissionDenied
