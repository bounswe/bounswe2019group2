from rest_framework import serializers
from ..models import ArticleComment, EquipmentComment


class ArticleCommentSerializer(serializers.HyperlinkedModelSerializer):

    def validate(self, data):
        data['user'] = self.context['request'].user
        if data.get("image", None) is None and data["content"] == "":
            raise serializers.ValidationError("Please either provide an image or a text as the comment.")
        return data

    def get_fields(self, *args, **kwargs):
        fields = super(ArticleCommentSerializer, self).get_fields(*args, **kwargs)
        request = self.context.get('request', None)
        if request and getattr(request, 'method', None) == "PUT":
            fields['article'].read_only = True

        if getattr(request, 'method', None) == "GET" and ('article' not in request.query_params):
            raise serializers.ValidationError('Please provide an article to see comments for that article.'
                                              'GET Request for all comments is not allowed.')
        return fields

    class Meta:
        model = ArticleComment
        fields = '__all__'
        read_only_fields = ['id', 'url', 'created_at', 'user']


class EquipmentCommentSerializer(serializers.HyperlinkedModelSerializer):

    def validate(self, data):
        data['user'] = self.context['request'].user
        if data.get("image", None) is None and data["content"] == "":
            raise serializers.ValidationError("Please either provide an image or a text as the comment.")
        return data

    def get_fields(self, *args, **kwargs):
        fields = super(EquipmentCommentSerializer, self).get_fields(*args, **kwargs)
        request = self.context.get('request', None)
        if request and getattr(request, 'method', None) == "PUT":
            fields['equipment'].read_only = True

        if getattr(request, 'method', None) == "GET" and ('equipment' not in request.query_params):
            raise serializers.ValidationError('Please provide an equipment to see comments for that equipment.'
                                              'GET Request for all comments is not allowed.')
        return fields

    class Meta:
        model = EquipmentComment
        fields = '__all__'
        read_only_fields = ['id', 'url', 'created_at', 'user']
