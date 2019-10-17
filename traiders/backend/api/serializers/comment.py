from rest_framework import serializers
from ..models import Comment


class CommentSerializer(serializers.HyperlinkedModelSerializer):

    def validate(self, data):
        data['user'] = self.context['request'].user
        if data.get("image", None) is None and data["content"] == "":
            raise serializers.ValidationError("Please either provide an image or a text as the comment.")
        return data

    def get_fields(self, *args, **kwargs):
        fields = super(CommentSerializer, self).get_fields(*args, **kwargs)
        request = self.context.get('request', None)
        if request and getattr(request, 'method', None) == "PUT":
            fields['article'].read_only = True
        return fields

    class Meta:
        model = Comment
        fields = '__all__'
        read_only_fields = ['id', 'created_at', 'user']
