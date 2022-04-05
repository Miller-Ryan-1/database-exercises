#1 Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. 
USE employees;

CREATE TEMPORARY TABLE jemison_1765.employees_with_departments AS
SELECT first_name, last_name, dept_name FROM
employees JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no);

USE jemison_1765;

DESCRIBE employees_with_departments;

#1a Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.
ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

#1b Update the table so that full name column contains the correct data.
UPDATE employees_with_departments 
SET 
    full_name = CONCAT(first_name, ' ', last_name);
-- Disabled Safe Mode and reconnected

#1c Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP COLUMN first_name, DROP COLUMN last_name;
DESCRIBE employees_with_departments;

#2 Create a temporary table based on the payment table from the sakila database.  Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
USE sakila;

CREATE TEMPORARY TABLE jemison_1765.payment AS
SELECT amount FROM payment;

USE jemison_1765;

ALTER TABLE payment MODIFY amount DECIMAL(6,2) NOT NULL;

UPDATE payment 
SET 
    amount = amount * 100;

ALTER TABLE payment MODIFY amount INTEGER;

#3 Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?
USE employees;

SELECT AVG(salary) FROM salaries;
-- Historic average pay = $63,810.74

SELECT STDDEV(salary) FROM salaries;
-- Standard deviation for salaries = $16,904.83

CREATE TEMPORARY TABLE jemison_1765.departments_with_salaries AS
SELECT salaries.salary, departments.dept_name  FROM
employees JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
JOIN salaries USING (emp_no) WHERE salaries.to_date > NOW();

USE jemison_1765;

SELECT dept_name, AVG((salary-63810.74)/16904.83) as zscore FROM departments_with_salaries GROUP BY dept_name;
-- For salary purposes, best to work for Sales, HR is the worst!











