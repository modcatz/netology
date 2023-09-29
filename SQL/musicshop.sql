CREATE TABLE IF NOT EXISTS artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS albums (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    year SMALLINT CHECK (year > 0)
);

CREATE TABLE IF NOT EXISTS tracks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    duration INT,
    album_id INT NOT NULL,
    CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS compilations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    year SMALLINT CHECK (year > 0)
);

CREATE TABLE IF NOT EXISTS album_artist (
    id SERIAL PRIMARY KEY,
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES albums(id) ON DELETE CASCADE,
    CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artists(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS genre_artist (
    id SERIAL PRIMARY KEY,
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    CONSTRAINT fk_artist FOREIGN KEY(artist_id) REFERENCES artists(id) ON DELETE CASCADE,
    CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genres(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS compilation_track (
    id SERIAL PRIMARY KEY,
    compilation_id INT NOT NULL,
    track_id INT NOT NULL,
    CONSTRAINT fk_track FOREIGN KEY(track_id) REFERENCES tracks(id) ON DELETE CASCADE,
    CONSTRAINT fk_compilation FOREIGN KEY(compilation_id) REFERENCES compilations(id) ON DELETE CASCADE
);