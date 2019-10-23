from django_filters import rest_framework as filters

from ..models import Following, User


class FollowingFilterSet(filters.FilterSet):
    user_following = filters.ModelChoiceFilter(queryset=User.objects.all())
    user_followed = filters.ModelChoiceFilter(queryset=User.objects.all())

    class Meta:
        model = Following
        fields = {"user_following": ["exact"], "user_followed": ["exact"]}
