#1. Modyfikacja tabel
CREATE TABLE test (
	column1 INT
);
DESC test;
ALTER TABLE test ADD COLUMN new_column TINYINT;
DESC test;
ALTER TABLE test CHANGE COLUMN new_column column2 INT;
DESC test;
ALTER TABLE test MODIFY COLUMN column1 INT NOT NULL;
DESC test;
ALTER TABLE test 
	CHANGE COLUMN column1 chenged_column1 INT,
	CHANGE COLUMN column2 chenged_column2 INT;
DESC test;
ALTER TABLE test ADD CONSTRAINT column1_constraint PRIMARY KEY(chenged_column1);
DESC test;
ALTER TABLE test DROP PRIMARY KEY;
DESC test;

#2. Usuwanie kolumny i tabeli
ALTER TABLE test DROP COLUMN chenged_column2;
DESC test;
DROP TABLE test;
