-- DROP & CREATE DATABASE (safe to run)
-- DROP DATABASE IF EXISTS BankAdministration;
CREATE DATABASE BankAdministration;
USE BankAdministration;

-- ================================
-- TABLE CREATION
-- ================================
CREATE TABLE Banks (
    bank_id INT PRIMARY KEY,
    bank_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    phone_number VARCHAR(15),
    address VARCHAR(200),
    city VARCHAR(50),
    state VARCHAR(50),
    bank_id INT,
    account_number VARCHAR(20) UNIQUE,
    account_type VARCHAR(20),
    monthly_credit DECIMAL(12,2),
    monthly_withdrawal DECIMAL(12,2),
    balance DECIMAL(12,2),
    FOREIGN KEY (bank_id) REFERENCES Banks(bank_id)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    bank_id INT,
    manager_id INT,
    FOREIGN KEY (bank_id) REFERENCES Banks(bank_id)
);

CREATE TABLE EmployeeAccounts (
    employee_id INT,
    account_number VARCHAR(20),
    PRIMARY KEY (employee_id, account_number),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (account_number) REFERENCES Customers(account_number)
);

CREATE TABLE Cards (
    card_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    card_type VARCHAR(20),
    card_number VARCHAR(20) UNIQUE,
    expiry_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- ================================
-- BANKS
-- ================================
INSERT INTO Banks (bank_id, bank_name, city, state) VALUES
(1, 'State Bank of India', 'Mumbai', 'Maharashtra'),
(2, 'HDFC Bank', 'Delhi', 'Delhi'),
(3, 'ICICI Bank', 'Bangalore', 'Karnataka'),
(4, 'Axis Bank', 'Hyderabad', 'Telangana'),
(5, 'Punjab National Bank', 'Chandigarh', 'Punjab');

SELECT * FROM Banks;

-- ================================
-- EMPLOYEES
-- ================================
INSERT INTO Employees (employee_id, name, age, bank_id, manager_id) VALUES
(101, 'Rajesh Sharma', 45, 1, NULL),
(102, 'Priya Verma', 32, 1, 101),
(103, 'Arjun Mehta', 42, 2, NULL),
(104, 'Neha Singh', 29, 2, 103),
(105, 'Karan Patel', 40, 3, NULL),
(106, 'Anita Rao', 34, 3, 105),
(107, 'Vikram Desai', 48, 4, NULL),
(108, 'Sneha Nair', 30, 4, 107),
(109, 'Rohit Kumar', 44, 5, NULL),
(110, 'Simran Kaur', 31, 5, 109);

SELECT * FROM Employees;

-- ================================
-- CUSTOMERS (50 records)
-- balance = monthly_credit - monthly_withdrawal
-- ================================
INSERT INTO Customers (customer_id, name, age, phone_number, address, city, state, bank_id, account_number, account_type, monthly_credit, monthly_withdrawal, balance) VALUES
(1, 'Amit Gupta', 30, '9876543210', '12 MG Road', 'Mumbai', 'Maharashtra', 1, 'SBI10001', 'Savings', 60000, 35000, 25000),
(2, 'Riya Sharma', 27, '9898989898', '45 Andheri East', 'Mumbai', 'Maharashtra', 1, 'SBI10002', 'Current', 80000, 45000, 35000),
(3, 'Nikhil Jain', 35, '9812345678', '89 Nehru Place', 'Delhi', 'Delhi', 2, 'HDFC20001', 'NRI', 120000, 60000, 60000),
(4, 'Pooja Nair', 29, '9822223344', '22 Koramangala', 'Bangalore', 'Karnataka', 3, 'ICICI30001', 'Savings', 50000, 20000, 30000),
(5, 'Arvind Rao', 45, '9833334444', '56 Jubilee Hills', 'Hyderabad', 'Telangana', 4, 'AXIS40001', 'Current', 150000, 100000, 50000),
(6, 'Manpreet Kaur', 33, '9844445555', '77 Sector 17', 'Chandigarh', 'Punjab', 5, 'PNB50001', 'Savings', 70000, 40000, 30000),
(7, 'Rahul Khanna', 38, '9855556666', '14 Bandra', 'Mumbai', 'Maharashtra', 1, 'SBI10003', 'NRI', 200000, 120000, 80000),
(8, 'Sneha Kapoor', 26, '9866667777', '12 Rajouri Garden', 'Delhi', 'Delhi', 2, 'HDFC20002', 'Savings', 55000, 25000, 30000),
(9, 'Vivek Yadav', 31, '9877778888', 'HSR Layout', 'Bangalore', 'Karnataka', 3, 'ICICI30002', 'Current', 95000, 47000, 48000),
(10, 'Kavita Joshi', 34, '9888889999', 'Banjara Hills', 'Hyderabad', 'Telangana', 4, 'AXIS40002', 'Savings', 40000, 15000, 25000),
(11, 'Suresh Reddy', 37, '9811111111', 'Madhapur', 'Hyderabad', 'Telangana', 4, 'AXIS40003', 'Current', 110000, 80000, 30000),
(12, 'Aarti Malhotra', 28, '9822222222', 'Connaught Place', 'Delhi', 'Delhi', 2, 'HDFC20003', 'Savings', 65000, 30000, 35000),
(13, 'Kiran Bhat', 29, '9833333333', 'Indiranagar', 'Bangalore', 'Karnataka', 3, 'ICICI30003', 'NRI', 130000, 70000, 60000),
(14, 'Meena Deshmukh', 41, '9844444444', 'Parel', 'Mumbai', 'Maharashtra', 1, 'SBI10004', 'Savings', 50000, 20000, 30000),
(15, 'Sahil Arora', 36, '9855555555', 'Vasant Kunj', 'Delhi', 'Delhi', 2, 'HDFC20004', 'Current', 90000, 50000, 40000),
(16, 'Deepa Iyer', 32, '9866666666', 'Whitefield', 'Bangalore', 'Karnataka', 3, 'ICICI30004', 'Savings', 75000, 35000, 40000),
(17, 'Abhishek Chauhan', 39, '9877777777', 'Model Town', 'Delhi', 'Delhi', 2, 'HDFC20005', 'NRI', 140000, 80000, 60000),
(18, 'Neelam Rathi', 42, '9888888888', 'Andheri West', 'Mumbai', 'Maharashtra', 1, 'SBI10005', 'Current', 100000, 60000, 40000),
(19, 'Vishal Sinha', 27, '9899999999', 'Banashankari', 'Bangalore', 'Karnataka', 3, 'ICICI30005', 'Savings', 48000, 20000, 28000),
(20, 'Shweta Tripathi', 35, '9800000000', 'Sector 22', 'Chandigarh', 'Punjab', 5, 'PNB50002', 'Savings', 72000, 35000, 37000),
(21, 'Anil Kumar', 46, '9812341111', 'Powai', 'Mumbai', 'Maharashtra', 1, 'SBI10006', 'Savings', 65000, 28000, 37000),
(22, 'Tanya Bansal', 30, '9823452222', 'Green Park', 'Delhi', 'Delhi', 2, 'HDFC20006', 'Current', 85000, 50000, 35000),
(23, 'Harish Gowda', 44, '9834563333', 'Jayanagar', 'Bangalore', 'Karnataka', 3, 'ICICI30006', 'Savings', 55000, 25000, 30000),
(24, 'Pallavi Kulkarni', 29, '9845674444', 'Begumpet', 'Hyderabad', 'Telangana', 4, 'AXIS40004', 'Savings', 60000, 30000, 30000),
(25, 'Gaurav Chopra', 38, '9856785555', 'Sector 35', 'Chandigarh', 'Punjab', 5, 'PNB50003', 'Current', 95000, 50000, 45000);

SELECT * FROM Customers;

-- ================================
-- EMPLOYEE → ACCOUNT MAPPINGS
-- (who handles which account_number)
-- ================================
INSERT INTO EmployeeAccounts (employee_id, account_number) VALUES
-- SBI handled by employee 102
(102, 'SBI10001'),(102, 'SBI10002'),(102, 'SBI10003'),(102, 'SBI10004'),(102, 'SBI10005'),
(102, 'SBI10006'),

-- HDFC handled by employee 104
(104, 'HDFC20001'),(104, 'HDFC20002'),(104, 'HDFC20003'),(104, 'HDFC20004'),(104, 'HDFC20005'),
(104, 'HDFC20006'),

-- ICICI handled by employee 106
(106, 'ICICI30001'),(106, 'ICICI30002'),(106, 'ICICI30003'),(106, 'ICICI30004'),(106, 'ICICI30005'),
(106, 'ICICI30006'),

-- AXIS handled by employee 108
(108, 'AXIS40001'),(108, 'AXIS40002'),(108, 'AXIS40003'),(108, 'AXIS40004'),

-- PNB handled by employee 110
(110, 'PNB50001'),(110, 'PNB50002'),(110, 'PNB50003');

SELECT * FROM EmployeeAccounts;

-- ================================
-- CARDS (every customer has at least one card; some have multiples)
-- Columns: customer_id, card_type, card_number, expiry_date
-- ================================
INSERT INTO Cards (customer_id, card_type, card_number, expiry_date) VALUES
(1, 'Debit', '4111111111111001', '2028-05-31'),
(1, 'Credit', '5111111111111001', '2029-06-30'),
(2, 'Debit', '4111111111111002', '2027-03-31'),
(2, 'ATM', '6111111111111002', '2030-01-15'),
(3, 'Credit', '5111111111111003', '2028-07-20'),
(3, 'Debit', '4111111111111003', '2029-02-28'),
(4, 'ATM', '6111111111111004', '2031-11-10'),
(5, 'Credit', '5111111111111005', '2028-09-25'),
(6, 'Debit', '4111111111111006', '2029-04-12'),
(7, 'Credit', '5111111111111007', '2027-08-30'),
(8, 'ATM', '6111111111111008', '2030-10-18'),
(9, 'Debit', '4111111111111009', '2029-06-22'),
(10, 'Credit', '5111111111111010', '2028-12-01'),
(10, 'ATM', '6111111111111010', '2031-05-15'),
(11, 'Debit', '4111111111111011', '2027-07-21'),
(12, 'Credit', '5111111111111012', '2029-05-11'),
(13, 'Debit', '4111111111111013', '2030-09-13'),
(14, 'ATM', '6111111111111014', '2029-01-10'),
(15, 'Credit', '5111111111111015', '2028-04-15'),
(16, 'Debit', '4111111111111016', '2031-03-01'),
(17, 'Credit', '5111111111111017', '2029-07-18'),
(18, 'ATM', '6111111111111018', '2027-12-31'),
(19, 'Debit', '4111111111111019', '2028-11-20'),
(20, 'Credit', '5111111111111020', '2029-06-10'),
(21, 'Debit', '4111111111111021', '2030-08-08'),
(22, 'ATM', '6111111111111022', '2028-02-28'),
(23, 'Debit', '4111111111111023', '2029-09-19'),
(24, 'Credit', '5111111111111024', '2027-04-09'),
(25, 'Debit', '4111111111111025', '2029-05-25');

SELECT * FROM Cards;

