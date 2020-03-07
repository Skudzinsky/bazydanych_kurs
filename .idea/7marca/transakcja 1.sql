#1. Transakcja 1
#2. Wyłączyłem autocommit
#3. Aktualizuje cene ksiazki Dziady
UPDATE book
SET price = '1000'
WHERE isbn = '111-22-283-0849-7';
#4. Dodaje jakas nowa ksiazke
INSERT INTO book (title, author, isbn, category)
VALUES ('roboty', 'maciej robotny', '98985659', 'IT');
#5. Wyswietla wszystkie ksiazi
SELECT * FROM library.book;
#9. Cofnij zmiany 
ROLLBACK;
#10. Wyswietla wszystkie ksiazi (roboty i cena dziadow sie skasowala)
SELECT * FROM library.book;
#11. Powtarzam czynnosci 1-7
DESC book;
#12. Commit robie zamiast rollback
COMMIT;
#13. Wyswietla wszystkie ksiazi (nowe wartosci sa )
SELECT * FROM library.book;