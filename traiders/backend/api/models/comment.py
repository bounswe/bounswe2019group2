from django.db import models
from django.utils import timezone
from ..models import *


class CommentBase(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=False)
    created_at = models.DateTimeField(default=timezone.now)
    content = models.TextField(blank=True, max_length=400)
    image = models.ImageField(blank=True)

    class Meta:
        abstract = True  # django wont create any table for this model
        ordering = ['created_at']


class ArticleComment(CommentBase):
    liked_by = models.ManyToManyField(User, related_name='article_comment_liked_by', blank=True)
    article = models.ForeignKey(Article, on_delete=models.CASCADE, blank=False)


class EquipmentComment(CommentBase):
    liked_by = models.ManyToManyField(User, related_name='equipment_comment_liked_by', blank=True)
    equipment = models.ForeignKey(Equipment, on_delete=models.CASCADE, blank=False)
