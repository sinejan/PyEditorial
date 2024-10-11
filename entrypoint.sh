#!/bin/sh

echo "Starting application..."


python manage.py makemigrations content
python manage.py migrate

# Statik dosyaları topla
python manage.py collectstatic --noinput

# Gunicorn'u başlat
exec gunicorn myapp.wsgi:application --bind 0.0.0.0:8000
