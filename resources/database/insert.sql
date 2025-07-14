-- Categories
INSERT INTO categories (name) VALUES ('Action');

-- Tags
INSERT INTO tags (name) VALUES ('War'), ('Battle'), ('Royal');

-- Genres
INSERT INTO genres (name) VALUES ('Action'), ('Team'), ('Single');

-- Games
INSERT INTO games (
    game_id, title, display_name, category_id, image_url, price, original_price, short_description, long_description
) VALUES (
    'AC001', 'Assassin''s Creed', 'Assassin''s Creed', 1, 'assets/images/trending-01.jpg', 24.00, 36.00, 'Dive into a historical adventure.', 'Experience the epic journey through ancient worlds and historical events.'
);
INSERT INTO games (
    game_id, title, display_name, category_id, image_url, price, original_price, short_description, long_description
) VALUES (
    'AC002', 'Assassin''s Creed: Odyssey', 'AC Odyssey', 1, 'assets/images/trending-02.jpg', 22.00, 32.00, 'Explore ancient Greece.', 'Embark on a legendary journey in ancient Greece, shaping your fate in a war-torn world.'
);
INSERT INTO games (
    game_id, title, display_name, category_id, image_url, price, original_price, short_description, long_description
) VALUES (
    'AC003', 'Assassin''s Creed: Valhalla', 'AC Valhalla', 1, 'assets/images/trending-03.jpg', 30.00, 45.00, 'Viking saga begins.', 'Lead epic raids in England and forge your legend as a Viking warrior.'
);
INSERT INTO games (
    game_id, title, display_name, category_id, image_url, price, original_price, short_description, long_description
) VALUES (
    'AC004', 'Assassin''s Creed: Origins', 'AC Origins', 1, 'assets/images/trending-04.jpg', 22.00, 32.00, 'Begin the brotherhood.', 'Uncover the origins of the Assassin Brotherhood in ancient Egypt.'
);
INSERT INTO games (
    game_id, title, display_name, category_id, image_url, price, original_price, short_description, long_description
) VALUES (
    'AC005', 'Assassin''s Creed: Black Flag', 'AC Black Flag', 1, 'assets/images/trending-03.jpg', 26.00, 38.00, 'Pirate and plunder.', 'Sail the seas and become the most feared pirate of the Caribbean.'
);
INSERT INTO games (
    game_id, title, display_name, category_id, image_url, price, original_price, short_description, long_description
) VALUES (
    'AC006', 'Assassin''s Creed: Rogue', 'AC Rogue', 1, 'assets/images/trending-01.jpg', 20.00, 30.00, 'From Assassin to Templar.', 'Switch sides and hunt your former brothers across North America.'
);
INSERT INTO games (
    game_id, title, display_name, category_id, image_url, price, original_price, short_description, long_description
) VALUES (
    'AC007', 'Assassin''s Creed: Unity', 'AC Unity', 1, 'assets/images/trending-04.jpg', 22.00, 32.00, 'French Revolution uprising.', 'Unravel conspiracies during the French Revolution in Paris.'
);
INSERT INTO games (
    game_id, title, display_name, category_id, image_url, price, original_price, short_description, long_description
) VALUES (
    'AC008', 'Assassin''s Creed: Syndicate', 'AC Syndicate', 1, 'assets/images/trending-02.jpg', 22.00, 32.00, 'Industrial era revolution.', 'Liberate London from oppression during the Industrial Revolution.'
);
INSERT INTO games (
    game_id, title, display_name, category_id, image_url, price, original_price, short_description, long_description
) VALUES (
    'AC009', 'Assassin''s Creed: Mirage', 'AC Mirage', 1, 'assets/images/trending-03.jpg', 20.00, 28.00, 'Return to stealth roots.', 'Rediscover stealth gameplay with a return to classic Assassin mechanics.'
);
INSERT INTO games (
    game_id, title, display_name, category_id, image_url, price, original_price, short_description, long_description
) VALUES (
    'AC010', 'Assassin''s Creed: Chronicles', 'AC Chronicles', 1, 'assets/images/trending-04.jpg', 18.00, 26.00, '2.5D adventures.', 'Travel through China, India, and Russia in a unique side-scrolling format.'
);
INSERT INTO games (
    game_id, title, display_name, category_id, image_url, price, original_price, short_description, long_description
) VALUES (
    'AC011', 'Assassin''s Creed: Liberation', 'AC Liberation', 1, 'assets/images/trending-01.jpg', 24.00, 32.00, 'First female Assassin.', 'Fight for freedom in 18th-century New Orleans as Aveline de Grandpré.'
);
INSERT INTO games (
    game_id, title, display_name, category_id, image_url, price, original_price, short_description, long_description
) VALUES (
    'AC012', 'Assassin''s Creed: Brotherhood', 'AC Brotherhood', 1, 'assets/images/trending-02.jpg', 30.00, 45.00, 'Rome must fall.', 'Lead the Brotherhood against the Templars in Renaissance Rome.'
);
INSERT INTO games (
    game_id, title, display_name, category_id, image_url, price, original_price, short_description, long_description
) VALUES (
    'COD MMII', 'Call of Duty®: Modern Warfare® II', 'Modern Warfare® II', 1, 'assets/images/single-game.jpg', 22.00, 28.00, 'LUGX Gaming Template is based on the latest Bootstrap 5 CSS framework...', 'You can search for more templates on Google Search using keywords such as...'
);

