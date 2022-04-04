#I - Join Example Database:

#1
USE join_example_db;
SELECT * FROM users, roles;

#2a (inner JOIN)
SELECT users.name AS user_name, roles.name AS role_name FROM users JOIN roles ON users.role_id = roles.id;
-- Output does not include two individuals with NULL role_id

#2b (LEFT JOIN)
SELECT users.name AS user_name, roles.name AS role_name FROM users LEFT JOIN roles ON users.role_id = roles.id;
-- Output includes two individuals with NULL role_id

#2c (RIGHT JOIN)
SELECT users.name AS user_name, roles.name AS role_name FROM users RIGHT JOIN roles ON users.role_id = roles.id;
-- Output includes all role_name, even if attached to no username (NULL).

#3
SELECT roles.name AS roles_name, COUNT(users.name) FROM roles LEFT JOIN users ON users.role_id = roles.id GROUP BY roles_name;
-- Output does not include two individuals with NULL role_id

#~~~~~~~~~~~~~~~~~~~~~~~~~~~
#II - Employees Database 

#1
USE employees;

#2
SELECT 
    departments.dept_name AS 'Department Name',
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS 'Department Manager'
FROM
    employees
        JOIN
    dept_manager ON dept_manager.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_manager.dept_no
WHERE
    to_date > NOW()
ORDER BY dept_name;

#3
SELECT 
    departments.dept_name AS 'Department Name',
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS 'Department Manager'
FROM
    employees
        JOIN
    dept_manager ON dept_manager.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_manager.dept_no
WHERE
    to_date > NOW()
AND
	gender = 'F'
ORDER BY dept_name; 

#4
SELECT 
    titles.title AS 'Title', COUNT(Title) AS 'Count'
FROM
    departments
        JOIN
    dept_emp ON departments.dept_no = dept_emp.dept_no
        JOIN
    titles ON titles.emp_no = dept_emp.emp_no
WHERE
    dept_name = 'Customer Service'
        AND titles.to_date > NOW()
        AND dept_emp.to_date > NOW()
GROUP BY Title
ORDER BY Title;

#5
SELECT 
    departments.dept_name AS 'Department Name',
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS 'Name',
    salaries.salary AS 'Salary'
FROM
    employees
        JOIN
    dept_manager ON dept_manager.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_manager.dept_no
        JOIN
    salaries ON dept_manager.emp_no = salaries.emp_no
WHERE
    dept_manager.to_date > NOW()
        AND salaries.to_date > NOW()
ORDER BY dept_name;

#6
SELECT 
    departments.dept_no,
    departments.dept_name,
    COUNT(emp_no) AS num_employees
FROM
    departments
        JOIN
    dept_emp ON departments.dept_no = dept_emp.dept_no
WHERE
    dept_emp.to_date > NOW()
GROUP BY departments.dept_no;

#7
SELECT 
    departments.dept_name,
    AVG(salaries.salary) AS average_salary
FROM
    departments
        JOIN
    dept_emp ON dept_emp.dept_no = departments.dept_no
        JOIN
    employees ON employees.emp_no = dept_emp.emp_no
        JOIN
    salaries ON salaries.emp_no = dept_emp.emp_no
WHERE
    salaries.to_date > NOW()
GROUP BY departments.dept_name
ORDER BY average_salary DESC
LIMIT 1;

#8
SELECT 
    employees.first_name, employees.last_name
FROM
    employees
        JOIN
    dept_emp ON dept_emp.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_emp.dept_no
        JOIN
    salaries ON dept_emp.emp_no = salaries.emp_no
WHERE
    dept_name = 'Marketing'
ORDER BY salary DESC
LIMIT 1;

#9
SELECT 
    employees.first_name,
    employees.last_name,
    salaries.salary,
    departments.dept_name
FROM
    employees
        JOIN
    dept_manager ON dept_manager.emp_no = employees.emp_no
        JOIN
    departments ON departments.dept_no = dept_manager.dept_no
        JOIN
    salaries ON dept_manager.emp_no = salaries.emp_no
WHERE
    dept_manager.to_date > NOW()
        AND salaries.to_date > NOW()
ORDER BY salary DESC
LIMIT 1;

#10
SELECT 
    departments.dept_name, ROUND(AVG(salaries.salary)) AS average_salary
FROM
    employees
        JOIN
    dept_emp USING(emp_no) -- ON dept_emp.emp_no = employees.emp_no
        JOIN
    salaries USING(emp_no) -- ON salaries.emp_no = dept_emp.emp_no
        JOIN
    departments USING(dept_no) -- ON departments.dept_no = dept_emp.dept_no
GROUP BY departments.dept_name ORDER BY average_salary DESC;

#11 (BONUS)
SELECT 
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS 'Employee Name',
    departments.dept_name AS 'Department Name',
    a.manager_name AS 'Manager Name'
FROM
    employees
        JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
        JOIN
    departments ON dept_emp.dept_no = departments.dept_no
        JOIN
    (SELECT 
        CONCAT(employees.first_name, ' ', employees.last_name) AS manager_name,
            dept_no
    FROM
        employees
    JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
    WHERE
        to_date > NOW()) AS a ON a.dept_no = departments.dept_no
WHERE
    dept_emp.to_date > NOW();

#12 (BONUS)
SELECT 
    dept_name AS 'Department',
    CONCAT(employees.first_name,
            ' ',
            employees.last_name) AS 'Highest Paid Employee'
FROM
    departments
        JOIN
    (SELECT 
        dept_no, MAX(salary) AS max_salary
    FROM
        dept_emp
    JOIN salaries USING (emp_no)
    WHERE
        dept_emp.to_date > NOW()
    GROUP BY dept_no) AS a USING (dept_no)
        JOIN
    salaries ON a.max_salary = salaries.salary
        JOIN
    employees USING (emp_no);



