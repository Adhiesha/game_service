CREATE DATABASE IF NOT EXISTS gamedb;
USE gamedb;

-- CATEGORY TABLE
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL
);

-- TAG TABLE
CREATE TABLE tags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL
);

-- GAME TABLE
CREATE TABLE games (
    id INT PRIMARY KEY AUTO_INCREMENT,
    game_id VARCHAR(100) UNIQUE,               -- e.g., 'COD MMII'
    title VARCHAR(255) NOT NULL,               -- e.g., 'Call of Duty®: Modern Warfare® II'
    display_name VARCHAR(255),                 -- optional marketing-friendly name
    category_id INT,                           -- foreign key to category
    image_url TEXT,                            -- e.g., 'assets/images/single-game.jpg'
    price DECIMAL(10,2) NOT NULL,              -- discounted price
    original_price DECIMAL(10,2),              -- original price if discounted
    short_description TEXT,                    -- brief overview
    long_description TEXT,                     -- extended tab description
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- GAME <-> TAGS (many-to-many)
CREATE TABLE game_tags (
    game_id INT,
    tag_id INT,
    PRIMARY KEY (game_id, tag_id),
    FOREIGN KEY (game_id) REFERENCES games(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

-- GENRE TABLE
CREATE TABLE genres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL
);

-- GAME <-> GENRES (many-to-many)
CREATE TABLE game_genres (
    game_id INT,
    genre_id INT,
    PRIMARY KEY (game_id, genre_id),
    FOREIGN KEY (game_id) REFERENCES games(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);
