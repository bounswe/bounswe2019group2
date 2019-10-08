from rest_framework.viewsets import ModelViewSet

from ..models.users import User
from ..serializers.users import UserSerializer


class UserViewSet(ModelViewSet):
    """
    View and edit users
    """
    serializer_class = UserSerializer
    queryset = User.objects.all()
