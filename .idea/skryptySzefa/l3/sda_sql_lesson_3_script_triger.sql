#2. Trigger
CREATE DEFINER = CURRENT_USER TRIGGER `library`.`book_BEFORE_INSERT` 
BEFORE INSERT ON `book` FOR EACH ROW
BEGIN
SET NEW.category = concat('Kategoria ', ' ', NEW.category);
END

select * from book;
INSERT INTO book (title, author, isbn, category) 
VALUES ('nowy tytuł', 'nowy autor', 'triger 9898', 'słowniki');

