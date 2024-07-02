#!/bin/bash
set -e

# Apply database migrations
python manage.py migrate --noinput

# Collect static files
python manage.py collectstatic --noinput

# Start Gunicorn
gunicorn --workers 2 --bind 0.0.0.0:8000 myproject.wsgi
