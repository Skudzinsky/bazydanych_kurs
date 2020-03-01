#1. Utwórz nową bazę danych cinema.
CREATE DATABASE cinema;
USE cinema;

#2. Utwórz tabele actor i movie. Im więcej pól opisujących aktora i film dodasz tym lepiej.
# Pamiętaj o utworzeniu relacji pomiędzy tabelami. Jaki rodzaj relacji zastosujesz?

DROP TABLE IF EXISTS actor;
CREATE TABLE actor (
			id_actor INT NOT NULL AUTO_INCREMENT,
			name_actor VARCHAR(256) NOT NULL,
            surname VARCHAR(128) NOT NULL,
            born_date DATE,
            born_city VARCHAR(256),
            PRIMARY KEY (id_actor)		
);
DROP TABLE IF EXISTS movie;
CREATE TABLE movie (
			id_movie INT NOT NULL AUTO_INCREMENT,
            title VARCHAR(256) NOT NULL,
            direction VARCHAR(128) NOT NULL,
            scenario VARCHAR(128) NOT NULL,
            movie_type VARCHAR(128) NOT NULL,
            production_country VARCHAR(128) NOT NULL,
            premiere DATE,
            PRIMARY KEY (id_movie)          
);
#3. Do tabeli actor dodaj swojego ulubionego aktora.
INSERT INTO actor (name_actor, surname, born_date, born_city)
VALUES ('Steven', 'Seagal', '1952-04-10', 'Lansing');

#4. Do tabeli movie dodaj trzy filmy, w których zagrał Twój ulubiony aktor.
INSERT INTO movie (title, direction, scenario, movie_type, production_country, premiere)
VALUES ('Wygrać ze śmiercią', 'Bruce Malmuth', 'Steven McKay', 'Sensacyjny', 'Francja', '1990-02-09');
INSERT INTO movie (title, direction, scenario, movie_type, production_country, premiere)
VALUES ('Liberator 2', 'Geoff Murphy', 'Richard Hatem', 'Sensacyjny', 'USA', '1995-07-14');
INSERT INTO movie (title, direction, scenario, movie_type, production_country, premiere)
VALUES ('Maczeta', 'Ethan Maniquis', 'Álvaro Rodríguez ', 'Akcja', 'USA', '2010-09-01');

#5.Za pomocą jednego polecania select wypisz informacje o filmach, w których zagrał Twój ulubiony aktor.
##złączenie tabel SELECT a.*FROM book b JOIN author a ON a.book_id = b.idWHERE b.id = 2;

CREATE TABLE tabela_pomocnicza (
		id_movie INT,
        id_actor INT,
        FOREIGN KEY (id_movie) REFERENCES movie(id_movie),
        FOREIGN KEY (id_actor) REFERENCES actor(id_actor)
);


        














