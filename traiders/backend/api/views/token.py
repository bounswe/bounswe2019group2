from rest_framework.viewsets import GenericViewSet
from rest_framework import mixins

from ..serializers import TokenSerializer


class TokenViewSet(mixins.CreateModelMixin, GenericViewSet):
    """
    Create or get already created token
    """
    serializer_class = TokenSerializer
