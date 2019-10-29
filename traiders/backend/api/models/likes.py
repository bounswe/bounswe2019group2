from django.db import models
from .users import User
from .article import Article


class Like(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=False)
    article = models.ForeignKey(Article, on_delete=models.CASCADE, blank=False)
