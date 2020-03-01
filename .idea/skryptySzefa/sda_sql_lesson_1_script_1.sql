# 1. Tworzenie bazy danych i użytkownika 
CREATE DATABASE library;
USE library;
CREATE USER 'library_user'@'localhost' IDENTIFIED BY 'password';

# 2. Nadawanie uprawnień
GRANT ALL PRIVILEGES ON library.* TO 'library_user'@'localhost';
FLUSH PRIVILEGES;

#REVOKE ALL PRIVILEGES ON library.* FROM 'library_user'@'localhost';

# -> Nowe połączenie jako użytkownik library
