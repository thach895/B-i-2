CREATE DATABASE TrainingCenter;
USE TrainingCenter;

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    amount DECIMAL(12,2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students (student_name)
VALUES
('Nguyễn Văn A'),
('Trần Thị B'),
('Lê Văn C'),
('Phạm Thị D');

INSERT INTO Payments (student_id, amount, payment_date)
VALUES
(1, 4000000, '2026-01-10'),
(1, 3500000, '2026-02-15'),
(1, 4500000, '2026-03-20'),
(2, 2000000, '2026-01-12'),
(2, 1500000, '2026-02-18'),
(3, 6000000, '2026-01-25'),
(3, 7000000, '2026-03-10'),
(4, 1000000, '2026-04-01');

SELECT SUM(total_spent)
FROM (
    SELECT student_id, SUM(amount) AS total_spent
    FROM Payments
    GROUP BY student_id
    HAVING SUM(amount) > 10000000
) AS vip_student;