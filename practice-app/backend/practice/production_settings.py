from .settings import *

# Override development settings
DEBUG = False

with open('/secret.txt', 'r') as secret:
    SECRET_KEY = secret.read().strip()

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