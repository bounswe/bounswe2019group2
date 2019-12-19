from django_filters import rest_framework as filters

from ..models import Notification


class NotificationFilterSet(filters.FilterSet):
    class Meta:
        model = Notification
        fields = ["user"]
