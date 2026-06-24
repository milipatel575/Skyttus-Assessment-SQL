import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="MILI@75",
    database="ECommerces_db"
)
cursor = conn.cursor()
tasks=[
    ("TASK 1 - Total Orders Per Customer",
"""
SELECT c.name,
COUNT(o.order_id)
FROM customers c
LEFT JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.name
"""
),

("TASK 2 - Customers Never Placed Order",
"""
SELECT c.customer_id,c.name
FROM customers c
LEFT JOIN orders o
ON c.customer_id=o.customer_id
WHERE o.order_id IS NULL
"""
),

("TASK 3 - Highest Selling Product",
"""
SELECT p.product_name,
SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 1
"""
),

("TASK 4 - Monthly Sales Report",
"""
SELECT
MONTH(order_date),
SUM(amount)
FROM orders
GROUP BY MONTH(order_date)
"""
),

("TASK 5 - Customers Purchase > 50000",
"""
SELECT c.name,
SUM(o.amount)
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.name
HAVING SUM(o.amount)>50000
"""
),

("TASK 6 - Top 3 Cities By Revenue",
"""
SELECT c.city,
SUM(o.amount)
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.city
ORDER BY SUM(o.amount) DESC
LIMIT 3
"""
)

]

for tittle, query in tasks:
    print("\n" + "=" *50)
    print(tittle)
    print("="* 50)

    cursor.execute(query)

    for row in cursor.fetchall():
        print(row)

conn.close()