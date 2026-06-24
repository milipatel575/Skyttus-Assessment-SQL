import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="MILI@75",
    database="ECommerces_db"
)

cursor = conn.cursor()

tasks = [

("TASK 1 - SHOW INDEX",
"""
SHOW INDEX FROM orders
"""
),

("TASK 2 - EXPLAIN SEARCH QUERY",
"""
EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 1
"""
),

("TASK 3 - EXPLAIN JOIN QUERY",
"""
EXPLAIN
SELECT
c.name,
o.order_id,
o.amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
"""
)
]
for title, query in tasks:

    print("\n" + "="*50)
    print(title)
    print("="*50)

    cursor.execute(query)

    for row in cursor.fetchall():
        print(row)

conn.close()