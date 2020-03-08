 #1. Wyświetl wszystkie informacje o pracownikach
 SELECT * FROM employees;
 #2. Policz ile jest wszystkich pracowników.
SELECT count(*) as count, emp_no
FROM employees;
#3. Wyświetl imiona pracowników które kończą się na „h”.
SELECT * FROM employees WHERE first_name LIKE '%h';
#4. Wyświetl 10 pierwszych pracowników w bazie danych
SELECT * FROM employees LIMIT 0, 10;
#5. Wyświetl nazwy stanowisk bez powtórzeń posortowane alfabetycznie.
SELECT  DISTINCT title FROM titles ORDER BY title ASC ;
#6. Sprawdź czy istnieją dwaj pracownicy o tym samym imieniu i nazwisku.
SELECT count(*) as count, first_name, last_name
FROM employees
GROUP BY first_name, last_name
HAVING count > 1;

#7. Ilu jest łącznie pracowników których imię i nazwisko powtarza się.
SELECT SUM(wybor.count) AS count FROM  (SELECT count(*) as count, first_name, last_name
FROM employees
GROUP BY first_name, last_name
HAVING count > 1) AS wybor;
#8. Wyświetl pracowników o nazwisku Herbst i imieniu Otmar.
SELECT * FROM employees WHERE first_name = 'Otmar' AND last_name = 'Herbst';

#9. Policz ile jest kobiet
SELECT count(*) as count FROM employees WHERE gender = 'F';

#10. Policz ile jest mężczyzn
SELECT count(*) as count FROM employees WHERE gender = 'M';

#11. Jednym zapytaniem wyświetl liczbę pracowników płci męskiej oraz żeńskiej, uporządkuj liczby w kolejności malejącej
# Ile chlopow i ile bab w 1 linijce
SELECT count(*) AS liczba, gender
FROM employees 
GROUP BY gender;

#12. Wyświetl definicję tabeli z pracownikami.
DESC employees;

#13. Wyświetl pracowników którzy nie mają ustawionej daty urodzenia.
SELECT * FROM employees WHERE birth_date IS NULL;

#14.  Wyświetl wszystkie działy w firmie alfabetycznie względem nazw.
SELECT * FROM departments GROUP BY dept_name ORDER BY dept_name ASC ;

#15. Wyświetl identyfikator pracownika, jego imię, nazwisko oraz dział w jakim obecnie pracuje.
SELECT employees.emp_no, first_name, last_name, departments.dept_name
FROM employees 
JOIN departments 
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no 
AND dept_emp.dept_no = departments.dept_no
WHERE dept_emp.from_date < curdate() AND dept_emp.to_date > curdate()
ORDER BY emp_no;

#16. Wyświetl informację o aktualnych managerach w firmie - wyświetl imię, nazwisko, oraz nazwę
# działu za który są odpowiedzialni. Wyniki posortuj rosnąco po nazwie działu.
SELECT employees.first_name, last_name, departments.dept_name
FROM employees
JOIN departments
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
AND dept_manager.dept_no = departments.dept_no
WHERE dept_manager.from_date < curdate() AND dept_manager.to_date > curdate()
ORDER BY departments.dept_name ASC;

#17. Wyświetl identyfikator pracownika, jego imię, nazwisko oraz jego obecne wynagrodzenie,
# posortuj wyniki od najwyższej do najniższej pensji.
SELECT employees.emp_no, first_name, last_name, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no
WHERE salaries.from_date < curdate() AND salaries.to_date > curdate()
ORDER BY salaries.salary DESC;

#18. Wyświetl obecnie obowiązującą różnice miedzy najlepiej, a najgorzej zarabiającym
# pracownikiem.
SELECT MAX(salary), MIN(salary),
MAX(salary) -MIN(salary) as różnica_zarobków
FROM SALARIES
WHERE salaries.from_date < curdate() AND salaries.to_date > curdate() ; 

#19. Wyświetl pracownika który ma najwyższą pensje oraz wartość jego pensji.
SELECT employees.emp_no, first_name, last_name, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no
WHERE salaries.from_date < curdate() AND salaries.to_date > curdate()
ORDER BY salaries.salary DESC
LIMIT 0, 1;

#20. Wyświetl pracownika który ma drugą z kolei najwyższą pensje oraz jego wartość jego pensji.
SELECT employees.emp_no, first_name, last_name, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no
WHERE salaries.from_date < curdate() AND salaries.to_date > curdate()
ORDER BY salaries.salary DESC
LIMIT 1, 1;

#21. Znajdź aktualnie obowiązującą średnią pensję według stanowiska pracownika. Wynik
# zaokrąglij do dwóch miejsc po przecinku i uporządkuj według malejącej kolejności

