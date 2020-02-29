# 1. Tworzenie bazy dabych i uzytkownika
CREATE DATABASE library;
USE library;
CREATE USER 'library_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON library.* TO 'library_user'@'localhost';
FLUSH PRIVILEGES;


REVOKE ALL PRIVILEGES ON libraryfirst_nameauthorauthor.* FROM 'library_user'@'localhost';

# 2.Nowe polaczenie jako uzytkownik library
# 3. kasowanie uprawnien dskup

REVOKE ALL PRIVILEGES ON test.* FROM 'dskup'@'localhost';
DROP USER 'dskup'@'localhost';

CREATE TABLE author (
			first_name VARCHAR(128),
            lastname VARCHAR(128)
);

CREATE TABLE IF NOT EXISTS author (
			first_name VARCHAR(128),
            lastname VARCHAR(128)
);

CREATE TABLE IF NOT EXISTS book (
			title VARCHAR(128),
            author VARCHAR(128),
            published INT,
            isbn INT,
            category VARCHAR(128),
            page_count INT,
            publisher VARCHAR(128),
            price FLOAT
);
