CREATE DATABASE bank_db;

USE bank_db;

CREATE TABLE accounts(
	account_id INT PRIMARY KEY,
    account_holder VARCHAR(50),
    balance DECIMAL(10, 2)
);

INSERT INTO accounts VALUES
(101,'Mahi',50000),
(102,'Diya',30000),
(103,'Prince',40000);

SELECT * FROM accounts;

-- Tasks (Database Transactions)
-- 1.Start a transaction
START TRANSACTION;
SELECT * FROM accounts;

-- 2.Insert record into accounts
INSERT INTO accounts VALUES
(104, 'Kriya', 10000);

SELECT * FROM accounts;

-- 3.Rollback changes
ROLLBACK;
SELECT * FROM accounts;

-- 4.Commit valid transactions
START TRANSACTION;

INSERT INTO accounts VALUES
(105, 'charles_commited_user', 15000);

COMMIT;
SELECT * FROM accounts;

-- 5.Demonstrate transfer of money using transaction
-- Before Transfer
SELECT * FROM accounts;

-- Start Transaction
START TRANSACTION;

-- Deduct Money
UPDATE accounts
SET balance = balance - 5000
WHERE account_id = 101;

-- Add Money
UPDATE accounts
SET balance = balance + 5000
WHERE account_id = 102;

COMMIT;

SELECT * FROM accounts;
