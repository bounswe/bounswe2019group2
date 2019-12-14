from django_filters import rest_framework as filters

from ..models import Portfolio, User


class PortfolioFilterSet(filters.FilterSet):
    followed_by = filters.NumberFilter(method='filter_by_followed_by')

    def filter_by_followed_by(self, queryset, name, value):
        return queryset.filter(id__in=User.objects.get(id=value).followed_portfolios.values_list('id'))

    class Meta:
        model = Portfolio
        fields = ["user", "followed_by"]
