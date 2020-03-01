#DISTINCT
SELECT DISTINCT publisher FROM book;
#LIMIT
SELECT publisher FROM book;
SELECT publisher FROM book LIMIT 0, 2;
SELECT publisher FROM book LIMIT 2, 3;
#ORDER BY
SELECT * FROM book ORDER BY author;
SELECT * FROM book ORDER BY author DESC;
SELECT * FROM book ORDER BY category, author;

#GROUP BY
SELECT publisher, ROUND(SUM(price), 2)
FROM book 
GROUP BY publisher;

SELECT publisher, SUM(page_count)
FROM book
GROUP BY publisher;

SELECT SUM(page_count) AS total_pages FROM book;
SELECT ROUND(AVG(page_count), 0) FROM book;
SELECT MIN(page_count) FROM book;
SELECT MAX(page_count) FROM book;

#SELECT x2
SELECT * FROM book
	WHERE price = (SELECT min(price) FROM book);

#HAVING
SELECT count(*) as count, publisher
FROM book
GROUP BY publisher
HAVING count > 1;
 
#EXISTS
#Wyśwetl wszystkie tytuły książek jeśli znajduje się chociaż jedna książka tańsza niż 10 PLN.
SELECT title
FROM book
WHERE EXISTS
	(SELECT * 
	FROM book 
	WHERE price < 10);

#Time
SELECT NOW(), CURDATE(), CURTIME();
#String
SELECT title FROM book WHERE lower(author)='craig walls';

#INSERT INTO FROM TABLE
CREATE TABLE magazine (
	title VARCHAR(256),
	author VARCHAR(128),
	published DATE,
	isbn VARCHAR(32),
	category VARCHAR(128),
	page_count INT,
	publisher VARCHAR(128),
	price FLOAT,
    in_stock INT DEFAULT 0
);
INSERT INTO magazine
	SELECT * FROM book;
    
SELECT * FROM magazine;

INSERT INTO magazine (author)
	SELECT author FROM book;
    
SELECT * FROM magazine;
