import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="MILI@75",
    database="assessment_db"
)

cursor = conn.cursor()

print("\nTASK 1: Count Total Number of Students")

cursor.execute("""
SELECT COUNT(*) AS total_students
FROM students
""")

for row in cursor.fetchall():
    print("Total Students:", row[0])

print("\nTASK 2: Average Marks of Students")

cursor.execute("""
SELECT AVG(marks) AS average_marks
FROM students
""")

for row in cursor.fetchall():
    print("Average Marks:", round(row[0], 2))

print("\nTASK 3: Highest and Lowest Marks")

cursor.execute("""
SELECT
MAX(marks) AS highest_marks,
MIN(marks) AS lowest_marks
FROM students
""")

for row in cursor.fetchall():
    print("Highest Marks:", row[0])
    print("Lowest Marks :", row[1])

print("\nTASK 4: Department-wise Average Marks")

cursor.execute("""
SELECT
department,
AVG(marks) AS average_marks
FROM students
GROUP BY department
""")

for row in cursor.fetchall():
    print("Department:", row[0], "| Average Marks:", round(row[1], 2))

print("\nTASK 5: Departments where Average Marks > 70")

cursor.execute("""
SELECT
department,
AVG(marks) AS average_marks
FROM students
GROUP BY department
HAVING AVG(marks) > 70
""")

for row in cursor.fetchall():
    print("Department:", row[0], "| Average Marks:", round(row[1], 2))

conn.close()