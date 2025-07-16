import os
from flask import Flask
from db import db
from dotenv import load_dotenv
from flask_cors import CORS

# Load environment variables from .env file (if present)
load_dotenv()

app = Flask(__name__)

# Enable CORS on all routes
CORS(app)

app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv("MYSQL_DATABASE_URL")

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db.init_app(app)

# Import models and blueprints after initializing db
from routes.game_routes import game_bp

app.register_blueprint(game_bp)

# Create tables if not exist
with app.app_context():
    db.create_all()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)
