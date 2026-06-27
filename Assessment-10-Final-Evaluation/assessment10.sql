-- Design database for mess management system.
-- Create Database.

CREATE DATABASE mess_management_db;
USE mess_management_db;

-- Tables.

CREATE TABLE students(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    room_no INT,
    mobile VARCHAR(15)
);

CREATE TABLE meal_plans(
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(30),
    monthly_fee DECIMAL(10,2)
);

-- Relationships.

CREATE TABLE subscriptions(
    subscription_id INT PRIMARY KEY,
    student_id INT,
    plan_id INT,
    start_date DATE,

    FOREIGN KEY(student_id)
    REFERENCES students(student_id),

    FOREIGN KEY(plan_id)
    REFERENCES meal_plans(plan_id)
);

CREATE TABLE attendance(
    attendance_id INT PRIMARY KEY,
    student_id INT,
    attendance_date DATE,
    meal_type VARCHAR(20),

    FOREIGN KEY(student_id)
    REFERENCES students(student_id)
);

CREATE TABLE payments(
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,

    FOREIGN KEY(student_id)
    REFERENCES students(student_id)
);

-- Sample data.

INSERT INTO students VALUES
(1,'Mahi Patel',101,'9876543210'),
(2,'Raj Shah',102,'9876543211'),
(3,'Priya Patel',103,'9876543212'),
(4,'Diya Kumar',104,'9876543213'),
(5,'Nishtha Singh',105,'9876543214');

INSERT INTO meal_plans VALUES
(1,'Basic',2500),
(2,'Standard',3500),
(3,'Premium',4500);

INSERT INTO subscriptions VALUES
(1,1,2,'2026-06-01'),
(2,2,1,'2026-06-01'),
(3,3,3,'2026-06-01'),
(4,4,2,'2026-06-01'),
(5,5,1,'2026-06-01');

INSERT INTO attendance VALUES
(1,1,'2026-06-15','Breakfast'),
(2,1,'2026-06-15','Lunch'),
(3,2,'2026-06-15','Dinner'),
(4,3,'2026-06-15','Lunch'),
(5,4,'2026-06-15','Breakfast');

INSERT INTO payments VALUES
(1,1,3500,'2026-06-05'),
(2,2,2500,'2026-06-05'),
(3,3,4500,'2026-06-05'),
(4,4,3500,'2026-06-05'),
(5,5,2500,'2026-06-05');

-- 15 Business Queries.

-- 1.Display all students registered in the mess system.
SELECT * FROM students;

-- 2.Display all available meal plans.
SELECT * FROM meal_plans;

-- 3.Display student names along with their room numbers.
SELECT student_name, room_no
FROM students;

-- 4.Find the total number of students registered in the mess.
SELECT COUNT(*) AS total_students
FROM students;

-- 5.Calculate the total revenue collected from student payments.
SELECT SUM(amount) AS total_revenue
FROM payments;

-- 6.Calculate the average payment made by students.
SELECT AVG(amount) AS average_payment
FROM payments;

-- 7.Find the highest payment made by any student.
SELECT MAX(amount) AS highest_payment
FROM payments;

-- 8.Find the lowest payment made by any student.
SELECT MIN(amount) AS lowest_payment
FROM payments;

-- 9.Display student names with their subscribed meal plans.
SELECT s.student_name, mp.plan_name
FROM students s
JOIN subscriptions sub
ON s.student_id=sub.student_id
JOIN meal_plans mp
ON sub.plan_id=mp.plan_id;

-- 10.Display meal-wise attendance count.
SELECT meal_type,
COUNT(*) total_meals
FROM attendance
GROUP BY meal_type;

-- 11.Display attendance count of each student.
SELECT student_id,
COUNT(*) total_attendance
FROM attendance
GROUP BY student_id;

-- 12.Display students who paid more than ₹3000.
SELECT *
FROM payments
WHERE amount > 3000;

-- 13.Display students in alphabetical order.
SELECT *
FROM students
ORDER BY student_name;

-- 14.Display payments in descending order.
SELECT *
FROM payments
ORDER BY amount DESC;

-- 15.Display students who never marked attendance.
SELECT student_name
FROM students
WHERE student_id NOT IN
(
SELECT student_id
FROM attendance
);

-- optimize atleast 3 queries .

-- 1. Optimize searching students by student name.
SELECT *
FROM students
WHERE student_name = 'Mahi Patel';

CREATE INDEX idx_student_name
ON students(student_name);

EXPLAIN
SELECT *
FROM students
WHERE student_name = 'Mahi Patel';

-- 2. Optimize attendance search for a specific student.
SELECT *
FROM attendance
WHERE student_id = 1;

CREATE INDEX idx_attendance_student
ON attendance(student_id);

EXPLAIN
SELECT *
FROM attendance
WHERE student_id = 1;

-- 3. Optimize payment report generation.
SELECT *
FROM payments
WHERE student_id = 1;

CREATE INDEX idx_payment_student
ON payments(student_id);

EXPLAIN
SELECT *
FROM payments
WHERE student_id = 1;