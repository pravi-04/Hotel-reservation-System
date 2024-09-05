INSERT INTO Rooms (RoomID, RoomNumber, RoomType, Price, Capacity, Availability) 
VALUES 
    (1, '101', 'Standard', 100.00, 2, TRUE),
    (2, '102', 'Deluxe', 150.00, 4, TRUE),
    (3, '103', 'Suite', 200.00, 3, FALSE);

INSERT INTO Rooms (RoomID, RoomNumber, RoomType, Price, Capacity, Availability) 
VALUES 
    (4, '104', 'Standard', 100.00, 2, TRUE);
    
INSERT INTO Guests (GuestID, FirstName, LastName, Email, Phone) 
VALUES 
    (1, 'Arun', 'Kumar', 'arun@gmail.com', '1234567890'),
    (2, 'Sathish', 'Kumar', 'sathish@gmail.com', '9876543210');
    
INSERT INTO Reservations (ReservationID, RoomID, GuestID, CheckInDate, CheckOutDate, TotalAmount) 
VALUES 
    (1, 1, 1, '2024-05-15', '2024-05-20', 500.00),
    (2, 2, 2, '2024-06-10', '2024-06-15', 750.00);
    
DELETE FROM Reservations WHERE ReservationID = 2 AND TotalAmount = 750.00;
select * from Reservations;


INSERT INTO Bookings (BookingID, RoomID, CheckInDate, CheckOutDate, TotalAmount, IsConfirmed) 
VALUES 
    (1, 3, '2024-07-01', '2024-07-05', 800.00, TRUE),
    (2, 1, '2024-08-15', '2024-08-20', 600.00, FALSE);


    
INSERT INTO Payments (PaymentID, BookingID, Amount, PaymentDate, PaymentMethod) 
VALUES 
    (1, 1, 500.00, '2024-06-20', 'Credit Card'),
    (2, 2, 300.00, '2024-08-01', 'Cash');
