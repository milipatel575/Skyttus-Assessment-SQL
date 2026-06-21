-- Assessment 5: Constraints & Schema Design

-- Tasks: 
 
-- 1.Create users table with:  
-- Primary key  
-- Unique email  
-- Not null password  .

CREATE DATABASE ecommerce_db;

USE ecommerce_db;

CREATE TABLE users(
   user_id INT PRIMARY KEY,
   username VARCHAR(50),
   email VARCHAR(100) UNIQUE,
   password VARCHAR(100) NOT NULL
);

-- Insert Sample Data
INSERT INTO users VALUES
(1,'Mili','mili@gmail.com','123456'),
(2,'Rahul','rahul@gmail.com','abc123'),
(3,'Neha','neha@gmail.com','pass789');

SELECT * FROM users;

DESC users;

-- 2.Add foreign key between orders and users.(for Task 2: Create Orders Table).  
CREATE TABLE orders(
  order_id INT PRIMARY KEY,
  user_id INT,
  product_name VARCHAR(100), 
  amount INT,
  FOREIGN KEY(user_id)
  REFERENCES users(user_id)
);

-- Insert Sample Data
INSERT INTO orders VALUES
(101,1,'Laptop',50000),
(102,1,'Mouse',1000),
(103,2,'Keyboard',2000),
(104,3,'Monitor',12000);

SELECT * FROM orders;
DESC orders;
SHOW CREATE TABLE orders;

-- 3.Create index on email column.  
CREATE INDEX idx_email
ON users(email);

SHOW INDEX FROM users;

-- 4.Create view to display user order summary.
CREATE VIEW user_order_summary AS
SELECT
u.user_id,
u.username,
o.order_id,
o.product_name,
o.amount
FROM users u
JOIN orders o
ON u.user_id = o.user_id;


SHOW FULL TABLES
WHERE TABLE_TYPE='VIEW';

SELECT * FROM user_order_summary;
