# Normalization Process for Airbnb Database

## Objective
To apply normalization principles to ensure the database is in the Third Normal Form (3NF).

## Review of Current Schema
The current schema includes the following entities:
1. **User**
2. **Property**
3. **Booking**
4. **Payment**
5. **Review**
6. **Message**

## Normalization Steps

### Step 1: Ensure 2NF
- Each table has a primary key.
- All non-key attributes are fully functionally dependent on the primary key.
- No composite keys are used, so all tables meet the criteria for 2NF.

### Step 2: Ensure 3NF
- Checked for transitive dependencies.
- All non-key attributes are dependent only on the primary key.
- No attributes depend on non-key attributes.

### Findings
- **User Table**: No redundancies or transitive dependencies.
- **Property Table**: No redundancies or transitive dependencies.
- **Booking Table**: No redundancies or transitive dependencies.
- **Payment Table**: No redundancies or transitive dependencies.
- **Review Table**: No redundancies or transitive dependencies.
- **Message Table**: No redundancies or transitive dependencies.

## Conclusion
The current database schema is in Third Normal Form (3NF). All tables are properly structured with no redundancies or transitive dependencies. Therefore, no adjustments were necessary to achieve 3NF.