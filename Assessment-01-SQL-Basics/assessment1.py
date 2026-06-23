import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="MILI@75",
    database="assessment_db"
)

cursor = conn.cursor()

print("\nTASK 1: Display all student records ")

cursor.execute("SELECT * FROM students")

for row in cursor.fetchall():
    print(row)

print("\nTASK 2: Display only name and department")

cursor.execute("""
SELECT name, department
FROM students
""")

for row in cursor.fetchall():
    print(row)

print("\nTASK 3: Students with marks greater than 75")

cursor.execute("""
SELECT *
FROM students
WHERE marks > 75
""")

for row in cursor.fetchall():
    print(row)

print("\nTASK 4: Students from CSE department")

cursor.execute("""
SELECT *
FROM students
WHERE department='CSE'
""")

for row in cursor.fetchall():
    print(row)

print("\nTASK 5: Students sorted by marks descending")

cursor.execute("""
SELECT *
FROM students
ORDER BY marks DESC
""")

for row in cursor.fetchall():
    print(row)

print("\nTASK 6: Top 3s scorer")

cursor.execute("""
SELECT *
FROM students
ORDER BY marks DESC
LIMIT 3
""")

for row in cursor.fetchall():
    print(row)

conn.close()