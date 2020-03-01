CREATE TABLE backup_book (
			title VARCHAR(256) NOT NULL,
            author VARCHAR(128) NOT NULL,
            published DATE,
            isbn VARCHAR(128) NOT NULL UNIQUE,
            category VARCHAR(128),
            page_count INT(128),
            publisher VARCHAR(128) DEFAULT 'nieznana',
            price FLOAT,
            in_stock INT DEFAULT 0
);

DROP TABLE backup_book;

INSERT INTO backup_book
SELECT * FROM book;

DESC book;
DESC backup_book;

SELECT * FROM backup_book;
#2.
CREATE TABLE selected_book (
			title VARCHAR(256) NOT NULL,
            author VARCHAR(128) NOT NULL,
            published DATE,
            isbn VARCHAR(128) NOT NULL UNIQUE,
            page_count INT(128),
            publisher VARCHAR(128) DEFAULT 'nieznana',
            price FLOAT,
            in_stock INT DEFAULT 0
);
DROP TABLE selected_book;

INSERT INTO selected_book (title, author, published, isbn, page_count, publisher, price, in_stock)
SELECT title, author, published, isbn, page_count, publisher, price, in_stock
FROM backup_book
WHERE category = 'Powieść';

SELECT * FROM selected_book;
#3. hack
CREATE TABLE backup_book2 AS SELECT * FROM book;
SELECT * FROM backup_book2;




