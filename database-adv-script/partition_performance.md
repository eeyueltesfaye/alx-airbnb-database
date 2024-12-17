# Partition Performance Report

## Objective
Implement table partitioning on the Booking table based on the start_date column to optimize query performance on large datasets.

## Implementation
The `Booking` table was recreated as a partitioned table based on the `start_date` column, with partitions created for the years 2023 and 2024. 

### SQL Commands Used
```sql
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