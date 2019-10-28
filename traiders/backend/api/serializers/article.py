from rest_framework import serializers

from ..models import Article
from . import UserSerializer


class ArticleSerializer(serializers.HyperlinkedModelSerializer):
    author = UserSerializer(read_only=True)

    def validate(self, attrs):
        attrs['author'] = self.context['request'].user
        return attrs

    class Meta:
        model = Article
        fields = ["url", "title", "created_at", "content", "image", "author", "id"]
        read_only_fields = ['id', 'url', 'created_at', 'author']
