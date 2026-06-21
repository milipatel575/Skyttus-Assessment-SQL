USE assessment_db;

-- Task 1:Count total number of students.
SELECT COUNT(*) AS total_students
FROM students;

-- Task 2:Find Average Marks of Students.
SELECT AVG(marks) AS average_marks
FROM students;

-- Task 3:Find Highest and Lowest Marks.
SELECT
MAX(marks) AS highest_marks,
MIN(marks) AS lowest_marks
FROM students;

-- Task 4:Find Department-wise Average Marks.
SELECT
department,
AVG(marks) AS average_marks
FROM students
GROUP BY department;

-- Task 5:Display Departments Where Average Marks > 70.
SELECT
department,
AVG(marks) AS average_marks
FROM students
GROUP BY department
HAVING AVG(marks) > 70;