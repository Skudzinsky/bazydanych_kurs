#Select
SELECT title, author FROM book;
SELECT * FROM book; 

#Alias
SELECT title AS tytuł FROM book;
SELECT b.title FROM book AS b;

#Where
SELECT * FROM book WHERE title = 'Spring w akcji. Wydanie IV';
SELECT * FROM book WHERE page_count >= 1000;
SELECT * FROM book WHERE page_count > 1000 AND category = 'Bazy danych';
SELECT * FROM book WHERE page_count > 1000 OR NOT category = 'Bazy danych';
SELECT * FROM book WHERE price BETWEEN 50 AND 90;
SELECT * FROM book WHERE isbn IN ('978-83-283-0849-7', '978-83-246-8146-4');
SELECT * FROM book WHERE title LIKE 'Spring w akcji. Wydanie I_';
SELECT * FROM book WHERE title LIKE '%Spring%';
