from .settings import *

# Override development settings
DEBUG = False

ALLOWED_HOSTS = [
    'api.traiders.tk'
]

from django.core.management.utils import get_random_secret_key
SECRET_KEY = get_random_secret_key()

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
