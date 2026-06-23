import mysql.connector

# Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="MILI@75",
    database="company_db"
)

cursor = conn.cursor()

print("\n TASK 1: Employee Name with Department Name")

cursor.execute("""
SELECT
e.emp_name,
d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
""")

for row in cursor.fetchall():
    print("Employee:", row[0], "| Department:", row[1])

print("\nTASK 2: Employees Earning More Than 50000")

cursor.execute("""
SELECT *
FROM employees
WHERE salary > 50000
""")

for row in cursor.fetchall():
    print(row)

print("\nTASK 3: Department-wise Total Salary")

cursor.execute("""
SELECT
d.dept_name,
SUM(e.salary) AS total_salary
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
""")

for row in cursor.fetchall():
    print("Department:", row[0], "| Total Salary:", row[1])

print("\nTASK 4: Departments with More Than 2 Employees")

cursor.execute("""
SELECT
d.dept_name,
COUNT(e.emp_id) AS total_employees
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id) > 2
""")

for row in cursor.fetchall():
    print("Department:", row[0], "| Employees:", row[1])

print("\nTASK 5: Employees Without Department")

cursor.execute("""
SELECT *
FROM employees
WHERE dept_id IS NULL
""")

for row in cursor.fetchall():
    print(row)

conn.close()