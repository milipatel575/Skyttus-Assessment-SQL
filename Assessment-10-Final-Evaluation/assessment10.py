import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="MILI@75",
    database="mess_management_db"
)

cursor = conn.cursor()

queries = [

("Total Students",
"SELECT COUNT(*) FROM students"),

("Total Revenue",
"SELECT SUM(amount) FROM payments"),

("Student Meal Plans",
"""
SELECT s.student_name, mp.plan_name
FROM students s
JOIN subscriptions sub
ON s.student_id=sub.student_id
JOIN meal_plans mp
ON sub.plan_id=mp.plan_id
"""),

("Attendance Report",
"""
SELECT student_id,
COUNT(*) AS attendance_count
FROM attendance
GROUP BY student_id
""")
]

for title, query in queries:

    print("\n" + "="*50)
    print(title)
    print("="*50)

    cursor.execute(query)

    for row in cursor.fetchall():
        print(row)

conn.close()