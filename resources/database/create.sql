-- CATEGORY TABLE
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL
);

-- TAG TABLE
CREATE TABLE tags (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL
);

-- GAME TABLE
CREATE TABLE games (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    game_id TEXT UNIQUE,                        -- e.g., 'COD MMII'
    title TEXT NOT NULL,                        -- e.g., 'Call of Duty®: Modern Warfare® II'
    display_name TEXT,                          -- optional marketing-friendly name
    category_id INTEGER,                        -- foreign key to category
    image_url TEXT,                             -- e.g., 'assets/images/single-game.jpg'
    price REAL NOT NULL,                        -- discounted price
    original_price REAL,                        -- original price if discounted
    short_description TEXT,                     -- brief overview
    long_description TEXT,                      -- extended tab description
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- GAME <-> TAGS (many-to-many)
CREATE TABLE game_tags (
    game_id INTEGER,
    tag_id INTEGER,
    PRIMARY KEY (game_id, tag_id),
    FOREIGN KEY (game_id) REFERENCES games(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

-- GAME <-> GENRES (many-to-many)
CREATE TABLE genres (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE game_genres (
    game_id INTEGER,
    genre_id INTEGER,
    PRIMARY KEY (game_id, genre_id),
    FOREIGN KEY (game_id) REFERENCES games(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);
