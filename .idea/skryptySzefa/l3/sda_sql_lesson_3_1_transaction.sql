#1.
USE library;

UPDATE book SET price=1000 WHERE isbn = '978-83-283-0849-7';
INSERT INTO book (title, author, isbn) 
VALUES ('nowy tytuł', 'nowy autor', 'isbn 1234');
SELECT * FROM book;

#2.
ROLLBACK;
SELECT * FROM book;

#3.
COMMIT;
SELECT * FROM book;