#!/bin/sh
python /django_app/manage.py migrate
python /django_app/manage.py collectstatic --noinput
gunicorn django_app.wsgi -w 4 -b 0.0.0.0:5000 --chdir=/django_app
