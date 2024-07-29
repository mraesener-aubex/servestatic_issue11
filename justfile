set dotenv-load

reset-db:
  rm -f db.sqlite3
  # Delete __pycache__ directories
  find . -name "__pycache__" -type d -exec rm -r {} +
  # Delete all *.py files in migrations directories, except __init__.py
  find issue11 -path "*/migrations/*.py" ! -name "__init__.py" -type f -delete
  python manage.py makemigrations
  python manage.py migrate
  python manage.py createsuperuser --noinput

app-deps:
  uv pip compile requirements/app.in -o requirements/app.pip

deps:
  just app-deps
  uv pip compile requirements/dev.in -o requirements/dev.pip
  uv pip sync requirements/dev.pip