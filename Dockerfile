FROM python:3.8-slim-buster

# Update and install dependencies
RUN apt update && apt upgrade -y
RUN apt install git -y

# Copy requirements and install them
COPY requirements.txt /requirements.txt
RUN pip3 install -U pip && pip3 install -U -r requirements.txt

# Create app directory
RUN mkdir /app
WORKDIR /app

# Copy files
COPY start.sh /start.sh
COPY app.py /app.py
COPY bot.py /bot.py

# Expose the port for Flask
EXPOSE 8080

# Default command to run start.sh
CMD ["/bin/bash", "/start.sh"]
