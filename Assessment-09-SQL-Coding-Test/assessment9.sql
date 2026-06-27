CREATE DATABASE coding_test_db;
USE coding_test_db;

CREATE TABLE employees(
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    hire_date DATE
);

INSERT INTO employees VALUES
(1,'Mahi',60000,'2026-01-10'),
(2,'Diya',55000,'2025-12-15'),
(3,'Priya',45000,'2025-11-20'),
(4,'Prince',70000,'2026-04-01'),
(5,'Neel',65000,'2026-03-10');

SELECT * FROM employees;

-- Tasks:

-- 1. Write query to find Nth highest salary.(find 2nd highest salary)
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1; 
 
-- 2. Remove duplicate records
CREATE TABLE students(
	student_id INT,
    name VARCHAR(50)
);
INSERT INTO students VALUES
(1,'Mahi'),
(1,'Mahi'),
(2,'Diya'),
(2,'Diya'),
(3,'Priya');

-- view duplicate
SELECT * FROM students;

-- show unique records
SELECT DISTINCT * FROM students;

-- 3. Find records common in two tables
CREATE TABLE table_a(
	id INT
);
CREATE TABLE table_b(
	id INT
);
INSERT INTO table_a VALUES
(1),(2),(3),(4);

INSERT INTO table_b VALUES
(3),(4),(5),(6);

SELECT a.id
FROM table_a a
INNER JOIN table_b b
ON a.id = b.id;

-- 4. Find employees hired in last 6 months
SELECT * FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 5. Find continuous duplicate values
CREATE TABLE logs(
    id INT,
    value_col INT
);
INSERT INTO logs VALUES
(1,1),
(2,1),
(3,2),
(4,3),
(5,3),
(6,3),
(7,4);

SELECT DISTINCT l1.value_col
FROM logs l1
JOIN logs l2
ON l1.id = l2.id - 1
WHERE l1.value_col = l2.value_col;