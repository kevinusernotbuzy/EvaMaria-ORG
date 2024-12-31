#!/bin/bash

echo "Installing requirements..."
pip3 install -U -r requirements.txt

# Start Flask app for health check
gunicorn app:app --bind 0.0.0.0:$PORT --daemon

# Start the bot
echo "Starting Bot..."
python3 bot.py
