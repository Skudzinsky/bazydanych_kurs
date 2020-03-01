#1. Wczytaj dane ze skryptu input_books.sql
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Ferdydurke', 'Gombrowicz Witold', '1997-02-11', '348-83-342-0849-7', 'Powieść', 432, 'PWN', 23.10);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Mała Apokalipsa', 'Konwicki Tadeusz', '1994-01-13', '545-83-283-0849-1', 'Powieść', 124, 'Niezależna Oficyna Wydawnicza', 19.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Opowiadania', 'Hłasko Marek', '1997-11-02', '978-83-211-0849-3', 'Klasyka polska', 233, 'Wydawnictwo DaCapo', 9.90);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Dziady', 'Mickiewicz Adam', '2007-05-13', '111-22-283-0849-7', 'Lektury', 341, 'Greg', 22.00);
INSERT INTO book(title, author, publishbooked, isbn, category, page_count, publisher, price) 
VALUES ('Mistrz i Małgorzata', 'Bułhakow Michał', '1995-01-02', '978-83-283-3333-7', 'Klasyka zagraniczna', 210, 'Czytelnik', 13.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Wielki atlas roślin', 'Nowak F.A', '1999-08-22', '978-83-44-2111-7', 'Biologia', 280, 'PWRiL', 99.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Granica', 'Nałkowska Zofia', '2000-05-14', '784-83-283-8931-7', 'Klasyka polska', 439, 'PWN', 39.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Saga o Wiedźminie t. 1 - Krew elfów', 'Sapkowski Andrzej', '2001-09-01', '978-83-283-0000-7', 'Powieść fantastyczn', 520, 'Super NOWA', 52.00);
INSERT INTO book(title, author, published, isbn, category, page_count, publisher, price) 
VALUES ('Władca Pierścieni Drużyna Pierscienia T.1', 'Tolkien J. R. R.', '2002-07-01', '900-83-333-0040-7', 'Powieść fantastyczn', 780, 'MUZA S.A.', 41.00);
SELECT * FROM book;

#2. Wyświetl książki z kategorii Klasyka polska.
SELECT * FROM book WHERE category = 'Klasyka polska';
#3. Policz ile jest książek w przedziale cenowym 10 - 30 zł.
SELECT count(*) FROM book WHERE price BETWEEN 10 AND 30;
#4. Wyświetl największą liczbę stron oraz najmniejszą w książkach.
SELECT MIN(page_count) FROM book;
SELECT MAX(page_count) FROM book;
#5. Wyświetl tytuł książki z największą ilością stron.
SELECT title FROM book WHERE page_count = (SELECT MAX(page_count) FROM book);
#6. Wyświetl książki wydane przed 2000 rokiem.
SELECT * FROM book WHERE published < '2000-01-01';
#7. Policz ile książek wydało każde z wydawnictw po 2000 roku.
SELECT count(*) as count, publisher
FROM book
WHERE published > '2000-01-01'
GROUP BY publisher;
#8. Policz jaka jest suma stron książek wydanych przez wydawnictwo PWN.
SELECT SUM(page_count) AS total_pages
FROM book
WHERE publisher = 'PWN';
#9. Wyświetl kategorie książek dla których istnieją co najmniej 2 książki, których cena jest większa od 10.01 zł.
SELECT count(*) as count, category
FROM book
WHERE price > 10.01
GROUP BY category
HAVING count >= 2; 
#10. Wyświetl tytuły książek posortowane alfabetycznie w porządku malejącym, które nie są lekturą i których cena jest większa niż 20 zł
SELECT title
FROM book
WHERE category != 'Lektury' AND price > 20
ORDER BY title DESC;
#11. Wyświetl wszystkie dane z tabeli book tłumacząc nazwy kolumn na język polski.
SELECT
title AS tytuł,
author AS autor,
published AS wydana,
isbn,
category AS kategoria,
page_count AS liczba_stron,
publisher AS wydawca,
price AS cena
FROM book;










