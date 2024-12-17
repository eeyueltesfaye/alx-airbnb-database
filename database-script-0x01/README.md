# Airbnb Database Schema

## Overview
This repository contains SQL scripts to define the schema for the Airbnb database. The schema includes tables for Users, Properties, Bookings, Payments, Reviews, and Messages.

## Schema Definition

### Tables
1. **User**: Contains information about users, including their roles.
2. **Property**: Contains details about properties available for booking.
3. **Booking**: Links users to properties for specific dates and status.
4. **Payment**: Records payment transactions associated with bookings.
5. **Review**: Allows users to leave feedback on properties.
6. **Message**: Facilitates communication between users.

### Constraints and Indexes
- Each table has a primary key defined.
- Foreign keys establish relationships between tables.
- Unique constraints are applied to the email field in the User table.
- Indexes are created on frequently queried columns for optimal performance.

## Usage
To create the database schema, run the SQL commands in `schema.sql` against your SQL database.