FROM python:3.7

# Install requirements specific to production
RUN pip install psycopg2-binary==2.8.2 gunicorn==19.9.0

ADD requirements.txt .
RUN pip install -r requirements.txt

ADD . /app

WORKDIR /app

VOLUME /static
VOLUME /app/annotation/migrations

ENV DJANGO_SETTINGS_MODULE annotation_server.production_settings

CMD python manage.py makemigrations annotation && \
    python manage.py migrate && \
    python manage.py collectstatic --noinput && \
    gunicorn annotation_server.wsgi --bind 0.0.0.0:8000 -w 8

EXPOSE 8000