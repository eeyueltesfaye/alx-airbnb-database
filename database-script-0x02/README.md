# Sample Data for Airbnb Database

## Overview
This directory contains SQL scripts for populating the Airbnb database schema with sample data. The data reflects typical usage scenarios, including multiple users, properties, bookings, payments, reviews, and messages.

## Sample Data Insertion

### Tables Populated
1. **User**: Four users with various roles (hosts and guests).
2. **Property**: Three properties hosted by users.
3. **Booking**: Three bookings made by users for different properties.
4. **Payment**: Two payments corresponding to confirmed bookings.
5. **Review**: Two reviews left by users for properties they stayed in.
6. **Message**: Two messages exchanged between users.

### Usage
To populate the database, run the SQL commands in `seed.sql` against your SQL database after creating the schema defined in `schema.sql`.