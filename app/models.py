from flask_sqlalchemy import SQLAlchemy
from db import db

# Association tables for many-to-many relationships
game_tags = db.Table(
    'game_tags',
    db.Column('game_id', db.Integer, db.ForeignKey('games.id'), primary_key=True),
    db.Column('tag_id', db.Integer, db.ForeignKey('tags.id'), primary_key=True)
)

game_genres = db.Table(
    'game_genres',
    db.Column('game_id', db.Integer, db.ForeignKey('games.id'), primary_key=True),
    db.Column('genre_id', db.Integer, db.ForeignKey('genres.id'), primary_key=True)
)

class Category(db.Model):
    __tablename__ = 'categories'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)

    # Relationship to games
    games = db.relationship('Game', back_populates='category')

    def __repr__(self):
        return f"<Category {self.name}>"

class Tag(db.Model):
    __tablename__ = 'tags'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)

    games = db.relationship('Game', secondary=game_tags, back_populates='tags')

    def __repr__(self):
        return f"<Tag {self.name}>"

class Genre(db.Model):
    __tablename__ = 'genres'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)

    games = db.relationship('Game', secondary=game_genres, back_populates='genres')

    def __repr__(self):
        return f"<Genre {self.name}>"

class Game(db.Model):
    __tablename__ = 'games'

    id = db.Column(db.Integer, primary_key=True)
    game_id = db.Column(db.String(50), unique=True)
    title = db.Column(db.String(200), nullable=False)
    display_name = db.Column(db.String(200))
    category_id = db.Column(db.Integer, db.ForeignKey('categories.id'))
    image_url = db.Column(db.String(300))
    price = db.Column(db.Float, nullable=False)
    original_price = db.Column(db.Float)
    short_description = db.Column(db.Text)
    long_description = db.Column(db.Text)

    # Relationships
    category = db.relationship('Category', back_populates='games')
    tags = db.relationship('Tag', secondary=game_tags, back_populates='games')
    genres = db.relationship('Genre', secondary=game_genres, back_populates='games')

    def to_dict(self):
        return {
            "id": self.id,
            "game_id": self.game_id,
            "title": self.title,
            "display_name": self.display_name,
            "category": self.category.name if self.category else None,
            "image_url": self.image_url,
            "price": self.price,
            "original_price": self.original_price,
            "short_description": self.short_description,
            "long_description": self.long_description,
            "tags": [tag.name for tag in self.tags],
            "genres": [genre.name for genre in self.genres],
        }

    def __repr__(self):
        return f"<Game {self.title}>"
