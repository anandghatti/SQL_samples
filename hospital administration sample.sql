CREATE DATABASE HospitalAdministration;
USE HospitalAdministration;

-- Create Students Table

CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);

-- Create Doctors Table
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    RoomNumber VARCHAR(10) NOT NULL,
    LandlineNumber VARCHAR(15) NOT NULL
);

-- Create MedicalHistory Table
CREATE TABLE MedicalHistory (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    DoctorID INT NOT NULL,
    VisitDate DATE NOT NULL,
    VisitTime TIME NOT NULL,
    Diagnosis VARCHAR(255) NOT NULL,
    Treatment VARCHAR(255),
    PreviousAppointment DATE,
    PreviousAppointmentTime TIME,
    NextAppointment DATE,
    NextAppointmentTime TIME,
    Notes TEXT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) ON DELETE CASCADE
);

-- Insert Sample Students 
INSERT INTO Students (FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber, Email) VALUES
('John', 'Doe', '2005-06-15', 'Male', '123 Main St', '555-1234', 'john.doe@example.com'),
('Jane', 'Smith', '2004-09-22', 'Female', '456 Oak Ave', '555-5678', 'jane.smith@example.com'),
('Liam', 'Brown', '2006-01-05', 'Male', '789 Pine Rd', '555-8765', 'liam.brown@example.com'),
('Emma', 'Davis', '2005-11-11', 'Female', '321 Maple St', '555-4321', 'emma.davis@example.com'),
('Noah', 'Wilson', '2006-07-19', 'Male', '654 Elm St', '555-6789', 'noah.wilson@example.com'),
('Olivia', 'Taylor', '2004-03-25', 'Female', '987 Birch Rd', '555-2468', 'olivia.taylor@example.com'),
('Ava', 'Johnson', '2005-05-30', 'Female', '246 Cedar Ln', '555-1357', 'ava.johnson@example.com'),
('Ethan', 'Lee', '2006-09-10', 'Male', '135 Walnut St', '555-9753', 'ethan.lee@example.com'),
('Sophia', 'Martin', '2004-12-02', 'Female', '864 Chestnut Rd', '555-8642', 'sophia.martin@example.com'),
('Mason', 'Clark', '2005-04-18', 'Male', '753 Poplar Ave', '555-1597', 'mason.clark@example.com'),
('Isabella', 'Hall', '2006-08-23', 'Female', '951 Aspen St', '555-7531', 'isabella.hall@example.com'),
('Lucas', 'Allen', '2005-02-14', 'Male', '147 Cypress Ln', '555-8520', 'lucas.allen@example.com'),
('Mia', 'Young', '2004-10-05', 'Female', '369 Palm Rd', '555-3698', 'mia.young@example.com'),
('Elijah', 'King', '2006-06-06', 'Male', '258 Redwood St', '555-2580', 'elijah.king@example.com'),
('Amelia', 'Wright', '2005-09-09', 'Female', '852 Magnolia Rd', '555-1478', 'amelia.wright@example.com'),
('James', 'Scott', '2004-01-20', 'Male', '159 Fir St', '555-6543', 'james.scott@example.com'),
('Charlotte', 'Green', '2006-03-17', 'Female', '753 Willow Rd', '555-7539', 'charlotte.green@example.com'),
('Benjamin', 'Adams', '2005-07-07', 'Male', '357 Spruce Ave', '555-9517', 'benjamin.adams@example.com'),
('Harper', 'Baker', '2006-05-12', 'Female', '258 Sycamore Ln', '555-3571', 'harper.baker@example.com'),
('Henry', 'Nelson', '2005-08-01', 'Male', '159 Alder St', '555-2589', 'henry.nelson@example.com'),
('Evelyn', 'Carter', '2004-02-02', 'Female', '951 Beech Rd', '555-3691', 'evelyn.carter@example.com'),
('Alexander', 'Mitchell', '2006-04-28', 'Male', '654 Hickory St', '555-4562', 'alex.mitchell@example.com'),
('Abigail', 'Perez', '2005-12-21', 'Female', '753 Juniper Rd', '555-1479', 'abigail.perez@example.com'),
('Daniel', 'Roberts', '2006-11-13', 'Male', '852 Olive St', '555-2581', 'daniel.roberts@example.com'),
('Ella', 'Turner', '2005-10-08', 'Female', '357 Palm Rd', '555-7538', 'ella.turner@example.com');

-- Insert Sample Doctors
INSERT INTO Doctors (DoctorName, Specialization, RoomNumber, LandlineNumber) VALUES
('Dr. Adams', 'General Physician', '101', '111-1111'),
('Dr. Baker', 'Orthopedic', '102', '222-2222'),
('Dr. Carter', 'Pediatrician', '103', '333-3333'),
('Dr. Davis', 'Cardiologist', '104', '444-4444'),
('Dr. Evans', 'Dermatologist', '105', '555-5555');

