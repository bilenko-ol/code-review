CREATE TABLE University
(
    id   INT PRIMARY KEY,
    name VARCHAR(255)
);
CREATE TABLE Instructor
(
    id   INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Student
(
    id   INT PRIMARY KEY,
    name VARCHAR(255)
);
CREATE TABLE Faculty
(
    id            INT PRIMARY KEY,
    name          VARCHAR(255),
    dean_id       INT,
    university_id INT,
    FOREIGN KEY (dean_id) REFERENCES Instructor (id),
    FOREIGN KEY (university_id) REFERENCES University (id)
);

CREATE TABLE Department
(
    id                 INT PRIMARY KEY,
    name               VARCHAR(255),
    department_head_id INT,
    faculty_id         INT,
    FOREIGN KEY (department_head_id) REFERENCES Instructor (id),
    FOREIGN KEY (faculty_id) REFERENCES Faculty (id)
);

CREATE TABLE Course
(
    id            INT PRIMARY KEY,
    name          VARCHAR(255),
    course_code   VARCHAR(255),
    instructor_id INT,
    department_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructor (id),
    FOREIGN KEY (department_id) REFERENCES Department (id)
);



CREATE TABLE Enrollment
(
    id         INT PRIMARY KEY,
    student_id INT,
    course_id  INT,
    FOREIGN KEY (student_id) REFERENCES Student (id),
    FOREIGN KEY (course_id) REFERENCES Course (id)
);

CREATE TABLE Grade
(
    id            INT PRIMARY KEY,
    enrollment_id INT,
    grade         INT,
    FOREIGN KEY (enrollment_id) REFERENCES Enrollment (id)
);
