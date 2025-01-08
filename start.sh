#!/bin/bash

echo "Installing dependencies..."
pip install -U -r requirements.txt || { echo "Dependency installation failed!"; exit 1; }

echo "Starting Flask app for health check..."
gunicorn app:app --bind 0.0.0.0:$PORT --daemon || { echo "Flask app failed to start!"; exit 1; }

echo "Starting the Telegram bot..."
python3 bot.py || { echo "Bot failed to start!"; exit 1; }