-- Game Genre Relations
INSERT INTO game_genres (game_id, genre_id) VALUES (2, 1), (2, 2), (2, 3);
INSERT INTO game_genres (game_id, genre_id) VALUES (3, 1), (3, 2), (3, 3);
INSERT INTO game_genres (game_id, genre_id) VALUES (4, 1), (4, 2), (4, 3);
INSERT INTO game_genres (game_id, genre_id) VALUES (5, 1), (5, 2), (5, 3);
INSERT INTO game_genres (game_id, genre_id) VALUES (6, 1), (6, 2), (6, 3);
INSERT INTO game_genres (game_id, genre_id) VALUES (7, 1), (7, 2), (7, 3);
INSERT INTO game_genres (game_id, genre_id) VALUES (8, 1), (8, 2), (8, 3);
INSERT INTO game_genres (game_id, genre_id) VALUES (9, 1), (9, 2), (9, 3);
INSERT INTO game_genres (game_id, genre_id) VALUES (10, 1), (10, 2), (10, 3);
INSERT INTO game_genres (game_id, genre_id) VALUES (11, 1), (11, 2), (11, 3);
INSERT INTO game_genres (game_id, genre_id) VALUES (12, 1), (12, 2), (12, 3);
INSERT INTO game_genres (game_id, genre_id) VALUES (13, 1), (13, 2), (13, 3);
INSERT INTO game_genres (game_id, genre_id) VALUES (14, 1), (14, 2), (14, 3);

-- Game Tag Relations
INSERT INTO game_tags (game_id, tag_id) VALUES (2, 1), (2, 2), (2, 3);
INSERT INTO game_tags (game_id, tag_id) VALUES (3, 1), (3, 3);
INSERT INTO game_tags (game_id, tag_id) VALUES (4, 1), (4, 2), (4, 3);
INSERT INTO game_tags (game_id, tag_id) VALUES (5, 1), (5, 3);
INSERT INTO game_tags (game_id, tag_id) VALUES (6, 1), (6, 2), (6, 3);
INSERT INTO game_tags (game_id, tag_id) VALUES (7, 3);
INSERT INTO game_tags (game_id, tag_id) VALUES (8, 1);
INSERT INTO game_tags (game_id, tag_id) VALUES (9, 1), (9, 2), (9, 3);
INSERT INTO game_tags (game_id, tag_id) VALUES (10, 1), (10, 2), (10, 3);
INSERT INTO game_tags (game_id, tag_id) VALUES (11, 1), (11, 3);
INSERT INTO game_tags (game_id, tag_id) VALUES (12, 1), (12, 2), (12, 3);
INSERT INTO game_tags (game_id, tag_id) VALUES  (13, 2);
INSERT INTO game_tags (game_id, tag_id) VALUES (14, 1), (14, 2), (14, 3);