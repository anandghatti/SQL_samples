CREATE DATABASE company;
USE company;

CREATE TABLE employee (
 emp_id INT PRIMARY KEY,
 name VARCHAR(20),
 birth_day DATE,
 sex VARCHAR(10),
 salary INT,
 super_id INT,
 branch_id INT
 );

SELECT * FROM employee;

ALTER TABLE employee ADD FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL; 
ALTER TABLE employee ADD FOREIGN KEY (super_id) REFERENCES employee(emp_id) ON DELETE SET NULL; 

CREATE TABLE branch (
branch_id INT PRIMARY KEY,
branch_name VARCHAR(20),
mgr_id INT,
mgr_start_date DATE,
FOREIGN KEY (mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

SELECT * FROM branch;

CREATE TABLE customer(
 cus_id INT PRIMARY KEY,
 cus_name VARCHAR(20),
 branch_id INT,
 FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
 );

SELECT * FROM customer;

 CREATE TABLE works(
  emp_id INT,
  cus_id INT,
  total_sales INT,
  PRIMARY KEY (emp_id, cus_id),
  FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY (cus_id) REFERENCES customer(cus_id) ON DELETE CASCADE
 );
 
 SELECT * FROM works;
 
 CREATE TABLE supplier (
 branch_id INT,
 supplier_name VARCHAR(30),
 supply_type VARCHAR(20),
 PRIMARY KEY (branch_id, supplier_name),
 FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
 );
 
 SELECT * FROM supplier;
 
INSERT INTO employee VALUES (100, 'ANAND', '1995-02-13', 'M', 30000, NULL, NULL);
INSERT INTO branch VALUES(1, 'CORPORATE', 100, '2011-1-1');

UPDATE employee SET branch_id = 1 WHERE emp_id = 100;

INSERT INTO employee VALUES (101, 'ZORO', '1995-12-12', 'M', 30000 , 100, 1);

INSERT INTO employee VALUES (102, 'LUFFY', '1991-01-12', 'M', 30000, NULL, NULL);
INSERT INTO branch VALUES(2, 'SYNDICATE', 100, '2010-8-21');


UPDATE employee SET branch_id = 2 WHERE emp_id = 102;

INSERT INTO employee VALUES (103, 'SANJI', '1991-07-07', 'M', 30000, NULL, NULL);
INSERT INTO employee VALUES (104, 'TOBIO', '1990-09-22', 'M', 30000, NULL, NULL);
INSERT INTO employee VALUES (105, 'BOKUTO', '1987-03-05', 'M', 30000, NULL, NULL);
 
INSERT INTO employee VALUES (106, 'ICHIGO', '1988-05-12', 'M', 30000, NULL, NULL);
INSERT INTO branch VALUES(3, 'SOUL REAPER', 100, '2010-8-21');