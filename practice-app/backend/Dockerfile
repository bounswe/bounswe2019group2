FROM python:3.6

# Install requirements spesific to production
RUN pip3 install psycopg2-binary==2.8.2 gunicorn==19.9.0

ADD requirements.txt .
RUN pip3 install -r requirements.txt

ADD . /app

WORKDIR /app

ENV DJANGO_SETTINGS_MODULE practice.production_settings

VOLUME /static

CMD gunicorn practice.wsgi --bind 0.0.0.0:8000 -w 8

EXPOSE 8000