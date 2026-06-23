# Assessment 5 - Constraints & Schema Design

## Objective

Implement database constraints and schema design concepts using MySQL and access them through Python.

---

## Database Used

ecommerce_db

---

## Tables Used

### users

| Column | Data Type |
|----------|----------|
| user_id | INT |
| username | VARCHAR(50) |
| email | VARCHAR(100) |
| password | VARCHAR(100) |

### orders

| Column | Data Type |
|----------|----------|
| order_id | INT |
| user_id | INT |
| product_name | VARCHAR(100) |
| amount | INT |

---

## Constraints Implemented

### Primary Key

- user_id
- order_id

### Unique Constraint

- email

### Not Null Constraint

- password

### Foreign Key

```sql
FOREIGN KEY(user_id)
REFERENCES users(user_id)
```

### Index

```sql
CREATE INDEX idx_email
ON users(email);
```

### View

```sql
CREATE VIEW user_order_summary AS ...
```

---

## Tasks Completed

### Task 1
Create users table with constraints.

### Task 2
Create orders table with foreign key relationship.

### Task 3
Create email index.

### Task 4
Create view.

### Task 5
Access view through Python.

---

## Files Included

- assessment5.sql
- assessment5.py
- Output Screenshots

---

## Technologies Used

- Python
- MySQL
- mysql-connector-python
- VS Code
- GitHub

---

## Concepts Covered

- Primary Key
- Unique Constraint
- Not Null Constraint
- Foreign Key
- Indexing
- Views
- Python Database Connectivity

---

## Result

Successfully implemented database constraints and schema design concepts using MySQL and accessed them through Python.
