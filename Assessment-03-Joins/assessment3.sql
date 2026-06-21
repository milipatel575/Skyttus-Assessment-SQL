-- Create Database
CREATE DATABASE company_db;

-- Select Database
USE company_db;

-- Create Table
CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT
);
CREATE TABLE departments(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert Data 
INSERT INTO employees VALUES
(1,'Mili',102,60000),
(2,'Rahul',102,55000),
(3,'Priya',101,45000),
(4,'Amit',103,70000),
(5,'Neha',102,65000),
(6,'Jay',NULL,50000);

INSERT INTO departments VALUES
(101,'HR'),
(102,'IT'),
(103,'Finance'),
(104,'Marketing');

SELECT * FROM employees;
SELECT * FROM departments;

-- Tasks:

-- 1. Display employee name with department name.
SELECT 
e.emp_name,
d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- 2. Display employees earning more than 50,000.
SELECT * FROM employees
WHERE salary > 50000;

-- 3. Display department-wise total salary.
SELECT 
d.dept_name,
SUM(e.salary) AS total_salary
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 4. Display departments with more than 2 employees.
SELECT 
d.dept_name,
COUNT(e.emp_id) AS total_employees
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id) > 2;

-- 5. Display employees without a department.
SELECT *
FROM employees
WHERE dept_id IS NULL;
