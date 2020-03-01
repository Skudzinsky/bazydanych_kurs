#1. Wstawianie danych
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('tytuł', 'autor', '2000-02-01', 'isbn-1234-5678-9870', 'kategoria', 127, 'wydawnictwo', 99.90);

INSERT INTO book(title, price) 
VALUES ('tytuł',  99.90);

INSERT INTO book(price, title) 
VALUES (99.90, 'tytuł');

INSERT INTO book
VALUES ('tytuł', 'autor', '2000-02-01', 'isbn-1234-5678-9870', 'kategoria', 127, 'wydawnictwo', 99.90);

INSERT INTO book(title, price) 
VALUES ('tytuł1',  99.90),
	   ('tytuł2',  19.90);

#2. Pobieranie danych
select * from book;
