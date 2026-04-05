# Shasta Trip 2026

Flask site for `shasta.premiumdynasty.com`.

## Structure

- `web/`: Flask application code, templates, and static assets
- `wsgi.py`: Gunicorn entrypoint
- `deploy/`: deployment assets for systemd and Nginx

## Local run

```bash
python3 -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
python3 wsgi.py
```
