-- Create Database
CREATE DATABASE assessment_db;

-- Select Database
USE assessment_db;

-- Create Table
CREATE TABLE students(
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    year INT,
    marks INT
);

-- Insert Data
INSERT INTO students VALUES
(1,'Mili Patel','CSE',3,85),
(2,'Rahul Shah','IT',2,72),
(3,'Priya Patel','CSE',3,91),
(4,'Amit Kumar','ECE',1,68),
(5,'Neha Singh','CSE',2,78),
(6,'Jay Mehta','IT',3,88);

-- Task 1:Display all student records.
SELECT * FROM students;

-- Task 2:Display only name and department.
SELECT name, department
FROM students;

-- Task 3:Find students with marks greater than 75.
SELECT *
FROM students
WHERE marks > 75;

-- Task 4:Display students from CSE department.
SELECT *
FROM students
WHERE department = 'CSE';

-- Task 5:Sort students by marks (descending).
SELECT *
FROM students
ORDER BY marks DESC;

-- Task 6:Display top 3 scorers.
SELECT *
FROM students
ORDER BY marks DESC
LIMIT 3;