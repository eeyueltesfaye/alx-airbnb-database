# Optimization Report

## Objective
Refactor complex queries to improve performance.

## Initial Query
```sql
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    User.user_id,
    User.first_name,
    User.last_name,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_date
FROM 
    Booking
JOIN 
    User ON Booking.user_id = User.user_id
JOIN 
    Property ON Booking.property_id = Property.property_id
JOIN 
    Payment ON Booking.booking_id = Payment.booking_id;