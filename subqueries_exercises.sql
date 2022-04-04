USE employees;

#1 Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT 
    CONCAT(first_name, ' ', last_name)
FROM
    employees
WHERE
    hire_date = (SELECT 
            hire_date
        FROM
            employees
        WHERE
            emp_no = 101010);
            
#2 Find all the titles ever held by all current employees with the first name Aamod.
SELECT 
    title
FROM
    titles
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            first_name = 'Aamod') AND titles.to_date > NOW();

#3 How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT 
    COUNT(a.emp_no)
FROM
    (SELECT 
        emp_no, MAX(to_date) AS max_date
    FROM
        dept_emp
    GROUP BY emp_no) AS a
WHERE
    a.max_date < NOW();
-- 59,900 former employees.

#4 Find all the current department managers that are female. List their names in a comment in your code.
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    employees
WHERE
    emp_no IN (SELECT 
            employees.emp_no
        FROM
            dept_manager
                JOIN
            employees ON employees.emp_no = dept_manager.emp_no
        WHERE
            dept_manager.to_date > NOW()
                AND employees.gender = 'F');
-- Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil

#5 Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT 
    emp_no
FROM
    salaries
WHERE
    salary > (SELECT 
            AVG(salaries.salary)
        FROM
            salaries)
        AND salaries.to_date > NOW();

#6 How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary > ((SELECT 
            MAX(salary) AS max_salary
        FROM
            salaries
        WHERE
            salaries.to_date > NOW()) - (SELECT 
            STDDEV(salary) AS salary_std_dev
        FROM
            salaries))
        AND salaries.to_date > NOW();
-- 78 salaries within 1 STDEV; 
SELECT COUNT(*) FROM salaries;
SELECT CAST(78/2844047 AS DECIMAL(10,10))*100;
-- .0027% of all salaries fall within 1 stddev of curent max salary.

#BONUS 1
-- Same as #4 above

#BONUS 2
SELECT 
    employees.first_name, employees.last_name
FROM
    employees
        JOIN
    (SELECT 
        emp_no, MAX(salary)
    FROM
        salaries
    WHERE
        to_date > NOW()
    GROUP BY emp_no
    ORDER BY MAX(salary) DESC
    LIMIT 1) AS a ON a.emp_no = employees.emp_no;
-- Tokuyasu Pesch
    
#BONUS 3
SELECT 
    departments.dept_name
FROM
    departments
        JOIN
    dept_emp ON departments.dept_no = dept_emp.dept_no
        JOIN
    (SELECT 
        emp_no, MAX(salary)
    FROM
        salaries
    WHERE
        to_date > NOW()
    GROUP BY emp_no
    ORDER BY MAX(salary) DESC
    LIMIT 1) AS a ON a.emp_no = dept_emp.emp_no;
-- Sales.

