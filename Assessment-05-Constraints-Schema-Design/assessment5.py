import mysql.connector

# Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="MILI@75",
    database="ecommerce_db"
)

cursor = conn.cursor()

print("\nTASK 1: Users Table")

cursor.execute("SELECT * FROM users")

for row in cursor.fetchall():
    print(row)

print("\nTASK 2: Orders Table")

cursor.execute("SELECT * FROM orders")

for row in cursor.fetchall():
    print(row)

print("\nTASK 3: Indexes on Users Table")

cursor.execute("SHOW INDEX FROM users")

for row in cursor.fetchall():
    print(row)

print("\nTASK 4: Available Views")

cursor.execute("""
SHOW FULL TABLES
WHERE TABLE_TYPE='VIEW'
""")

for row in cursor.fetchall():
    print(row)

print("\nTASK 5: User Order Summary View")

cursor.execute("""
SELECT *
FROM user_order_summary
""")

for row in cursor.fetchall():
    print(row)

conn.close()