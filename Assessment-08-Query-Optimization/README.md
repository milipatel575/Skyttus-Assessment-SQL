# Assessment 8 - Query Optimization

## Objective

Learn techniques to improve SQL query performance.

---

## Tasks Completed

### Task 1
Create index on orders.customer_id.

### Task 2
Use EXPLAIN to analyze query execution.

### Task 3
Optimize JOIN query using index.

### Task 4
Understand situations where indexes should not be used.

---

## Concepts Covered

- Index
- Query Optimization
- EXPLAIN
- JOIN Optimization
- Database Performance

---

## When Not To Use Index

1. Small tables
2. Frequently updated tables
3. Low unique values
4. Very small datasets

---

## Technologies Used

- MySQL
- Python
- mysql-connector-python
- VS Code
- GitHub

## Task 4 - When Index Should Not Be Used

### Small Tables

Indexes are unnecessary for tables with very few records.

### Frequently Updated Tables

Indexes increase the cost of INSERT, UPDATE, and DELETE operations.

### Low Unique Values

Indexes are less effective on columns such as Gender or Status.

### Very Small Datasets

A full table scan may be faster than using an index.

### Conclusion

Indexes improve read performance but can reduce write performance and consume additional storage.