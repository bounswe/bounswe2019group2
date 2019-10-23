from django.db import models
from ..models import User


class Following(models.Model):
    user_following = models.ForeignKey(User,
                                       on_delete=models.CASCADE,
                                       blank=False,
                                       related_name='+')
    user_followed = models.ForeignKey(User,
                                      on_delete=models.CASCADE,
                                      blank=False,
                                      related_name='+')

    def __str__(self):
        return "/".join([self.user_following.username, self.user_followed.username])

    class Meta:
        unique_together = ('user_following', 'user_followed')
