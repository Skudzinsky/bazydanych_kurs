# 1. Tworzenie tabel
CREATE TABLE author (
	first_name VARCHAR(128),
	last_name VARCHAR(128)
);

# 2. Pokazanie klauzuli IF NOT EXISTS
CREATE TABLE author (
	first_name VARCHAR(128),
	last_name VARCHAR(128)
);#BŁĄD!
CREATE TABLE IF NOT EXISTS author (
	first_name VARCHAR(128),
	last_name VARCHAR(128)
);#OK!

