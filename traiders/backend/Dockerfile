FROM python:3.7

# Install requirements specific to production
RUN pip install psycopg2-binary==2.8.2 gunicorn==19.9.0

ADD requirements.txt .
RUN pip install -r requirements.txt

ADD . /app

WORKDIR /app

VOLUME /static

ENV DJANGO_SETTINGS_MODULE traiders.production_settings

RUN cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1 > /secret.txt

CMD python manage.py makemigrations api && \
    python manage.py migrate && \
    python manage.py collectstatic --noinput && \
    gunicorn traiders.wsgi --bind 0.0.0.0:8000 -w 8

EXPOSE 8000