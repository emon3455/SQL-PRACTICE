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



-- Filtering & Logical Operations (Based on 8-5, 8-7, 8-8) Write a query to find all students who have a score greater than 80 and not null.


-- Use the NOT operator to exclude students from a specific department.


-- Fetch students whose names start with ‘A’ using LIKE and ILIKE.


-- Select all students whose age is between 18 and 25.


-- Retrieve rows using IN for a specific set of roll numbers.