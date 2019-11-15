from rest_framework.schemas import openapi


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

    def _map_serializer(self, serializer):
        # DRF's generator does not work for callable defaults (namely, CurrentUserDefault)
        # (https://github.com/encode/django-rest-framework/issues/6858)
        # delete any 'default' key with callable value

        result = super()._map_serializer(serializer)

        for field_name, schema in result['properties'].items():
            default = schema.get('default')
            if default and callable(default):
                del schema['default']

        return result
