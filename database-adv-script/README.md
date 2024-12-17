# SQL Joins Queries

## Overview
This repository contains SQL scripts demonstrating the use of various types of joins in SQL. The queries showcase how to retrieve data from multiple tables while handling different relationships between them.

## Queries

### Query 1: INNER JOIN
```sql
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    User.user_id,
    User.first_name,
    User.last_name
FROM 
    Booking
INNER JOIN 
    User ON Booking.user_id = User.user_id;