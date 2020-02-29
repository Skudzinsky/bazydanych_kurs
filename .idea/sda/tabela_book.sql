# 1. Tworzenie bazy dabych i uzytkownika
CREATE DATABASE library;
USE library;
CREATE USER 'library_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON library.* TO 'library_user'@'localhost';
FLUSH PRIVILEGES;


REVOKE ALL PRIVILEGES ON libraryfirst_nameauthorauthor.* FROM 'library_user'@'localhost';

# 2.Nowe polaczenie jako uzytkownik library
# 3. kasowanie uprawnien dskup

REVOKE ALL PRIVILEGES ON test.* FROM 'dskup'@'localhost';
DROP USER 'dskup'@'localhost';

CREATE TABLE author (
			first_name VARCHAR(128),
            lastname VARCHAR(128)
);

CREATE TABLE IF NOT EXISTS author (
			first_name VARCHAR(128),
            lastname VARCHAR(128)
);

DROP TABLE book;

CREATE TABLE IF NOT EXISTS book (
			title VARCHAR(256),
            author VARCHAR(128),
            published DATE,
            isbn VARCHAR(128),
            category VARCHAR(128),
            page_count INT(128),
            publisher VARCHAR(128),
            price FLOAT
);

SHOW DATABASES;
SHOW TABLES;
DESC book;

ALTER TABLE book ADD COLUMN new_column VARCHAR(256);
ALTER TABLE book DROP COLUMN new_column;
USE library;
INSERT INTO book (title, author, published, isbn, category, page_count, publisher, price)
VALUES ('Spring w akcji Wydanie IV', 'Craig Walls', '2015-08-13', '978-83-283-0849-7', 'Programowanie java', 624, 'Helion', 89.00);

UPDATE book
SET title = 'Spring w akcji. Wydanie IV'
WHERE isbn = '978-83-283-0849-7';


INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price)
VALUES ('MySQL. Vademecum profesjonalisty', 'Paul DuBois', '2014-03-28', '978-83-246-8146-4', 'Bazy danych', 1216, 'Helion', 149.00);

SELECT * FROM book;

ALTER TABLE book MODIFY COLUMN title VARCHAR(256) NOT NULL;
ALTER TABLE book MODIFY COLUMN author VARCHAR(128) NOT NULL;
ALTER TABLE book MODIFY COLUMN isbn VARCHAR(128) NOT NULL;
ALTER TABLE book MODIFY COLUMN isbn VARCHAR(128) NOT NULL UNIQUE;
ALTER TABLE book MODIFY COLUMN publisher VARCHAR(128) DEFAULT 'nieznana';

ALTER TABLE book ADD COLUMN in_stock INT DEFAULT 0;

DESC book;
SELECT * FROM book;

SELECT * FROM book WHERE price BETWEEN 50 AND 90;
SELECT * FROM book WHERE isbn IN ('978-83-283-0849-7', '978-83-246-8146-4');
SELECT * FROM book WHERE title LIKE ('Spring w akcji. Wydanie I_');
SELECT * FROM book WHERE title LIKE ('%Spring%');

SELECT DISTINCT publisher FROM book;

SELECT publisher, SUM(price)
FROM book
GROUP BY publisher;

SELECT SUM(page_count) AS total_pages FROM book;
SELECT AVG(page_count) FROM book;
SELECT MIN(page_count) FROM book;
SELECT MAX(page_count) FROM book;

SELECT * FROM book
WHERE EXISTS(SELECT * FROM book WHERE price < 100);

 







