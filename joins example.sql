/* Create a new database */
CREATE DATABASE school;
USE school;

/* Create student table */
CREATE TABLE student (
  student_id INT PRIMARY KEY,
  name VARCHAR(20)
);

/* Insert values into student */
INSERT INTO student VALUES(101, "ANAND");
INSERT INTO student VALUES(102, "NARUTO");
INSERT INTO student VALUES(103, "LUFFY");

/* Display student table */
SELECT * FROM student;

/* Create course table */
CREATE TABLE course (
 course_id INT,
 course VARCHAR(20)
);

/* Insert values into course */
INSERT INTO course VALUES(102, "ENG");
INSERT INTO course VALUES(103, "SCI");
INSERT INTO course VALUES(104, "CSE");
INSERT INTO course VALUES(105, "ECE");

/* Display course table */
SELECT * FROM course;

/* INNER JOIN: returns only matched records from both tables */
SELECT * FROM student INNER JOIN course ON student.student_id = course.course_id;

/* LEFT JOIN: returns all records from student (left table) 
   and matched records from course (right table) */
SELECT * FROM student AS a LEFT JOIN course AS b ON a.student_id = b.course_id;

/* RIGHT JOIN: returns all records from course (right table) 
   and matched records from student (left table) */

SELECT * FROM student RIGHT JOIN course ON student.student_id = course.course_id;

/* FULL OUTER JOIN simulation: LEFT JOIN + RIGHT JOIN using UNION */
SELECT * FROM student AS a LEFT JOIN course AS b ON a.student_id = b.course_id
UNION
SELECT * FROM student AS a RIGHT JOIN course AS b ON a.student_id = b.course_id;

/* RIGHT EXCLUSIVE JOIN: only rows from right table with no match in left */
SELECT * FROM student AS a RIGHT JOIN course AS b ON a.student_id = b.course_id WHERE a.student_id IS NULL;

/* LEFT EXCLUSIVE JOIN: only rows from left table with no match in right */
SELECT * FROM student AS a LEFT JOIN course AS b ON a.student_id = b.course_id WHERE b.course_id IS NULL;

/* WRONG IDEA: using HAVING is not the correct way, replaced below */

/* CORRECT SOLUTION: FULL OUTER EXCLUSIVE JOIN 
   → unmatched rows from both tables */
SELECT * FROM student AS a LEFT JOIN course AS b ON a.student_id = b.course_id WHERE b.course_id IS NULL
UNION
SELECT * FROM student AS a RIGHT JOIN course AS b ON a.student_id = b.course_id WHERE a.student_id IS NULL;

/* ---------------- SELF JOIN EXAMPLE ---------------- */


