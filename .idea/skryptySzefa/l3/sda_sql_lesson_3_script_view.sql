USE library;

#1. Widok
CREATE VIEW sql_books AS
SELECT title, page_count FROM book
WHERE category = 'Bazy danych'; 
SELECT * FROM library.sql_books;

