from datetime import datetime

from flask import Blueprint, request, jsonify
from sqlalchemy.orm import joinedload
from models import Game, Tag
from db import db
from sqlalchemy import func, literal

game_bp = Blueprint('game_bp', __name__)

@game_bp.route('/games', methods=['POST'])
def add_game():
    data = request.json

    try:
        game = Game(
            name=data['name'],
            category=data['category'],
            release_date=datetime.strptime(data['release_date'], "%Y-%m-%d"),
            price=float(data['price'])
        )
        db.session.add(game)
        db.session.commit()
        return jsonify(game.to_dict()), 201

    except Exception as e:
        db.session.rollback()
        return jsonify({"error": str(e)}), 400


@game_bp.route('/games', methods=['GET'])
def get_games():
    # Pagination params
    page = request.args.get('page', 1, type=int)
    per_page = request.args.get('per_page', 10, type=int)
    tag_filter = request.args.get('tag', type=str)

    # Base query with eager loading tags for efficiency
    query = Game.query.options(joinedload(Game.tags))

    if tag_filter:
        # Join tags and filter by tag name
        query = query.join(Game.tags).filter(Tag.name == tag_filter)

    # Paginate query
    pagination = query.paginate(page=page, per_page=per_page, error_out=False)

    # Serialize games
    games = [game.to_dict() for game in pagination.items]

    # Return JSON response with pagination meta and games
    return jsonify({
        'total': pagination.total,
        'pages': pagination.pages,
        'page': pagination.page,
        'per_page': pagination.per_page,
        'has_next': pagination.has_next,
        'has_prev': pagination.has_prev,
        'items': games
    }), 200


@game_bp.route('/games/<string:game_id>', methods=['GET'])
def get_game(game_id):
    game = Game.query.filter_by(game_id=game_id).first_or_404()
    return jsonify(game.to_dict()), 200


@game_bp.route('/games/<string:game_id>', methods=['PUT'])
def update_game(game_id):
    game = Game.query.filter_by(game_id=game_id).first_or_404()
    data = request.json

    try:
        game.name = data.get('name', game.name)
        game.category = data.get('category', game.category)
        game.display_name = data.get('display_name', game.display_name)
        game.image_url = data.get('image_url', game.image_url)
        game.short_description = data.get('short_description', game.short_description)
        game.long_description = data.get('long_description', game.long_description)
        game.price = float(data.get('price', game.price))
        game.original_price = float(data.get('original_price', game.original_price))
        if 'release_date' in data:
            game.release_date = datetime.strptime(data['release_date'], "%Y-%m-%d")

        db.session.commit()
        return jsonify(game.to_dict()), 200

    except Exception as e:
        db.session.rollback()
        return jsonify({"error": str(e)}), 400


@game_bp.route('/games/<string:game_id>', methods=['DELETE'])
def delete_game(game_id):
    game = Game.query.filter_by(game_id=game_id).first_or_404()

    try:
        db.session.delete(game)
        db.session.commit()
        return '', 204

    except Exception as e:
        db.session.rollback()
        return jsonify({"error": str(e)}), 400
