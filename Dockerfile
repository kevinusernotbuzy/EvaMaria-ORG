FROM python:3.8-slim-buster

# Install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y git

# Copy and install Python dependencies
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -U pip && pip install --no-cache-dir -r requirements.txt

# Set up app directory
WORKDIR /app
COPY . /app

# Expose the Flask app port
EXPOSE 8080

# Start the bot via start.sh
CMD ["/bin/bash", "/start.sh"]
