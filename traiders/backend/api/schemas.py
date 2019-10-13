import re
from rest_framework.schemas import openapi


class AutoSchema(openapi.AutoSchema):
    """
    Adds tags and path descriptions
    """

    @property
    def descriptions(self):
        if hasattr(self, '_descriptions'):
            return self._descriptions

        # extract descriptions from view class' docstring
        self._descriptions = {}
        docstring = self.view.__doc__

        if docstring:
            docstring_lines = docstring.splitlines()

            current_action = None
            for line in docstring_lines:
                line = line.strip()
                if re.match(r'^\w+:', line):
                    current_action, description = line.split(':')
                    self._descriptions[current_action] = description
                elif current_action:
                    self._descriptions[current_action] += '\n' + line

        return self._descriptions

    def get_operation(self, path, method):
        operation = super().get_operation(path, method)

        # add tags for grouping
        operation['tags'] = [self.view.basename]

        # add description for action
        operation['description'] = self.descriptions.get(self.view.action, '')

        return operation
