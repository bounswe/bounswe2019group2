from rest_framework import serializers
from ..models import Article, Like
from .likes import LikeSerializer


class ArticleSerializer(serializers.HyperlinkedModelSerializer):
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
        fields = '__all__'
        read_only_fields = ['id', 'created_at', 'author']
