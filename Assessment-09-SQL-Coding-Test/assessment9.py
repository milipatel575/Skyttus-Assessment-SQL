import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="MILI@75",
    database="coding_test_db"
)

cursor = conn.cursor()

tasks = [

("TASK 1 - SECOND HIGHEST SALARY",
"""
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1
"""
),

("TASK 2 - UNIQUE STUDENT RECORDS",
"""
SELECT DISTINCT *
FROM students
"""
),

("TASK 3 - COMMON RECORDS",
"""
SELECT a.id
FROM table_a a
INNER JOIN table_b b
ON a.id = b.id
"""
),

("TASK 4 - EMPLOYEES HIRED IN LAST 6 MONTHS",
"""
SELECT *
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
"""
),

("TASK 5 - CONTINUOUS DUPLICATE VALUES",
"""
SELECT DISTINCT l1.value_col
FROM logs l1
JOIN logs l2
ON l1.id = l2.id - 1
WHERE l1.value_col = l2.value_col
"""
)

]

for title, query in tasks:

    print("\n" + "=" * 50)
    print(title)
    print("=" * 50)

    cursor.execute(query)

    for row in cursor.fetchall():
        print(row)

conn.close()