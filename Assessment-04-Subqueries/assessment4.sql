USE company_db;

-- Tasks:

-- 1.Find Employees Earning More Than Average Salary.
SELECT * 
FROM employees
WHERE salary > 
(
     SELECT AVG(salary) 
     FROM employees
);

-- 2.Find Department with Highest Total Salary.
SELECT d.dept_name,
SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING SUM(e.salary) = 
(
   SELECT MAX(total_salary)
   FROM
   (
     SELECT SUM(salary) AS total_salary
     FROM employees
     GROUP BY dept_id
   )AS dept_totals
);

-- 3.Display Employee with Second Highest Salary.
SELECT * 
FROM employees
WHERE salary =
(
  SELECT MAX(salary)
  FROM employees
  WHERE salary <
  (
    SELECT MAX(salary)
    FROM employees
  )
);

-- 4.Display Employees Working in Same Department as "Amit".
SELECT * 
FROM employees
WHERE dept_id = 
(
  SELECT dept_id
  FROM employees
  WHERE emp_name = 'Amit'
);
