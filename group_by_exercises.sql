#1
USE employees;
SELECT database();

#2
SELECT DISTINCT
    title
FROM
    titles;
-- 7 distinct titles

#3
SELECT 
    last_name
FROM
    employees
WHERE
    last_name LIKE 'E%e'
GROUP BY last_name;
-- 5 distinct last names (Erde, Eldridge, Etalle, Erie, Erbe)

#4
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    last_name LIKE 'E%e'
GROUP BY first_name , last_name;
-- 846 Unique COmbinations

#5
SELECT 
    last_name
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
-- Chleq, Lindqvist, Qiwen

#6
SELECT 
    last_name, COUNT(*)
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
-- Chleq = 189, Lindqvist = 190, Qiwen = 168

#7
SELECT 
    first_name, gender, COUNT(*)
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
GROUP BY first_name , gender;

#8 
SELECT 
    CONCAT(SUBSTR(LOWER(first_name), 1, 1),
            SUBSTR(LOWER(last_name), 1, 4),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)) AS username,
    COUNT(*)
FROM
    employees
GROUP BY username
HAVING COUNT(username) > 1
ORDER BY COUNT(username);

#9a
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no;

#9b
SELECT 
    dept_no, COUNT(*)
FROM
    dept_emp
GROUP BY dept_no;

#9c
SELECT 
    emp_no, COUNT(salary)
FROM
    salaries
GROUP BY emp_no;

#9d
SELECT 
    emp_no, MAX(salary)
FROM
    salaries
GROUP BY emp_no;

#9e
SELECT 
    emp_no, MIN(salary)
FROM
    salaries
GROUP BY emp_no;

#9f
SELECT 
    emp_no, MAX(salary)
FROM
    salaries
GROUP BY emp_no
HAVING MAX(salary) > 150000;

#9g
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) BETWEEN 80000 AND 90000;
