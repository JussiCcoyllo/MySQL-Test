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
SELECT * FROM movie
JOIN movie_genres mg on movie.movie_id = mg.movie_id
JOIN genre g on mg.genre_id = g.genre_id
WHERE genre_name LIKE '';

-- Tabel: person, movie_cast
-- 10
SELECT p.person_name,
        COUNT(movie_id) AS AMOUNT
FROM movie_cast
JOIN person p on movie_cast.person_id = p.person_id;

-- Tabel Movie
-- 11
SELECT * FROM movie
WHERE runtime > (SELECT AVG(runtime) FROM movie)
ORDER BY title;

CREATE TABLE message (
msg_id INT AUTO_INCREMENT,
message VARCHAR(255),
user_id INT NOT NULL,
receiver_id INT NOT NULL,PRIMARY KEY (msg_id)
);
CREATE TABLE usr (
usr_id INT,
login VARCHAR(50),
email VARCHAR(255)
);

-- 12
INSERT INTO usr (usr_id, login, email)
VALUES (1, 'rincewind',  'rincewind@discworld.org');

-- 13
INSERT INTO usr (usr_id, login, email)
VALUES (2, 'Bursar',  'bursar@unseen.university'),
       (3, 'archchancellor', 'arch@unseen.university');

-- 14
INSERT INTO message (message, user_id, receiver_id)
VALUES ('Bursar?', 3, 2),
       ('Yes, Archchancellor?', 2, 3),
       ('You aren''t a member of some secret society or somethin'', are you?', 3, 2),
       ('Me? No, Archchancellor', 2, 3),
       ('Thenit''d be a damn good idea to take your underpants off your head', 3, 2);

-- 15
UPDATE usr
SET email = 'rincewind@unseen.university'
WHERE email = 'rincewind@discworld.org';

-- 16
DELETE FROM message
WHERE user_id = 2










