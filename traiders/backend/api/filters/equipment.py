from django_filters import rest_framework as filters

from ..models import Equipment


class EquipmentFilterSet(filters.FilterSet):
    category = filters.ChoiceFilter(field_name='category',
                                    choices=Equipment.CATEGORY_CHOICES,
                                    label='Filter equipments by a category')

    class Meta:
        model = Equipment
        fields = ["category"]
