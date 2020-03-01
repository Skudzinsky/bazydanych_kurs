#one to many relation
SHOW TABLES;
DROP TABLE IF EXISTS author;
CREATE TABLE author (
    id INT NOT NULL,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    PRIMARY KEY (id)
);
DROP TABLE IF EXISTS book;
CREATE TABLE book (
    id INT NOT NULL,
	title VARCHAR(256) NOT NULL,
	published DATE,
	isbn VARCHAR(32) NOT NULL UNIQUE,
	category VARCHAR(128),
	page_count INT,
	publisher VARCHAR(128) DEFAULT 'nieznana',
	price FLOAT,
    in_stock INT DEFAULT 0,
    author_id INT,
	PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES author(id)
);

INSERT INTO author(id, first_name, last_name)
VALUES (1, 'Craig', 'Walls'); 
INSERT INTO author(id, first_name, last_name)
VALUES (2, 'Paul', 'DuBois'); 

INSERT INTO book(id, title, published, isbn, category, page_count, publisher, price, author_id) 
VALUES (1, 'Spring w akcji. Wydanie IV', '2015-08-13', '978-83-283-0849-7', 'Programowanie java', 624, 'Helion', 89.00, 1);
INSERT INTO book(id, title, published, isbn, category, page_count, publisher, price, author_id) 
VALUES (2, 'MySQL. Vademecum profesjonalisty.', '2014-03-28', '978-83-246-8146-4', 'Bazy danych', 1216, 'Helion', 149.90, 2);

#złączenie tabel
SELECT a.*, b.*
FROM book b 
JOIN author a ON a.id = b.author_id;


#Czy można ustawić tak żeby autor napisał 2 książki?

INSERT INTO book(id, title, published, isbn, category, page_count, publisher, price, author_id) 
VALUES (3, 'MySQL. Vademecum profesjonalisty 2', '2015-03-28', '978-83-246-8146-5', 'Bazy danych', 1211, 'Helion', 149.90, 2);

#złączenie tabel
SELECT b.*
FROM book b 
JOIN author a ON a.id = b.author_id 
WHERE a.id = 2;

#Czy można ustawić by książka była napisana przez 2 autorów?



#Usuwanie danych - constaraint
DELETE FROM author WHERE id = 1; #BŁĄD!

DELETE FROM book WHERE id = 1; #OK!
DELETE FROM author WHERE id = 1; #OK!

#auto increment
CREATE TABLE autoincrement_author (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO autoincrement_author(first_name, last_name) VALUES ('Craig', 'Walls'); 
INSERT INTO autoincrement_author(first_name, last_name) VALUES ('Adam', 'Mickiewicz'); 
DROP TABLE autoincrement_author;

#drop - constaraint
DROP TABLE IF EXISTS author; #BLĄD!

DROP TABLE IF EXISTS book; #OK!
DROP TABLE IF EXISTS author; #OK!


CREATE TABLE book (
    id INT NOT NULL,
	title VARCHAR(256) NOT NULL,
	published DATE,
	isbn VARCHAR(32) NOT NULL UNIQUE,
	category VARCHAR(128),
	page_count INT,
	publisher VARCHAR(128) DEFAULT 'nieznana',
	price FLOAT,
    in_stock INT DEFAULT 0,
	PRIMARY KEY (id)
);

CREATE TABLE author (
    id INT NOT NULL,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    PRIMARY KEY (id),
	book_id INT,
    FOREIGN KEY (book_id) REFERENCES book(id)
);

INSERT INTO book (id, title, published, isbn, category, page_count, publisher, price) 
VALUES (1, 'Spring w akcji. Wydanie IV', '2015-08-13', '978-83-283-0849-7', 'Programowanie java', 624, 'Helion', 89.00);
INSERT INTO book (id, title, published, isbn, category, page_count, publisher, price) 
VALUES (2, 'MySQL. Vademecum profesjonalisty.', '2014-03-28', '978-83-246-8146-4', 'Bazy danych', 1216, 'Helion', 149.90);

INSERT INTO author(id, first_name, last_name, book_id)
VALUES (1, 'Craig', 'Walls', 1); 
INSERT INTO author(id, first_name, last_name, book_id)
VALUES (2, 'Paul', 'DuBois', 2); 

#złączenie tabel
SELECT a.*, b.*
FROM book b 
JOIN author a ON a.book_id = b.id;

#Czy można ustawić tak żeby autor napisał 2 książki?

#Czy można ustawić by książka była napisana przez 2 autorów?
INSERT INTO author(id, first_name, last_name, book_id)
VALUES (3, 'Junior Paul 2', 'DuBois', 2); 

#złączenie tabel 
SELECT a.*
FROM book b 
JOIN author a ON a.book_id = b.id
WHERE b.id = 2;

