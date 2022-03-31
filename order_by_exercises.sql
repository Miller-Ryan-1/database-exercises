USE employees;


SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY
	first_name;
-- 2. First row: Irena Reutenauer; Last row: Vidya Simmen.


SELECT 
    *
FROM
    employees
WHERE
	first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY
	first_name, last_name;
-- 3. First row: Irena Acton; Last row: Vidya Zweizig.


SELECT 
    *
FROM
    employees
WHERE
	first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY
	last_name, first_name;
-- 4. First row: Irena Acton; Last row: Maya Zyda.


SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE '%e'
        AND last_name LIKE 'E%'
ORDER BY emp_no;
SELECT 
    emp_no, first_name, last_name
FROM
    employees
WHERE
    last_name LIKE '%e'
        AND last_name LIKE 'E%'
ORDER BY emp_no;
-- 5.  899 start and end with E.  First row: 10021 Ramzi Erde; Last row: 499648 Tadahiro Erde.


SELECT 
    hire_date, first_name, last_name
FROM
    employees
WHERE
    last_name LIKE '%e'
        AND last_name LIKE 'E%'
ORDER BY hire_date DESC;
-- 6. 899; First row: Teiji Eldridge; Last row: Sergi Erde.


SELECT 
    first_name, last_name, birth_date, hire_date
FROM
    employees
WHERE
    birth_date LIKE '____-12-25' and hire_date LIKE '1990-__-__'
ORDER BY birth_date, hire_date DESC;
-- 7.  Oldest + last hired: Anwar Collavizza; Youngest+ first hired: Douadi Pettis.