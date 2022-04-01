# 1:
USE employees;

# 2:
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    employees
WHERE
    last_name LIKE 'E%e';

# 3:
SELECT 
    CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS full_name
FROM
    employees
WHERE
    last_name LIKE 'E%e';

# 4:
SELECT 
    first_name,
    last_name,
    DATEDIFF(NOW(), hire_date) AS days_at_company
FROM
    employees
WHERE
    birth_date LIKE '____-12-25'
        AND hire_date LIKE '199_-__-__';

# 5:
SELECT 
    MAX(salary), MIN(salary)
FROM
    salaries;

# 6.
SELECT 
    CONCAT(SUBSTR(LOWER(first_name), 1, 1),
            SUBSTR(LOWER(last_name), 1, 4),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)) AS username,
    first_name,
    last_name,
    birth_date
FROM
    employees;