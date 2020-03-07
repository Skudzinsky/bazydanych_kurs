USE library;

INSERT INTO book (title, author, isbn, category)
VALUES ('Atlas świata', 'Damian', '9838493849', 'atlas');

SELECT * FROM book;

#1. Widok
CREATE VIEW sql_books AS
SELECT title, page_count FROM book
WHERE category = 'Biologia';

SELECT * FROM library.sql_books;




