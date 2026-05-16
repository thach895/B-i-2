CREATE DATABASE IF NOT EXISTS RikkeiClinicDB;
USE RikkeiClinicDB;

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    appointment_date DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL
);

INSERT INTO Appointments
VALUES
(101, 'Nguyen Van A', '2026-06-20 08:00:00', 'Pending'),
(102, 'Tran Thi B', '2026-06-21 09:30:00', 'Completed'),
(103, 'Le Van C', '2026-06-22 14:00:00', 'Cancelled'),
(104, 'Pham Thi D', '2026-07-15 10:00:00', 'Pending');

DELIMITER $$

CREATE TRIGGER PreventStatusRevert
BEFORE UPDATE
ON Appointments
FOR EACH ROW
BEGIN
    IF NEW.status = 'Completed' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot update completed appointment!';
    END IF;
END $$

DELIMITER ;

UPDATE Appointments
SET status = 'Completed'
WHERE appointment_id = 104;

DROP TRIGGER IF EXISTS PreventStatusRevert;

DELIMITER $$

CREATE TRIGGER PreventStatusRevert
BEFORE UPDATE
ON Appointments
FOR EACH ROW
BEGIN
    IF OLD.status = 'Completed' AND NEW.status <> 'Completed' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Completed appointments cannot be changed!';
    END IF;
END $$

DELIMITER ;