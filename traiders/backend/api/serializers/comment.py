from rest_framework import serializers

from ..models import ArticleComment, EquipmentComment
from . import UserSerializer


class IsLiked(serializers.BooleanField):
    def get_attribute(self, instance):
        if self.context['request'].user.is_anonymous:
            return False
        return instance.liked_by.filter(pk=self.context['request'].user.pk).exists()


class CommentSerializerBase(serializers.HyperlinkedModelSerializer):
    user = UserSerializer(read_only=True)
    is_liked = IsLiked()

    def validate(self, data):
        data['user'] = self.context['request'].user
        return data

    def create(self, validated_data: dict):
        if 'is_liked' in validated_data:
            validated_data.pop('is_liked')
        if not validated_data.get('image') and not validated_data.get('content'):
            raise serializers.ValidationError("Please either provide an image or a text as the comment.")
        return super().create(validated_data)

    def update(self, instance, validated_data: dict):
        is_liked = validated_data.pop('is_liked', None)

        likers = instance.liked_by.all()

        if is_liked is True:
            if self.context['request'].user.is_anonymous:
                raise serializers.ValidationError('A guest user cannot like a comment. '
                                                  'Please login to perform this action.')
            if self.context['request'].user in likers:
                raise serializers.ValidationError('You already like this comment.')
            instance.liked_by.add(self.context['request'].user)
        elif is_liked is False:
            if self.context['request'].user.is_anonymous:
                raise serializers.ValidationError('A guest user cannot unlike a comment '
                                                  'Please login to perform this action.')
            if self.context['request'].user not in likers:
                raise serializers.ValidationError('You already do not like this comment.')
            instance.liked_by.remove(self.context['request'].user)

        return super().update(instance, validated_data)


class ArticleCommentSerializer(CommentSerializerBase):
    def get_fields(self):
        fields = super().get_fields()

        view = self.context.get('view')
        if view and getattr(view, 'action') != 'create':
            fields['article'].read_only = True

        return fields

    class Meta:
        model = ArticleComment
        fields = ["id", "url", "created_at", "content", "image", "user",
                  "article", "is_liked", "liked_by"]
        read_only_fields = ['id', 'url', 'created_at', 'user', 'liked_by', 'is_liked']


class EquipmentCommentSerializer(CommentSerializerBase):
    def get_fields(self):
        fields = super().get_fields()

        view = self.context.get('view')
        if view and getattr(view, 'action') != 'create':
            fields['equipment'].read_only = True

        return fields

    class Meta:
        model = EquipmentComment
        fields = ["id", "url", "created_at", "content",
                  "image", "user", "equipment", "is_liked", "liked_by"]
        read_only_fields = ['id', 'url', 'created_at', 'user', 'liked_by', 'is_liked']
