import re
from rest_framework.schemas import openapi
from rest_framework import serializers


class AutoSchema(openapi.AutoSchema):
    """
    Adds tags
    """

    def get_operation(self, path, method):
        operation = super().get_operation(path, method)

        # add tags for grouping
        operation['tags'] = [self.view.basename]

        return operation

    def _map_field(self, field):
        # DRF's generator does not put type for enums

        result = super()._map_field(field)

        if 'enum' in result and 'type' not in result and field.choices:
            choice = iter(field.choices).__next__()
            if isinstance(choice, str):
                result['type'] = 'string'
            elif isinstance(choice, (int, float)):
                result['type'] = 'number'

        return result
