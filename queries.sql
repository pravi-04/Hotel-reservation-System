SELECT r.*, g.FirstName, g.LastName
FROM Reservations r
INNER JOIN Guests g ON r.GuestID = g.GuestID
WHERE g.GuestID = 2;

SELECT SUM(Amount) AS TotalEarned
FROM Payments;

UPDATE Bookings
SET IsConfirmed = TRUE
WHERE BookingID = 2;

SELECT RoomID, RoomNumber, RoomType, Price, Capacity
FROM Rooms
WHERE RoomID NOT IN (
  SELECT RoomID
  FROM Bookings
  WHERE (CheckInDate BETWEEN CURDATE() AND '2024-07-05')
    OR (CheckOutDate BETWEEN CURDATE() AND '2024-09-14')
)
ORDER BY Price;

SELECT RoomType, COUNT(*) AS BookingCount
FROM Rooms
GROUP BY RoomType
ORDER BY BookingCount DESC LIMIT 1;

ALTER TABLE Bookings ADD COLUMN GuestID INT;


INSERT INTO Bookings (BookingID, RoomID, GuestID, CheckInDate, CheckOutDate, TotalAmount, IsConfirmed) 
VALUES 
    (3, 2, 1, '2024-06-21', '2024-07-01', 800.00, TRUE),
    (4, 4, 2, '2024-08-11', '2024-08-28', 600.00, FALSE);



WITH RankedBookings AS (
  SELECT b.*,
         SUM(p.Amount) OVER (PARTITION BY b.BookingID) AS TotalRevenue
  FROM Bookings b
  LEFT JOIN Payments p ON b.BookingID = p.BookingID
)
SELECT BookingID, RoomID, GuestID, CheckInDate, CheckOutDate, TotalAmount, TotalRevenue
FROM RankedBookings
ORDER BY TotalRevenue DESC;

ALTER TABLE Guests ADD COLUMN PreviousEmail VARCHAR(100);
ALTER TABLE Guests ADD COLUMN CurrentEmail VARCHAR(100);


UPDATE Guests
SET PreviousEmail = CurrentEmail,
    CurrentEmail = 'sathish.18personal@gmail.com'
WHERE GuestID = 2;

SELECT GuestID, FirstName, LastName, CurrentEmail, PreviousEmail
FROM Guests
WHERE GuestID = 2;


WITH RoomAvailability AS (
    SELECT 
        RoomID,
        RoomNumber,
        RoomType,
        CASE
            WHEN Availability = true THEN 'Available'
            ELSE 'Booked'
        END AS AvailabilityStatus
    FROM Rooms
)
SELECT * FROM RoomAvailability;


WITH BookingDetails AS (
    SELECT 
        b.BookingID,
        b.RoomID,
        r.RoomNumber,
        b.CheckInDate,
        b.CheckOutDate,
        b.TotalAmount,
        g.FirstName,
        g.LastName,
        g.Email,
        g.Phone
    FROM Bookings b
    JOIN Rooms r ON b.RoomID = r.RoomID
    JOIN Guests g ON b.GuestID = g.GuestID
)
SELECT * FROM BookingDetails;

WITH RoomTypeBookings AS (
    SELECT 
        r.RoomType,
        COUNT(b.BookingID) AS NumBookings
    FROM Rooms r
    LEFT JOIN Bookings b ON r.RoomID = b.RoomID
    GROUP BY r.RoomType
)
SELECT * FROM RoomTypeBookings;

SELECT RoomID, RoomNumber, RoomType, Price, Capacity
   FROM Rooms
   WHERE Availability = TRUE;
   
 SELECT * FROM Reservations WHERE ReservationID = 2;










