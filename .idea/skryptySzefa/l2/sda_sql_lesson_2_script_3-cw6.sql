#1.
CREATE TABLE backup_book (
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
INSERT INTO backup_book
	SELECT * FROM book;

SELECT * FROM backup_book;

#CREATE TABLE backup_book2 AS SELECT * FROM book; # hack! :) 

#2.
CREATE TABLE selected_book (
	title VARCHAR(256) NOT NULL,
	author VARCHAR(128) NOT NULL,
	published DATE,
	isbn VARCHAR(32) NOT NULL UNIQUE,
	page_count INT,
	publisher VARCHAR(128) DEFAULT 'nieznana',
	price FLOAT,
    in_stock INT DEFAULT 0
);
INSERT INTO selected_book
	SELECT title, author, published, isbn, page_count, publisher, price, in_stock
    FROM book WHERE category = 'Bazy danych';
