from django.db import models
from django.utils import timezone
from .users import User
from .article import Article


class Comment(models.Model):
    article = models.ForeignKey(Article, on_delete=models.CASCADE, blank=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=False)
    created_at = models.DateTimeField(default=timezone.now)
    content = models.TextField(blank=True, max_length=400)
    image = models.ImageField(blank=True)
