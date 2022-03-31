USE employees;


SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irene' , 'Vidya', 'Maya');
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    first_name IN ('Irene' , 'Vidya', 'Maya');
-- 2. There are 731 records of employees with those names.


SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'Irene'
        OR first_name = 'Vidya'
        OR first_name = 'Maya');
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    (first_name = 'Irene'
        OR first_name = 'Vidya'
        OR first_name = 'Maya');
-- 3. Row count was the same, as expected.


SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'Irene'
        OR first_name = 'Vidya'
        OR first_name = 'Maya')
        AND gender = 'M';
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    (first_name = 'Irene'
        OR first_name = 'Vidya'
        OR first_name = 'Maya')
        AND gender = 'M';
-- 4. 455 records.


SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%';
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE 'E%';
-- 5. 7330 records.


SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%e'
        OR last_name LIKE 'E%';
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE '%e'
        OR last_name LIKE 'E%';
-- 6a. 30723 records start or end with an 'E/e'.


SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE '%e'
        AND last_name LIKE 'E%';
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE '%e';
-- 6b. 24292 records end with 'e' and 899 start and end with E.  Thus, 24292-899 = 23393 ends but does not start with 'E/e'.alter


SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%e'
        AND last_name LIKE 'E%';
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE '%e'
        AND last_name LIKE 'E%';
-- 7. 899 start and end with 'E/e' and 24292 end with 'e'.alter


SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '1999-12-31';
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- 8. 135214 records.


SELECT 
    *
FROM
    employees
WHERE
    birth_date LIKE '____-12-25';
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    birth_date LIKE '____-12-25';
-- 9. 842 employees born on Christmas.


SELECT 
    *
FROM
    employees
WHERE
    birth_date LIKE '____-12-25' and hire_date LIKE '1990-__-__';
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    birth_date LIKE '____-12-25' and hire_date LIKE '1990-__-__';
-- 10. 77 employees born on Christmas and hired in the 90s.


SELECT
    *
FROM
    employees
WHERE
    last_name LIKE '%q%';
SELECT
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE '%q%';
-- 11. 1873 records with a 'q' in the last name.


SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%';
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%';
-- 12. 547 records with 'q' but not 'qu'.

















