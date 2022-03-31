USE employees;


SELECT DISTINCT
    last_name
FROM
    employees
ORDER BY last_name DESC
LIMIT 10;
-- 2. 'Zykh', 'Zyda', 'Zwicker', 'Zweizig', 'Zumaque', 'Zultner', 'Zucker', 'Zuberek', 'Zschoche', 'Zongker'.


SELECT 
    first_name, last_name, birth_date, hire_date
FROM
    employees
WHERE
    birth_date LIKE '____-12-25'
        AND hire_date LIKE '199_-__-__'
ORDER BY hire_date
LIMIT 5;
-- 3. Alselm Cappello, Utz Mandel, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup.


SELECT 
    first_name, last_name, birth_date, hire_date
FROM
    employees
WHERE
    birth_date LIKE '____-12-25'
        AND hire_date LIKE '199_-__-__'
ORDER BY hire_date
LIMIT 5 OFFSET 45;
-- 4. Pranay Narwekar, Marjo Farrow, Ennio Karcich, Dines Lubachevsky, Ipke Fontan.
-- [Starting] Page number = (LIMIT + OFFSET) // LIMIT