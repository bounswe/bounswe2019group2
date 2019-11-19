from django_filters import rest_framework as filters
from django.forms import ValidationError

from ..models import ArticleComment, EquipmentComment, Equipment


class ArticleCommentFilterSet(filters.FilterSet):
    article = filters.NumberFilter()

    class Meta:
        model = ArticleComment
        fields = ['article']


class EquipmentCommentFilterSet(filters.FilterSet):
    equipment = filters.CharFilter(method='filter_by_equipment')

    def filter_by_equipment(self, queryset, name, value):
        # value can be either pk or symbol of an equipment
        try:
            return queryset.filter(equipment_id=int(value))
        except ValueError:
            return queryset.filter(equipment__symbol=value)

    class Meta:
        model = EquipmentComment
        fields = ['equipment']
