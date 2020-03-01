SELECT * FROM book 
	WHERE category = 'Klasyka polska'; 
SELECT count(*) FROM book 
	WHERE price BETWEEN 10 AND 30;
SELECT min(page_count) as minimalna_liczba_stron,
	   max(page_count) as maksymalna_liczba_stron 
       FROM book;
SELECT title FROM book 
	where page_count = (select max(page_count) from book);
SELECT * FROM book 
	WHERE published < '2000-01-01';
SELECT count(*), publisher 
	FROM book 
	WHERE published > '2000-01-01' 
    GROUP BY publisher; 
SELECT sum(page_count) 
	FROM book 
	WHERE publisher = 'PWN'; 
SELECT count(*), category FROM book 
	WHERE price > 10.01 
    GROUP BY category 
    HAVING count(*) > 1; 
SELECT title 
	FROM book 
	WHERE category <> 'Lektury' 
    AND price > 20.00 
    ORDER BY title DESC; 
    
SELECT 
	title as tytuł,
    author as autor,
    published as rok_wydania,
    isbn,
    category as kategoria,
    page_count as liczba_stron,
    publisher as wydawnictwo,
    price as cena,
    in_stock as liczba_sztuk_książki
FROM book;   