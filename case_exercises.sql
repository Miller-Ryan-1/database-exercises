USE employees;

#1. Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
SELECT 
    emp_no,
    dept_no,
    from_date,
    max_date,
    IF(max_date > NOW(), TRUE, FALSE) AS is_current_employee
FROM
    (SELECT 
        emp_no, MAX(to_date) AS max_date
    FROM
        employees
    JOIN dept_emp USING (emp_no)
    GROUP BY emp_no) AS max_dater
        JOIN
    dept_emp USING (emp_no);
    
#2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT 
    CONCAT(first_name, ' ', last_name),
    CASE
        WHEN SUBSTRING(last_name, 1, 1) IN ('A' , 'B', 'C', 'D', 'E', 'F', 'G', 'H') THEN 'A-H'
        WHEN SUBSTRING(last_name, 1, 1) IN ('I' , 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q') THEN 'I-Q'
        ELSE 'R-Z'
    END AS alpha_group
FROM
    employees;

#3. How many employees (current or previous) were born in each decade?
SELECT 
    COUNT(CASE
        WHEN birth_date LIKE '195%' THEN birth_date
        ELSE NULL
    END) AS '1950s',
    COUNT(CASE
        WHEN birth_date LIKE '196%' THEN birth_date
        ELSE NULL
    END) AS '1960s',
    COUNT(CASE
        WHEN birth_date LIKE '197%' THEN birth_date
        ELSE NULL
    END) AS '1970s',
    COUNT(CASE
        WHEN birth_date LIKE '198%' THEN birth_date
        ELSE NULL
    END) AS '1980s'
FROM
    employees;
-- 182,886 born in the 50s, 117,138 born in the 60s

#4. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
SELECT 
    DISTINCT CASE
        WHEN dept_name IN ('Research' , 'Development') THEN 'R&D'
        WHEN dept_name IN ('Sales' , 'Marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('Production' , 'Quality Management') THEN 'Prod & QM'
        WHEN dept_name IN ('Finance' , 'Human Resources') THEN 'Finance & HR'
        ELSE dept_name
    END AS Department_Group,
    AVG(salary) AS 'Group Average Salary'
FROM
    departments
        JOIN
    dept_emp USING (dept_no)
        JOIN
    salaries USING (emp_no)
WHERE
    salaries.to_date > NOW()
GROUP BY Department_Group;

