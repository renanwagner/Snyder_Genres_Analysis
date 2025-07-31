CREATE DATABASE IF NOT EXISTS 100_Snyder_Genres;

USE 100_Snyder_Genres;

CREATE TABLE IF NOT EXISTS Snyder_Genres (
	id_genre INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR (100) NOT NULL UNIQUE, 
    genre_description TEXT
);

DROP TABLE IF EXISTS Movies;

CREATE TABLE IF NOT EXISTS Movies (
	id_movie INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR (200) NOT NULL,
    duration_minutes INT,
    budget_millions DECIMAL (10,2),
    box_office_millions DECIMAL (10,2),
    release_year YEAR,
    country_of_origin VARCHAR(200),
    director VARCHAR(200),
    production_company VARCHAR(200),
    distributor VARCHAR(200),
    imdb_rating DECIMAL(2,1),
    letterboxd_rating DECIMAL(2,1),
    id_genre INT,
	FOREIGN KEY (id_genre) REFERENCES Snyder_Genres (id_genre)
);

SELECT * FROM Snyder_Genres;

ALTER TABLE Snyder_Genres
CHANGE genrer_name genre_name VARCHAR (200);

ALTER TABLE Snyder_Genres
CHANGE genrer_description genre_description VARCHAR (200);

ALTER TABLE Movies
ADD COLUMN profit_millions DECIMAL(10,2) GENERATED ALWAYS AS (box_office_millions - budget_millions) STORED;

SELECT * FROM Movies;