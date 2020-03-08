#1. Wyświetl wszystkie informacje o pracownikach.
select * from employees;

#2. Policz ile jest wszystkich pracowników.
select count(*) from employees;

#3. Wyświetl imiona pracowników które kończą się na „h”.
select first_name from employees where first_name like '%h';

#4. Wyświetl 10 pierwszych pracowników w bazie danych.
 select * from employees limit 0, 10;
 
#5. Wyświetl nazwy stanowisk bez powtórzeń posortowane alfabetycznie.
select distinct title from titles order by title;
select title from titles group by title order by title;

#6. Sprawdź czy istnieją dwaj pracownicy o tym samym imieniu i nazwisku.
select first_name, last_name, count(*)
from employees
group by first_name, last_name
having count(*) > 1;

#7. Ilu jest łącznie pracowników których imię i nazwisko powtarza się.
select sum(tmp.count) from (select first_name, last_name, count(*) as count
from employees
group by first_name, last_name
having count(*) > 1) as tmp;

#8. Wyświetl pracowników o nazwisku Herbst i imieniu Otmar.
select * from employees where last_name='Herbst' and first_name='Otmar';

#9. Policz ile jest kobiet.
select count(*) from employees where gender = 'F';

#10. Policz ile jest mężczyzn.
select count(*) from employees where gender = 'M';

#11. Jednym zapytaniem wyświetl liczbę pracowników płci męskiej oraz żeńskiej, uporządkuj liczby
#w kolejności malejącej.
SELECT gender, COUNT(*) AS total_count
FROM employees 
GROUP BY gender
ORDER BY total_count DESC;

#12. Wyświetl definicję tabeli z pracownikami.
desc employees;

#13. Wyświetl pracowników którzy nie mają ustawionej daty urodzenia.
select * from employees where birth_date is null;

#14. Wyświetl wszystkie działy w firmie alfabetycznie względem nazw.
select * from departments order by dept_name;

#15. Wyświetl identyfikator pracownika, jego imię, nazwisko oraz dział w jakim obecnie pracuje.
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees e
join departments d
join dept_emp dn on dn.emp_no = e.emp_no and d.dept_no = dn.dept_no
where dn.from_date < curdate() and dn.to_date > curdate()
order by e.emp_no, e.first_name, e.last_name;

#16. Wyświetl informację o aktualnych managerach w firmie - wyświetl imię, nazwisko, oraz nazwę
#działu za który są odpowiedzialni. Wyniki posortuj rosnąco po nazwie działu.
SELECT first_name, last_name, dept_name 
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
JOIN departments d ON d.dept_no = dm.dept_no
where from_date < curdate() and to_date > curdate()              
order by dept_name;

#17. Wyświetl identyfikator pracownika, jego imię, nazwisko oraz jego obecne wynagrodzenie,
#posortuj wyniki od najwyższej do najniższej pensji.
select e.emp_no, e.first_name, e.last_name, s.salary
from employees e
join salaries s on s.emp_no = e.emp_no
where s.from_date < curdate() and s.to_date > curdate()
order by s.salary desc;

#18. Wyświetl obecnie obowiązującą różnice miedzy najlepiej, a najgorzej zarabiającym
#pracownikiem.
select  max(salary) - min(salary) from salaries 
				where from_date < curdate() and to_date > curdate();
                
#19. Wyświetl pracownika który ma najwyższą pensje oraz wartość jego pensji.
select e.*, s.salary
from employees e
join salaries s on s.emp_no = e.emp_no
where s.from_date < curdate() and s.to_date > curdate() 
and s.salary = (select max(salary) from salaries 
				where from_date < curdate() and to_date > curdate());
                
#20. Wyświetl pracownika który ma drugą z kolei najwyższą pensje oraz jego wartość jego pensji.
select e.*, s.salary
from employees e
join salaries s on s.emp_no = e.emp_no
where s.from_date < curdate() and s.to_date > curdate() 
and s.salary < (select max(salary) from salaries 
				where from_date < curdate() and to_date > curdate())
order by s.salary DESC  
limit 1;

#21. Znajdź aktualnie obowiązującą średnią pensję według stanowiska pracownika. Wynik
#zaokrąglij do dwóch miejsc po przecinku i uporządkuj według malejącej kolejności.
SELECT title, AVG(salary) as avg_salary
FROM titles t JOIN salaries s ON s.emp_no = t.emp_no
where s.from_date < curdate() and s.to_date > curdate()
GROUP BY title
ORDER BY avg_salary DESC;

#22. Policz ilu pracowników pracuje w każdym dziale, wyniki posortuj od największej liczby
#pracowników do najmniejszej.
select count(*), d.dept_name
from employees e
join departments d 
join dept_emp dn on dn.emp_no = e.emp_no and d.dept_no = dn.dept_no
where dn.from_date < curdate() and dn.to_date > curdate()
group by d.dept_name
order by count(*) desc;

#23. Znajdź wszystkich pracowników, którzy pracowali w co najmniej 2 działach. Wyświetl ich imię,
#nazwisko i liczbę działów, w których pracują/pracowali. Wynik wyświetl w porządku rosnącym.
SELECT e.first_name, e.last_name AS name, COUNT(*) AS number_of_departments
FROM employees e JOIN dept_emp d ON e.emp_no = d.emp_no
GROUP BY d.emp_no 
HAVING COUNT(*) > 1
ORDER BY name ASC;

#24. * Wyświetl poszczególne lata i łączną liczbę zatrudnionych w danym roku osób.
SELECT DATE_FORMAT(hire_date, '%Y') AS year, COUNT(*) AS total_hires
FROM employees
GROUP BY year;

#25. * Wyświetl rok i łączną liczbę zatrudnionych osób w roku gdzie zatrudniono największą liczbę
#pracowników.
SELECT DATE_FORMAT(hire_date, '%Y') AS year, COUNT(*) AS total_hires
FROM employees
GROUP BY year
ORDER BY total_hires DESC
LIMIT 1;

#26. * Znajdź imiona pracowników, których imiona nie zawierają samogłosek, i wyświetl dział, w
#którym pracują.
SELECT e.first_name, dep.dept_name
FROM employees e 
JOIN departments dep
JOIN dept_emp de ON e.emp_no = de.emp_no AND de.dept_no = dep.dept_no
WHERE de.from_date < curdate() and de.to_date > curdate()
  AND e.first_name NOT LIKE '%a%' 
  AND e.first_name NOT LIKE '%e%'  
  AND e.first_name NOT LIKE '%i%' 
  AND e.first_name NOT LIKE '%o%'
  AND e.first_name NOT LIKE '%u%';
  
#27. * Wyświetl każdy dział i wiek najmłodszego pracownika w dniu zatrudnienia. Wyniki posortuj
#rosnąco według wieku pracownika.
SELECT dept.dept_name,
       MIN(timestampdiff(YEAR, e.birth_date, e.hire_date)) AS age_in_hire_date
FROM employees e 
JOIN departments dept
JOIN dept_emp d_emp ON e.emp_no = d_emp.emp_no AND d_emp.dept_no = dept.dept_no
GROUP BY dept.dept_name
ORDER BY age_in_hire_date;