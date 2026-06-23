import mysql.connector

# Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="MILI@75",
    database="company_db"
)

cursor = conn.cursor()

print("\nTASK 1: Employees Earning More Than Average Salary")

cursor.execute("""
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
""")

for row in cursor.fetchall():
    print(row)

print("\nTASK 2: Department With Highest Total Salary")

cursor.execute("""
SELECT dept_name, total_salary
FROM (
    SELECT
        d.dept_name,
        SUM(e.salary) AS total_salary
    FROM employees e
    INNER JOIN departments d
        ON e.dept_id = d.dept_id
    GROUP BY d.dept_name
) AS dept_salary
WHERE total_salary = (
    SELECT MAX(total_salary)
    FROM (
        SELECT SUM(salary) AS total_salary
        FROM employees
        WHERE dept_id IS NOT NULL
        GROUP BY dept_id
    ) AS salary_table
)
""")

for row in cursor.fetchall():
    print("Department:", row[0], "| Total Salary:", row[1])

print("\nTASK 3: Employees Working In Same Department As Amit")

cursor.execute("""
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
)
""")

for row in cursor.fetchall():
    print(row)

print("\n TASK 4: Employees Working In Same Department As Amit")

cursor.execute("""
SELECT *
FROM employees
WHERE dept_id = (
    SELECT dept_id
    FROM employees
    WHERE emp_name = 'Amit'
)
""")

for row in cursor.fetchall():
    print(row)
