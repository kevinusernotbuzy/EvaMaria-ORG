#!/bin/bash

# Install requirements
pip3 install -U -r requirements.txt

# Start Flask App
gunicorn app:app --bind 0.0.0.0:$PORT --daemon

# Start Telegram Bot
python3 bot.py
