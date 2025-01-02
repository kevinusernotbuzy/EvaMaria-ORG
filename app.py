from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "Bot is running successfully."

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8080))  # Default port for Koyeb
    app.run(host="0.0.0.0", port=port)
