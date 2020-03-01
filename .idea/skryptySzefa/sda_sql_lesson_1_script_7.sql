#1. Wyczyszczenie tabeli
truncate table book;
#SET SQL_SAFE_UPDATES = 1; #nie używać - hack!
#SET SQL_SAFE_UPDATES = 0; #nie używać - hack!

#2. Modyfikacja danych
ALTER TABLE book ADD CONSTRAINT column1_constraint PRIMARY KEY(title);
DESC book;
INSERT INTO book(title, author) VALUES ('Nowa książka', 'Autor');
select * from book;
UPDATE book SET author='zmieniony autor!' WHERE title = 'Nowa książka';
select * from book;

#NOT NULL
CREATE TABLE PRZYKLADOWA_TABELA (
	KOLUMNA_1 VARCHAR(10) NOT NULL,
	KOLUMNA_2 VARCHAR(10) NOT NULL
);
INSERT INTO PRZYKLADOWA_TABELA(KOLUMNA_1, KOLUMNA_2) 
VALUES ('WARTOSC_1', 'WARTOSC_2'); #OK
INSERT INTO PRZYKLADOWA_TABELA(KOLUMNA_1) 
VALUES ('WARTOSC_1'); # BLAD!
DROP TABLE PRZYKLADOWA_TABELA;

#CHECK
CREATE TABLE PRZYKLADOWA_TABELA (
	KOLUMNA CHAR(1) CHECK (KOLUMNA IN ( 'M', 'K' ))
);
INSERT INTO PRZYKLADOWA_TABELA (KOLUMNA) 
VALUES('M'); # OK
INSERT INTO PRZYKLADOWA_TABELA (KOLUMNA) 
VALUES('Z'); # BLAD!
DROP TABLE PRZYKLADOWA_TABELA;

#UNIQUE
CREATE TABLE przykladowa_tabela (
	unikalna CHAR(10) UNIQUE
);
INSERT INTO przykladowa_tabela (unikalna) 
VALUES('WARTOSC_1'); # OK
INSERT INTO przykladowa_tabela (unikalna) 
VALUES ('WARTOSC_1'); # BLAD!
DROP TABLE PRZYKLADOWA_TABELA;

#DEFAULT
CREATE TABLE przykladowa_tabela (
	kolumna1 VARCHAR(10) NOT NULL,
	kolumna2 VARCHAR(10) DEFAULT 'WARTOSC_2'
);
INSERT INTO przykladowa_tabela(kolumna1) 
VALUES ('WARTOSC_1'); # OK
SELECT * FROM przykladowa_tabela; # kolumna1=WARTOSC_1, kolumna2=WARTOSC_2
DROP TABLE PRZYKLADOWA_TABELA;