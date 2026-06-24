CREATE DATABASE ECommerces_db;

USE ECommerces_db;

CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE products(
	product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE order_items(
	order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY(order_id)
    REFERENCES orders(order_id),
    FOREIGN KEY(product_id)
    REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1,'Mahi','Surat'),
(2,'Diya','Ahmedabad'),
(3,'Prince','Vadodara'),
(4,'Vishu','Surat'),
(5,'Jay','Rajkot');

INSERT INTO products VALUES
(101,'Laptop',50000),
(102,'Mouse',1000),
(103,'Keyboard',2000),
(104,'Monitor',12000);

INSERT INTO orders VALUES
(1001,1,'2025-01-10',51000),
(1002,1,'2025-02-15',12000),
(1003,2,'2025-02-20',50000),
(1004,3,'2025-03-05',2000),
(1005,4,'2025-03-10',62000);

INSERT INTO order_items VALUES
(1001,101,1),
(1001,102,1),
(1002,104,1),
(1003,101,1),
(1004,103,1),
(1005,101,1),
(1005,104,1);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

-- Tasks : 

-- 1.Total orders per customer 
SELECT 
c.name,
COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;
 
-- 2.Customers who never placed an order  
SELECT 
c.customer_id,
c.name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 3.Highest selling product  
SELECT
p.product_name,
SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 1;

-- 4.Monthly sales report  
SELECT 
MONTH(order_date) AS month,
SUM(amount) AS total_sales
FROM orders
GROUP BY MONTH(order_date);

-- 5.Customers with total purchase > ₹50,000  
SELECT 
c.name,
SUM(o.amount) AS total_purchase
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING SUM(o.amount) > 50000;

-- 6.Top 3 cities by revenue
SELECT 
c.city,
SUM(o.amount) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY revenue DESC
LIMIT 3;
