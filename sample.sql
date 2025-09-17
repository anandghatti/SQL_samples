CREATE DATABASE college;

USE college;
CREATE TABLE student (
 rollno INT PRIMARY KEY,
 name VARCHAR(50),
 marks INT NOT NULL,
 grade VARCHAR(1),
 city VARCHAR(50)
 );
SELECT * FROM student;
 DROP TABLE student;

/*the given below table is parent table*/
CREATE TABLE dept(
id INT PRIMARY KEY,
deptname VARCHAR(50)
);

INSERT INTO dept VALUES(101, "IT");
INSERT INTO dept VALUES(102, "CSE");

UPDATE dept
SET id = 103
WHERE id = 102;

SELECT * FROM dept;

/*the given below table is child table and here we are using FOREIGN KEY to connect child table to parent table */

CREATE TABLE teacher(
 id INT PRIMARY KEY,
 name VARCHAR(50),
 dept_id INT,
 FOREIGN KEY (dept_id) REFERENCES dept(id)
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );
 
 SELECT * FROM teacher;
 
 DROP TABLE teacher;
 
INSERT INTO teacher VALUES(1, "ANAND", 101);
INSERT INTO teacher VALUES(2, "ZORO", 102);

 
INSERT INTO student VALUES(1, "ANAND", 88, "A", "HYD");
INSERT INTO student VALUES(2, "ZORO", 61, "C", "JP");
INSERT INTO student VALUES(44, "NARUTO", 77, "B", "TOK");
INSERT INTO student VALUES(54, "SUMIT", 99, "O", "KAR");
INSERT INTO student VALUES(23, "ICHIGO", 95, "O", "OSA");

SELECT * FROM student;

ALTER table student DROP column age;
SELECT * FROM student WHERE (marks - 10 < 80);
SELECT * FROM student WHERE city = "JP";
SELECT * FROM student ORDER BY marks DESC;

SELECT grade, COUNT(name) FROM student GROUP BY grade;
SELECT grade, COUNT(rollno) FROM student GROUP BY grade;
SELECT grade, COUNT(city) FROM student GROUP BY grade;
SELECT grade, COUNT(marks) FROM student GROUP BY grade;

/* in the below query we are checking the average marks from the table student from each city and we are keeping them in the descending order*/

SELECT city, AVG(marks) FROM student GROUP BY city
ORDER BY AVG(marks) DESC; 

/* in the belwo query we counting names where min marks are <=90  and we are grouping them by city by using the having clause*/

SELECT COUNT(name), city FROM student GROUP BY city HAVING min(marks) <= 90;
SELECT COUNT(name), city FROM student GROUP BY city HAVING max(grade) = 'O' AND 'A';

/*"We use the HAVING clause to filter groups of rows that result from the GROUP BY clause. It is applied after the rows have been grouped."*/

UPDATE student 
SET grade = "B" 
WHERE grade = "C";
UPDATE student 
SET grade = 'C' 
WHERE rollno = 2;

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;
ALTER TABLE student DROP age;
ALTER TABLE baaka RENAME TO student;
ALTER TABLE student CHANGE age stu_age INT;
ALTER TABLE student MODIFY stu_age VARCHAR(2);
ALTER TABLE student DROP stu_age;
SELECT * FROM student;

TRUNCATE TABLE student;

INSERT INTO student(rollno, name, marks, grade) VALUES(49, "BEN", 99, "O");
INSERT INTO student(rollno, name, marks, grade) VALUES(66, "GWEN", 77, "B");

SELECT name from student
UNION
SELECT name from teacher;

SELECT AVG(marks) FROM student;

SELECT COUNT(name) FROM student WHERE marks > 85.1429;

SELECT name, marks FROM student WHERE marks > (SELECT AVG(marks) FROM student);

SELECT rollno FROM student WHERE rollno % 2 = 0;

SELECT grade FROM student WHERE rollno IN(2, 44,54,66);

SELECT name FROM student WHERE rollno > (SELECT rollno %2 = 0 FROM student);

SELECT name 
FROM student 
WHERE rollno > (SELECT MAX(rollno) FROM student WHERE rollno % 2 = 0);

SELECT name, rollno FROM student WHERE rollno in(SELECT rollno FROM student WHERE rollno %2 = 0);

SELECT name FROM student WHERE city = "HYD";
SELECT name FROM student WHERE marks > 90;
SELECT name, marks FROM student WHERE marks IN (SELECT marks FROM student WHERE MAX(marks) > 90);

SELECT MAX(marks) FROM (SELECT * FROM student WHERE city = "HYD") AS temp; 

SELECT (SELECT max(marks) FROM student), name FROM student;

CREATE VIEW view1 AS select rollno,name, marks FROM student;

SELECT * FROM view1 WHERE marks > 90; 
DROP VIEW view1;