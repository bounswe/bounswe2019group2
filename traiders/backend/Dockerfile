FROM python:3.7

RUN apt-get update && apt-get -y install -qq --force-yes cron

# Install requirements specific to production
RUN pip install psycopg2-binary==2.8.2 gunicorn==19.9.0

ADD requirements.txt .
RUN pip install -r requirements.txt

ADD crons /etc/cron.d/crons

RUN chmod 0644 /etc/cron.d/crons && \
    touch /var/log/cron.log

ADD . /app

WORKDIR /app

VOLUME /static
VOLUME /media
VOLUME /app/api/migrations

ENV DJANGO_SETTINGS_MODULE traiders.production_settings

RUN cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1 > /secret.txt

CMD python manage.py makemigrations api && \
    python manage.py migrate && \
    python manage.py collectstatic --noinput && \
    gunicorn traiders.wsgi --bind 0.0.0.0:8000 -w 8

EXPOSE 8000