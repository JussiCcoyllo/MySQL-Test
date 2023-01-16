USE movies;

-- Tabel movie
-- 1
SELECT title, runtime FROM movie
WHERE runtime > 120;

-- 2
SELECT title FROM movie
WHERE title LIKE '%teen%';

-- 3
SELECT DISTINCT vote_average from movie;

-- 4
SELECT title,  revenue AS 'Euros', revenue * 1.1 AS 'Britse Pond' FROM movie;

-- Tabel movie_cast
-- 5
SELECT COUNT(gender_id) FROM movie_cast
GROUP BY gender_id;

-- 6
SELECT title,
       COUNT(language_id) AS 'Multiple languages'
FROM movie_languages
JOIN movie on movie_languages.movie_id = movie.movie_id
GROUP BY movie.movie_id
HAVING COUNT(*) > 2;

-- Tabel: movie, movie_keywords, keyword
-- 7
SELECT movie.title,
     keyword.keyword_name
FROM keyword
JOIN movie_keywords mk on keyword.keyword_id = mk.keyword_id
JOIN movie on mk.movie_id = movie.movie_id
WHERE keyword_name LIKE 'space opera' AND movie.title NOT LIKE '%star%';

-- Tabel: movie, genre, movie_genre.
-- 8
SELECT title,
       g.genre_name
FROM movie
JOIN movie_genres mg on movie.movie_id = mg.movie_id
JOIN genre g on g.genre_id = mg.genre_id
WHERE genre_name LIKE 'Horror';

-- 9


-- Tabel: person, movie_cast
-- 10
SELECT p.person_name,
        COUNT(movie_id) AS AMOUNT
FROM movie_cast
JOIN person p on movie_cast.person_id = p.person_id;

-- Tabel Movie
-- 11
SELECT title, AVG(runtime)
FROM movie
GROUP BY title
HAVING  AVG(runtime) > 106.000;










