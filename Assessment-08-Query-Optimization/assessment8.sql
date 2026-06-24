USE ECommerces_db;

-- Tasks :

--  1.Add index to improve search on orders.customer_id 
CREATE INDEX idx_customer_id
ON orders(customer_id);

SHOW INDEX FROM orders;

--  2.Use EXPLAIN to analyze query 
EXPLAIN 
SELECT * FROM orders
WHERE customer_id = 1;

--  3.Optimize a slow join query
SELECT c.name,
o.order_id,
o.amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

--  4.Explain when index should not be used