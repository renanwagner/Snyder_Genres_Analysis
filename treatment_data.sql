USE 100_Snyder_Genres;

SELECT * FROM Movies;

CREATE TABLE IF NOT EXISTS Movies_backup AS SELECT * FROM Movies;

SELECT *
FROM Movies 
WHERE box_office_millions IS NULL;

UPDATE Movies 
SET box_office_millions = 0 
WHERE box_office_millions IS NULL;

SELECT title, release_year, COUNT(*) AS total_movies
FROM Movies 
GROUP BY title, release_year
HAVING COUNT(*) > 1;

SELECT id_movie, title, id_genre
FROM Movies 
WHERE id_genre NOT IN (SELECT id_genre
					   FROM Snyder_Genres);
                       
SELECT id_movie, title,
CASE
	WHEN profit_millions > 2000 OR duration_minutes > 240 THEN TRUE
    ELSE FALSE
END AS outlier
FROM Movies
WHERE profit_millions > 2000 OR duration_minutes > 240
ORDER BY outlier DESC;