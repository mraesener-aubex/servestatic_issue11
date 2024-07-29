# ServeStatic Issue 11 example repo

modern stuff alert: just (justfile), uv, lcl.host, django-ninja and probably more is used here. no devcontainer yet but planned.

## developement setup

### clone the repo

### setup venv

```bash
$ uv venv
$ just deps
$ .venv/bin/activate
# run it with gunicorn
$ gunicorn --bind 0.0.0.0:${env:HTTPS_PORT} --config ${workspaceFolder}/gunicorn.conf.py config.asgi:application -w 1 -k config.workers.UvicornWorker
```
