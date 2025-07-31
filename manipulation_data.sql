USE 100_Snyder_Genres;

SELECT * FROM Snyder_Genres;
SELECT * FROM Movies;

SELECT m.title, s.genre_name
FROM Movies m
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
ORDER BY s.genre_name, m.title;

SELECT title, imdb_rating
FROM Movies
ORDER BY imdb_rating DESC
LIMIT 10;

SELECT title, letterboxd_rating
FROM Movies
ORDER BY letterboxd_rating DESC
LIMIT 10;

SELECT m.title, 
       m.imdb_rating, 
       m.letterboxd_rating, 
       s.genre_name
FROM Movies m
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
ORDER BY imdb_rating DESC, letterboxd_rating DESC
LIMIT 10;

SELECT m.title,
	   s.genre_name AS genre,
       letterboxd_rating,
       imdb_rating,
       (letterboxd_rating - (imdb_rating / 2)) AS difference
FROM Movies m
JOIN Snyder_Genres S ON m.id_genre = s.id_genre
ORDER BY ABS(difference) DESC;

SELECT s.genre_name,
	   ROUND(AVG(m.imdb_rating), 2) AS avg_imdb_rating,
       ROUND(AVG(m.letterboxd_rating), 2) AS avg_letterboxd_rating,
       COUNT(*) AS total_movies
FROM Movies m
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
GROUP BY s.genre_name
ORDER BY avg_imdb_rating DESC, avg_letterboxd_rating DESC;

SELECT title, release_year
FROM Movies 
WHERE release_year BETWEEN 2010 AND 2020
ORDER BY release_year DESC;

SELECT s.genre_name AS genre, m.title, m.box_office_millions
FROM Movies m
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
JOIN (
	SELECT id_genre, MAX(box_office_millions) AS max_box_office_millions
	FROM Movies
	WHERE box_office_millions IS NOT NULL
    GROUP BY id_genre
) AS max_values
ON m.id_genre = max_values.id_genre 
AND m.box_office_millions = max_values.max_box_office_millions
ORDER BY m.box_office_millions DESC;

SELECT title, budget_millions, box_office_millions, profit_millions
FROM Movies
WHERE box_office_millions IS NOT NULL AND budget_millions IS NOT NULL
ORDER BY profit_millions DESC;

SELECT 
	s.genre_name AS genre, 
	COUNT(*) AS total_movies, 
    ROUND(SUM(m.profit_millions) / 1000, 2) AS total_profit_billions,
    ROUND(AVG(profit_millions), 2) AS average_profit_millions
FROM Movies m
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
WHERE m.profit_millions IS NOT NULL
GROUP BY s.genre_name
ORDER BY total_profit_Billions DESC;

SELECT m.title, s.genre_name AS genre, m.budget_millions, m.box_office_millions, m.profit_millions
FROM Movies m
JOIN Snyder_Genres s ON m.id_genre = s.id_genre 
WHERE profit_millions < 0;

SELECT director, COUNT(*) AS total_movies
FROM Movies
GROUP BY director
HAVING COUNT(*) > 1 
ORDER BY total_movies DESC;

SELECT s.genre_name AS genre, ROUND(AVG(m.duration_minutes), 1) AS avg_duration_minutes
FROM Movies m
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
WHERE m.duration_minutes IS NOT NULL
GROUP BY s.genre_name
ORDER BY avg_duration_minutes DESC;

SELECT 
	  s.genre_name AS genre,
      m.country_of_origin AS country,
      ROUND(SUM(m.profit_millions), 2) AS total_profit_millions,
      COUNT(*) AS total_movies
FROM Movies m
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
WHERE m.profit_millions IS NOT NULL
GROUP BY s.genre_name, m.country_of_origin 
ORDER BY genre ASC, total_profit_millions DESC;

SELECT 
	  s.genre_name AS genre,
      m.country_of_origin AS country,
      ROUND(AVG(profit_millions), 2) AS avg_profit_millions,
      COUNT(*) AS total_movies
FROM Movies m
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
WHERE m.profit_millions IS NOT NULL
GROUP BY s.genre_name, m.country_of_origin 
ORDER BY avg_profit_millions DESC;

SELECT s.genre_name AS genre, m.production_company, COUNT(*) AS total_movies
FROM Movies m
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
WHERE m.production_company IS NOT NULL
GROUP BY s.genre_name, m.production_company
ORDER BY total_movies DESC;

SELECT 
	  s.genre_name AS genre, 
      distributor, 
      ROUND(SUM(m.profit_millions), 2) AS total_profit_millions, 
      COUNT(*) AS total_movies
FROM Movies m 
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
WHERE m.profit_millions IS NOT NULL
GROUP BY s.genre_name, m.distributor
ORDER BY total_profit_millions DESC;

SELECT 
	  s.genre_name,
      distributor,
      ROUND(AVG(profit_millions), 2) AS avg_profit_millions
FROM Movies m 
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
WHERE profit_millions IS NOT NULL
GROUP BY s.genre_name, distributor
ORDER BY avg_profit_millions DESC;

SELECT 
	  s.genre_name AS genre,
      m.release_year,
      ROUND(SUM(m.profit_millions), 2) AS total_profit_millions
FROM Movies m
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
WHERE m.profit_millions IS NOT NULL
GROUP BY s.genre_name, release_year
ORDER BY m.release_year DESC, total_profit_millions DESC;

SELECT 
      release_year,
      ROUND(AVG(duration_minutes), 1) AS avg_duration_minutes,
      COUNT(*) AS total_movies
FROM Movies
WHERE duration_minutes IS NOT NULL
GROUP BY release_year
ORDER BY release_year;

SELECT 
	  s.genre_name AS genre,
	  release_year,
      ROUND(AVG(duration_minutes), 1) AS avg_duration_minutes,
      COUNT(*) AS total_movies
FROM Movies m
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
WHERE m.duration_minutes IS NOT NULL
GROUP BY m.release_year, s.genre_name
ORDER BY avg_duration_minutes DESC, total_movies DESC;

SELECT 
	  m.title,
      s.genre_name AS genre,
      m.imdb_rating,
      m.letterboxd_rating,
      m.profit_millions
FROM Movies m 
JOIN Snyder_Genres s ON m.id_genre = s.id_genre
WHERE imdb_rating >= 8 OR letterboxd_rating >= 4
ORDER BY profit_millions ASC, imdb_rating DESC, letterboxd_rating DESC
LIMIT 10;