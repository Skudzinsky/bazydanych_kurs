CREATE DATABASE cinema;
USE cinema;

#--2--
#tworzę tabelę z aktorami
CREATE TABLE IF NOT EXISTS actor (
    id INT NOT NULL,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    PRIMARY KEY (id)
);

#tworzę tabelę z filmami
CREATE TABLE IF NOT EXISTS movie (
    id INT NOT NULL,
	title VARCHAR(256) NOT NULL,
	PRIMARY KEY (id)
);

#Chcę utworzyć relacje wiele do wielu miedzy aktorem a filmem, 
#żeby zamodelować nastepujące sytuacje z życia:
#-jeden aktor może grać w kilku filmach 
#-w jedym filmie może grać kliku aktorów.
#W tym celu tworzę tabelę łączącą aktorów z filmami: 
CREATE TABLE IF NOT EXISTS starred_in ( 
	actor_id INT,
    movie_id INT,
    FOREIGN KEY (actor_id) REFERENCES actor(id),
    FOREIGN KEY (movie_id) REFERENCES movie(id)
);

#--3--
#wstawiam aktora
INSERT INTO actor VALUES (1, 'Przemo', 'Studnia');

#--4--
#wstawiam filmy
INSERT INTO movie VALUES (1, 'Matrix');
INSERT INTO movie VALUES (2, 'Superman');
INSERT INTO movie VALUES (3, 'Superman 2');

#ustawiam w jakich filmach grał aktor
INSERT INTO starred_in VALUES (1, 1);
INSERT INTO starred_in VALUES (1, 2);
INSERT INTO starred_in VALUES (1, 3);

#--5--
SELECT movie.*, starred_in.*, actor.*
FROM actor 
JOIN movie 
JOIN starred_in on starred_in.actor_id = actor.id 
AND starred_in.movie_id = movie.id
WHERE actor.last_name = 'Studnia';
    

#--6--
INSERT INTO movie VALUES (4, 'Batman');
INSERT INTO actor VALUES ('2', 'Cezary', 'Pazura');
INSERT INTO starred_in VALUES (2, 4);

#--7--
SELECT movie.* 
FROM actor 
JOIN movie 
JOIN starred_in on starred_in.actor_id = actor.id 
AND starred_in.movie_id = movie.id
WHERE actor.last_name='Studnia';


#--8--
INSERT INTO actor VALUES (5, 'Paweł', 'Udający');
INSERT INTO actor VALUES (6, 'Dawid', 'Grający');
INSERT INTO actor VALUES (7, 'Anna', 'Śpiewająca');

INSERT INTO starred_in VALUES (5, 1);
INSERT INTO starred_in VALUES (6, 2);
INSERT INTO starred_in VALUES (7, 3);

#--9--
SELECT movie.title
FROM movie
JOIN actor
JOIN starred_in on starred_in.actor_id = actor.id 
AND starred_in.movie_id = movie.id
GROUP BY movie.title
HAVING count(*) > 1;