-- Insert Sample Medical History (10 entries for demo)
-- Notice: Trigger will auto-fill Previous/Next appointments

INSERT INTO MedicalHistory (StudentID, DoctorID, VisitDate, VisitTime, Diagnosis, Treatment, NextAppointment, NextAppointmentTime, Notes) VALUES
(1, 1, '2023-01-10', '10:30:00', 'Flu', 'Rest and hydration', '2023-01-17', '10:30:00', 'Follow-up if symptoms persist'),
(2, 2, '2023-02-15', '11:00:00', 'Sprained ankle', 'Ice and elevation', '2023-02-22', '11:00:00', 'Wear a brace for 2 weeks'),
(3, 3, '2023-03-05', '09:00:00', 'Fever', 'Paracetamol prescribed', NULL, NULL, 'Monitor temperature daily'),
(4, 4, '2023-03-20', '14:00:00', 'Chest pain', 'ECG done', NULL, NULL, 'Referred for further tests'),
(5, 5, '2023-04-01', '13:30:00', 'Skin rash', 'Ointment prescribed', NULL, NULL, 'Avoid allergens'),
(1, 1, '2023-05-12', '10:45:00', 'Cold', 'Vitamin C supplements', NULL, NULL, 'Increase fluid intake'),
(2, 2, '2023-06-01', '11:15:00', 'Knee pain', 'Physiotherapy advised', NULL, NULL, 'Return after 1 month'),
(6, 3, '2023-07-10', '09:30:00', 'Check-up', 'All normal', NULL, NULL, 'Routine annual checkup'),
(7, 4, '2023-08-18', '15:00:00', 'Palpitations', 'Medication started', NULL, NULL, 'Avoid caffeine'),
(8, 5, '2023-09-22', '13:00:00', 'Acne', 'Prescribed cream', NULL, NULL, 'Use daily at night');

-- Trigger for Auto-Filling Appointments
DELIMITER $$

CREATE TRIGGER trg_fill_appointments
BEFORE INSERT ON MedicalHistory
FOR EACH ROW
BEGIN
    DECLARE lastDate DATE;
    DECLARE lastTime TIME;

    -- Step A: Get the most recent appointment for this student
    SELECT VisitDate, VisitTime
    INTO lastDate, lastTime
    FROM MedicalHistory
    WHERE StudentID = NEW.StudentID
    ORDER BY VisitDate DESC, VisitTime DESC
    LIMIT 1;

    -- Step B: If a previous appointment exists, set it
    IF lastDate IS NOT NULL THEN
        SET NEW.PreviousAppointment = lastDate;
        SET NEW.PreviousAppointmentTime = lastTime;
    ELSE
        -- If no previous appointment exists, set it as current
        SET NEW.PreviousAppointment = NEW.VisitDate;
        SET NEW.PreviousAppointmentTime = NEW.VisitTime;
    END IF;

    -- Step C: Ensure NextAppointment is always filled
    IF NEW.NextAppointment IS NULL THEN
        SET NEW.NextAppointment = DATE_ADD(NEW.VisitDate, INTERVAL 7 DAY);
    END IF;

    IF NEW.NextAppointmentTime IS NULL THEN
        SET NEW.NextAppointmentTime = NEW.VisitTime;
    END IF;

END$$

DELIMITER ;

-- ====================================================
-- STEP 9: Useful Reports & Queries
-- ====================================================

-- All Students
SELECT * FROM Students;

-- All Doctors
SELECT * FROM Doctors;

-- All Medical Records
SELECT * FROM MedicalHistory;

-- Group by Diagnosis (how many students had same problem)
SELECT Diagnosis, COUNT(*) AS TotalCases
FROM MedicalHistory
GROUP BY Diagnosis;

-- Group by Doctor (how many students each doctor treated)
SELECT d.DoctorName, d.Specialization, COUNT(m.RecordID) AS PatientsSeen
FROM Doctors d
LEFT JOIN MedicalHistory m ON d.DoctorID = m.DoctorID
GROUP BY d.DoctorID;

-- Students with multiple visits
SELECT s.StudentID, s.FirstName, s.LastName, COUNT(m.RecordID) AS VisitCount
FROM Students s
JOIN MedicalHistory m ON s.StudentID = m.StudentID
GROUP BY s.StudentID
HAVING VisitCount > 1;

-- Doctor Report View (joins doctors + patients)
CREATE OR REPLACE VIEW DoctorReport AS
SELECT d.DoctorName, d.Specialization, d.RoomNumber, d.LandlineNumber,
       s.FirstName, s.LastName, m.VisitDate, m.VisitTime, m.Diagnosis, m.Treatment
FROM Doctors d
JOIN MedicalHistory m ON d.DoctorID = m.DoctorID
JOIN Students s ON m.StudentID = s.StudentID;

-- View all doctor reports
SELECT * FROM DoctorReport;
