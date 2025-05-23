DROP Table student;

CREATE Table student(
    id SERIAL PRIMARY KEY,
    roll INTEGER UNIQUE,
    name VARCHAR(50),
    age INTEGER,
    department VARCHAR(10),
    score INTEGER,
    status VARCHAR(20),
    last_login DATE
);

INSERT INTO student (roll, name, age, department, score, status, last_login) VALUES
(111, 'Kevin Parker', 21, 'EE', 81, 'active', '2025-05-19'),
(112, 'Laura Palmer', 22, 'ME', 67, 'inactive', '2025-03-30'),
(113, 'Mike Ross', 23, 'CS', 76, 'active', '2025-05-17'),
(114, 'Nancy Wheeler', 20, 'CE', 89, 'active', '2025-05-20'),
(115, 'Oscar Diaz', 19, 'ME', 62, 'suspended', '2025-04-12'),
(116, 'Pam Beesly', 21, 'CS', 91, 'active', '2025-05-22'),
(117, 'Quentin Blake', 22, 'EE', 73, 'inactive', '2025-02-18'),
(118, 'Rachel Green', 20, 'CS', 84, 'active', '2025-05-21'),
(119, 'Steve Harrington', 23, 'ME', 77, 'active', '2025-05-16'),
(120, 'Tina Belcher', 19, 'CE', 69, 'suspended', '2025-03-05');


SELECT * FROM student;


-- Table Alteration Tasks (Based on 8-1 to 8-3)

-- Add a column email (VARCHAR) to the existing students table.
ALTER Table student ADD COLUMN email VARCHAR(50);

-- Rename the column email to student_email.
ALTER Table student
    RENAME COLUMN email TO student_email

-- Add a UNIQUE constraint to student_email.
ALTER TABLE student
    ADD CONSTRAINT UNIQUE_STUDENT_EMAIL UNIQUE(student_email)

-- Add a PRIMARY KEY to a new table named courses.
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);

-- Drop a column from any existing table.
ALTER TABLE student
    DROP COLUMN last_login


-- updating column valur and add values on field
-- Update emails using roll numbers
UPDATE student SET student_email = 'kevin.parker@example.com' WHERE roll = 111;
UPDATE student SET student_email = 'laura.palmer@example.com' WHERE roll = 112;
UPDATE student SET student_email = 'mike.ross@example.com' WHERE roll = 113;
UPDATE student SET student_email = 'nancy.wheeler@example.com' WHERE roll = 114;
UPDATE student SET student_email = 'pam.beesly@example.com' WHERE roll = 116;
UPDATE student SET student_email = 'rachel.green@example.com' WHERE roll = 118;
UPDATE student SET score = 45 WHERE roll = 118;
UPDATE student SET score = 43 WHERE roll = 120;
UPDATE student SET score = 49 WHERE roll = 105;



-- Filtering & Logical Operations (Based on 8-5, 8-7, 8-8) Write a query to find all students who have a score greater than 80 and not null.

SELECT * FROM student as s
    WHERE s.score >= 80 AND s.score IS NOT NULL;

-- Use the NOT operator to exclude students from a specific department.
SELECT * FROM student as s
    WHERE NOT s.department = 'CS';

-- Fetch students whose names start with ‘A’ using LIKE and ILIKE.
SELECT * FROM student as s
    WHERE s.name LIKE 'a%';

SELECT * FROM student as s
    WHERE s.name ILIKE 'a%';

-- Select all students whose age is between 20 and 22.
SELECT * FROM student as s
    WHERE s.age >=20 AND s.age <=22;

SELECT * FROM student as s
    WHERE s.age BETWEEN 21 and 23

-- Retrieve rows using IN for a specific set of roll numbers.
SELECT * from student
    WHERE roll in (101, 111, 115)

-- Aggregate Functions (Based on 8-6)
-- Count how many students exist in the students table.
SELECT count(*) as "Total Student" FROM student

-- Find the average score of students in a specific department.
SELECT avg(score) FROM student 
    WHERE department = 'CS'

-- Get the maximum and minimum age of all students.
SELECT max(age) as "Maximum Age", min(age) as "Minimum Age" from student;

-- Update & Delete Operations (Based on 8-9, 8-10)
-- Update the status of students who scored less than 50 to 'failed'.
UPDATE student as s SET status = 'Failed'
    WHERE s.score < 50;

SELECT * FROM student
    WHERE status='Failed'

-- Delete students who have not logged in since last month.
ALTER TABLE student ADD COLUMN last_login DATE;

-- Reinsert previous last_login values (assuming you still have them)
UPDATE student SET last_login = '2025-05-19' WHERE roll = 111;
UPDATE student SET last_login = '2025-03-30' WHERE roll = 112;
UPDATE student SET last_login = '2025-05-17' WHERE roll = 113;
UPDATE student SET last_login = '2025-05-20' WHERE roll = 114;
UPDATE student SET last_login = '2025-04-12' WHERE roll = 115;
UPDATE student SET last_login = '2025-05-22' WHERE roll = 116;
UPDATE student SET last_login = '2025-02-18' WHERE roll = 117;
UPDATE student SET last_login = '2025-05-21' WHERE roll = 118;
UPDATE student SET last_login = '2025-05-16' WHERE roll = 119;
UPDATE student SET last_login = '2025-03-05' WHERE roll = 120;

SELECT * FROM student
    WHERE last_login < CURRENT_DATE - INTERVAL '1 month'

DELETE FROM student WHERE last_login < CURRENT_DATE - INTERVAL '1 month';


-- Use LIMIT and OFFSET to fetch the second page of results (5 per page).
SELECT * FROM student
    LIMIT 5 OFFSET 5