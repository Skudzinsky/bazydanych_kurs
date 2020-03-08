USE library;
CREATE TABLE book (
	title VARCHAR(256) NOT NULL,
	author VARCHAR(128) NOT NULL,
	published DATE,
	isbn VARCHAR(32) NOT NULL UNIQUE,
	category VARCHAR(128),
	page_count INT,
	publisher VARCHAR(128) DEFAULT 'nieznana',
	price FLOAT,
    in_stock INT DEFAULT 0
);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Spring w akcji. Wydanie IV', 'Craig Walls', '2015-08-13', '978-83-283-0849-7', 'Programowanie java', 624, 'Helion', 89.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('MySQL. Vademecum profesjonalisty.', 'Paul DuBois', '2014-03-28', '978-83-246-8146-4', 'Bazy danych', 1216, 'Helion', 149.90);
INSERT INTO book (title, author, isbn) 
VALUES ('nowy tytuł', 'nowy autor', 'isbn 1234');

#1. Wyświetl książki które nie mają ustwionej kategori.
SELECT * FROM book;
SELECT * FROM book WHERE category IS NULL; # OK :)
SELECT * FROM book WHERE category = NULL; # ŹLE :(
#Dla SQL NULL to "nie wiem". Czy "nie wiem" jest równe X -> Nie wiem :)

# Uwaga:
# Wyświetl książki których kategoria jest różna od baz danych.
SELECT * FROM book;
SELECT * FROM book WHERE category <> 'Bazy danych'; # Uwaga tak nie zadziała!
SELECT * FROM book WHERE category != 'Bazy danych'; # Uwaga tak nie zadziała!
SELECT * FROM book WHERE category <> 'Bazy danych' OR category IS NULL; # OK :)
SELECT * FROM book WHERE category != 'Bazy danych' OR category IS NULL; # OK :)


