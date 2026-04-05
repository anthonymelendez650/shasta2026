#!/usr/bin/env bash
set -euo pipefail

APP_DIR=/opt/webapps/sites/shasta-trip-2026
SERVICE_NAME=shasta-trip-2026.service
NGINX_CONF=shasta.premiumdynasty.com.conf

python3 -m venv "$APP_DIR/.venv"
"$APP_DIR/.venv/bin/pip" install --upgrade pip
"$APP_DIR/.venv/bin/pip" install -r "$APP_DIR/requirements.txt"

sudo cp "$APP_DIR/deploy/systemd/$SERVICE_NAME" /etc/systemd/system/$SERVICE_NAME
sudo systemctl daemon-reload
sudo systemctl enable --now "$SERVICE_NAME"

sudo cp "$APP_DIR/deploy/nginx/$NGINX_CONF" /etc/nginx/sites-available/$NGINX_CONF
sudo ln -sf /etc/nginx/sites-available/$NGINX_CONF /etc/nginx/sites-enabled/$NGINX_CONF
sudo nginx -t
sudo systemctl reload nginx
