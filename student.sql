/* Create a new database */
CREATE DATABASE class;
USE class;

/* Create table student */
CREATE TABLE student (
 rollno INT PRIMARY KEY,
 name VARCHAR(50),
 marks INT NOT NULL,
 grade VARCHAR(1),
 city VARCHAR(50)
);

/* View the student table */
SELECT * FROM student;

/* the given below table is parent table */
CREATE TABLE dept(
 id INT PRIMARY KEY,
 deptname VARCHAR(50)
);

/* Inserting values into dept */
INSERT INTO dept VALUES(101, "IT");
INSERT INTO dept VALUES(102, "CSE");

/* Updating dept table */
UPDATE dept
SET id = 103
WHERE id = 102;

/* Viewing dept table */
SELECT * FROM dept;

/* the given below table is child table and here we are using FOREIGN KEY to connect child table to parent table */
CREATE TABLE teacher(
 id INT PRIMARY KEY,
 name VARCHAR(50),
 dept_id INT,
 FOREIGN KEY (dept_id) REFERENCES dept(id)
);

/* Viewing teacher table */
SELECT * FROM teacher;

/* Inserting values into teacher */
INSERT INTO teacher VALUES(1, "ANAND", 101);
INSERT INTO teacher VALUES(2, "ZORO", 103);

/* Inserting values into student */
INSERT INTO student VALUES(1, "ANAND", 88, "A", "HYD");
INSERT INTO student VALUES(2, "ZORO", 61, "C", "JP");
INSERT INTO student VALUES(44, "NARUTO", 77, "B", "TOK");
INSERT INTO student VALUES(54, "SUMIT", 99, "O", "KAR");
INSERT INTO student VALUES(23, "ICHIGO", 95, "O", "OSA");

/* Displaying all student records */
SELECT * FROM student;

/* Selecting only marks */
SELECT marks FROM student;

/* Adding a new column age */
ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;

/* Displaying records with condition (marks - 10 < 80) */
SELECT * FROM student WHERE (marks - 10 < 80);

/* Displaying records with city = "JP" */
SELECT * FROM student WHERE city = "JP";

/* Displaying students in descending order of marks */
SELECT * FROM student ORDER BY marks DESC;

/* Grouping by grade */
SELECT grade, COUNT(name) FROM student GROUP BY grade;
SELECT grade, COUNT(rollno) FROM student GROUP BY grade;
SELECT grade, COUNT(city) FROM student GROUP BY grade;
SELECT grade, COUNT(marks) FROM student GROUP BY grade;

/* in the below query we are checking the average marks from the table student 
   from each city and we are keeping them in the descending order */
SELECT city, AVG(marks) 
FROM student 
GROUP BY city
ORDER BY AVG(marks) DESC; 

/* in the below query we are counting names where min marks are <=90  
   and we are grouping them by city by using the having clause */
SELECT COUNT(name), city 
FROM student 
GROUP BY city 
HAVING MIN(marks) <= 90;

/* Correct HAVING clause with condition */
SELECT COUNT(name), city 
FROM student 
GROUP BY city 
HAVING MAX(grade) IN ('O','A');

/* "We use the HAVING clause to filter groups of rows that result from the GROUP BY clause. 
   It is applied after the rows have been grouped." */

/* Updating student grades */
UPDATE student 
SET grade = "B" 
WHERE grade = "C";

UPDATE student 
SET grade = 'C' 
WHERE rollno = 2;

/* To avoid safe update mode issues */
SET SQL_SAFE_UPDATES = 0;

/* Changing student table schema */
ALTER TABLE student CHANGE age stu_age INT;
ALTER TABLE student MODIFY stu_age VARCHAR(2);

/* Display updated student table */
SELECT * FROM student;

/* Performing UNION operation between student and teacher names */
SELECT name FROM student
UNION 
SELECT name FROM teacher;
