from .settings import *
from django.core.management.utils import get_random_secret_key


# Override development settings
DEBUG = False

ALLOWED_HOSTS = [
    'api.traiders.tk'
]

with open('/secret.txt', 'r') as file:
    SECRET_KEY = file.read()

# Use postgres in production
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'HOST': 'db',
        'PORT': '5432',
        'NAME': 'postgres',
        'USER': 'postgres',
        'PASSWORD': 'postgres'
    }
}

STATIC_URL = '/static/'
STATIC_ROOT = '/static/'

MEDIA_ROOT = '/media'
MEDIA_URL = 'media.traiders.tk/'
