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

-- Add a PRIMARY KEY to a new table named courses.


-- Drop a column from any existing table.