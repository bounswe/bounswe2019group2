from rest_framework import serializers
from ..models import ArticleComment, EquipmentComment


class CommentSerializerBase(serializers.HyperlinkedModelSerializer):
    def validate(self, data):
        data['user'] = self.context['request'].user
        if not data.get('image') and not data.get('content'):
            raise serializers.ValidationError("Please either provide an image or a text as the comment.")
        return data


class ArticleCommentSerializer(CommentSerializerBase):
    def get_fields(self):
        fields = super().get_fields()

        view = self.context.get('view')
        if view and getattr(view, 'action') != 'create':
            fields['article'].read_only = True

        return fields

    class Meta:
        model = ArticleComment
        fields = '__all__'
        read_only_fields = ['id', 'url', 'created_at', 'user']


class EquipmentCommentSerializer(CommentSerializerBase):
    def get_fields(self):
        fields = super().get_fields()

        view = self.context.get('view')
        if view and getattr(view, 'action') != 'create':
            fields['equipment'].read_only = True

        return fields

    class Meta:
        model = EquipmentComment
        fields = '__all__'
        read_only_fields = ['id', 'url', 'created_at', 'user']
