-- Drop the existing Booking table if it exists
DROP TABLE IF EXISTS Booking;

-- Create the partitioned Booking table
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    payment_id INT,
    amount DECIMAL(10, 2)
) PARTITION BY RANGE (start_date);

-- Create partitions for the Booking table
CREATE TABLE Booking_2023 PARTITION OF Booking FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
CREATE TABLE Booking_2024 PARTITION OF Booking FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
-- Add more partitions as necessary

-- Sample query to test performance on the partitioned table
EXPLAIN ANALYZE 
SELECT * FROM Booking 
WHERE start_date >= '2023-01-01' AND start_date < '2023-12-31';

-- Insert sample data into the partitioned table for testing (optional)
INSERT INTO Booking (user_id, property_id, start_date, end_date, payment_id, amount)
VALUES (1, 101, '2023-05-01', '2023-05-05', 1, 100.00),
       (2, 102, '2024-06-15', '2024-06-20', 2, 150.00);