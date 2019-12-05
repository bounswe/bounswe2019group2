from django.db import models
from .users import User
from .equipment import Equipment


class Portfolio(models.Model):
    name = models.CharField(max_length=64, blank=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=False, related_name='portfolios')
    followed_by = models.ManyToManyField(User, default=False, related_name='followed_portfolios')


class PortfolioItem(models.Model):
    base_equipment = models.ForeignKey(Equipment, on_delete=models.CASCADE, blank=False, related_name='+')
    target_equipment = models.ForeignKey(Equipment, on_delete=models.CASCADE, blank=False, related_name='+')
    portfolio = models.ForeignKey(Portfolio, on_delete=models.CASCADE, blank=False, related_name='portfolio_items')
