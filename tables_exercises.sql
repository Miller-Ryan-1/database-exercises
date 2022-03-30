USE employees;
-- Selects the employees database to use
SHOW tables;
-- Lists all tables in the employees database
DESCRIBE employees;
-- Describes employees table (of the employees database).  Includes INT, VARCHAR, DATE, and ENUM data types. 

/* 
Used the table inspector on all of the tables to answer the following questions:

Q6: Which table(s) do you think contain a numeric type column?
A6: dept_emp, dept_manager, employees, salaries, titles

Q7:  Which table(s) do you think contain a string type column?
A7: departments, dept_emp, dept_manager, employees, titles

Q8:  Which table(s) do you think contain a date type column?
A8: dept_emp, dept_manager, employees, salaries, titles
*/

DESCRIBE dept_emp;
/*
Q9:  What is the relationship between the [employees] and [departments] tables?
A9:  There is no direct relationship, however they are linked through their primary keys in the dept_emp table.  
*/

SHOW CREATE TABLE dept_manager;

/*
'CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1'
*/

