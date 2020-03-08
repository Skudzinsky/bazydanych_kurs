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

#Wyłączyć autocomit w MySQL Workbench
#1.
#Zatwierdzenie traskacji
#BEGIN;
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Spring w akcji. Wydanie IV', 'Craig Walls', '2015-08-13', '978-83-283-0849-7', 'Programowanie java', 624, 'Helion', 89.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('MySQL. Vademecum profesjonalisty.', 'Paul DuBois', '2014-03-28', '978-83-246-8146-4', 'Bazy danych', 1216, 'Helion', 149.90);
COMMIT;

TRUNCATE book;
COMMIT;

#Wycofanie traskacji
#BEGIN;
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Spring w akcji. Wydanie IV', 'Craig Walls', '2015-08-13', '978-83-283-0849-7', 'Programowanie java', 624, 'Helion', 89.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('MySQL. Vademecum profesjonalisty.', 'Paul DuBois', '2014-03-28', '978-83-246-8146-4', 'Bazy danych', 1216, 'Helion', 149.90);
ROLLBACK;

#2.
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Spring w akcji. Wydanie IV', 'Craig Walls', '2015-08-13', '978-83-283-0849-7', 'Programowanie java', 624, 'Helion', 89.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('MySQL. Vademecum profesjonalisty.', 'Paul DuBois', '2014-03-28', '978-83-246-8146-4', 'Bazy danych', 1216, 'Helion', 149.90);
COMMIT;

DELETE FROM book WHERE isbn = '978-83-283-0849-7'; 
ROLLBACK;

DELETE FROM book WHERE isbn = '978-83-283-0849-7'; 
COMMIT;

