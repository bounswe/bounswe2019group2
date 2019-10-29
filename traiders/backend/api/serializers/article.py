from rest_framework import serializers

from ..models import Article, Like
from . import UserSerializer
from .likes import LikeSerializer


class ArticleSerializer(serializers.HyperlinkedModelSerializer):
    author = UserSerializer(read_only=True)
    num_likes = serializers.SerializerMethodField()
    like = serializers.SerializerMethodField()

    def get_num_likes(self, article):
        return Like.objects.filter(article=article).count()

    def get_like(self, article):
        user = self.context['request'].user
        if user.is_anonymous:
            return None

        like = Like.objects.filter(user=user, article=article)

        if like.exists():
            return LikeSerializer(like.first(), context=self.context).data
        else:
            return None

    def validate(self, attrs):
        attrs['author'] = self.context['request'].user
        return attrs

    class Meta:
        model = Article
        fields = ["url", "title", "created_at", "content", "image", "author", "id", "like", "num_likes"]
        read_only_fields = ['id', 'url', 'created_at', 'author', 'like', 'num_likes']
