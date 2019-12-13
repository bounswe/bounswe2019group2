from collections import OrderedDict

from rest_framework import serializers

from .models import FragmentSelector, AnnotationBody, AnnotationTarget, Annotation


class FragmentSelectorSerializer(serializers.ModelSerializer):
    class Meta:
        model = FragmentSelector
        fields = ['type', 'value']


class AnnotationBodySerializer(serializers.ModelSerializer):
    id = serializers.URLField(write_only=True, required=False)

    def validate(self, attrs):
        if 'id' in attrs:
            attrs['identifier'] = attrs.pop('id')
        return attrs

    def to_representation(self, instance):
        repr = super().to_representation(instance)

        # drop null field
        keys_to_drop = []
        for key, val in repr.items():
            if repr[key] is None:
                keys_to_drop.append(key)
        for key in keys_to_drop:
            repr.pop(key)

        if repr.get('identifier'):
            repr['id'] = repr.pop('identifier')
        return repr

    class Meta:
        model = AnnotationBody
        fields = ['type', 'value', 'identifier', 'id']
        read_only_fields = ['identifier']


class AnnotationTargetSerializer(serializers.ModelSerializer):
    selector = FragmentSelectorSerializer()

    class Meta:
        model = AnnotationTarget
        fields = ['source', 'selector']


class AnnotationSerializer(serializers.HyperlinkedModelSerializer):
    body = AnnotationBodySerializer()
    target = AnnotationTargetSerializer()

    def to_representation(self, instance):
        key_mapping = {
            'context': '@context',
            'url': 'id'
        }
        repr = OrderedDict()
        for key, val in super().to_representation(instance).items():
            key = key_mapping.get(key, key)
            repr[key] = val
        return repr

    def create(self, validated_data):
        # create body
        body_data = validated_data.pop('body')
        body = AnnotationBody.objects.create(**body_data)

        # create target
        target_data = validated_data.pop('target')
        selector_data = target_data.pop('selector')
        selector = FragmentSelector.objects.create(**selector_data)
        target = AnnotationTarget.objects.create(selector=selector, **target_data)

        # create annotation
        return Annotation.objects.create(body=body, target=target)

    class Meta:
        model = Annotation
        fields = ['context', 'url', 'type', 'created',  'body', 'target']
        read_only_fields = ['created']