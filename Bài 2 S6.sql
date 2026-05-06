CREATE DATABASE HotelDB;
USE HotelDB;

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT,
    room_name VARCHAR(100),
    price_per_night DECIMAL(10,2)
);

INSERT INTO Rooms (hotel_id, room_name, price_per_night) VALUES
(1, 'Standard', 50),
(1, 'Deluxe', 80),
(1, 'Suite', 120),
(2, 'Standard', 40),
(2, 'Deluxe', 70),
(3, 'Single', 30),
(3, 'Double', 60);



SELECT hotel_id,MIN(price_per_night)
FROM Rooms
GROUP BY hotel_id;