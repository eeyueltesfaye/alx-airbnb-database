# Performance Monitoring and Optimization Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

## Monitoring Queries
The following queries were analyzed using `EXPLAIN ANALYZE`:

### Query 1: Fetch all bookings for a specific user
```sql
EXPLAIN ANALYZE 
SELECT * FROM Booking 
WHERE user_id = 1;