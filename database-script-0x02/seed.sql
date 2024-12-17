-- Insert sample data into User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
(UUID(), 'Alice', 'Smith', 'alice@example.com', 'hashed_password_1', '123-456-7890', 'host', NOW()),
(UUID(), 'Bob', 'Johnson', 'bob@example.com', 'hashed_password_2', '987-654-3210', 'guest', NOW()),
(UUID(), 'Charlie', 'Brown', 'charlie@example.com', 'hashed_password_3', '555-555-5555', 'guest', NOW()),
(UUID(), 'David', 'Wilson', 'david@example.com', 'hashed_password_4', '444-444-4444', 'host', NOW());

-- Insert sample data into Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
(UUID(), (SELECT user_id FROM User WHERE email = 'alice@example.com'), 'Cozy Cottage', 'A cozy cottage in the woods.', '123 Forest Lane', 100.00, NOW(), NOW()),
(UUID(), (SELECT user_id FROM User WHERE email = 'david@example.com'), 'Beach House', 'A beautiful beach house with ocean views.', '456 Ocean Drive', 250.00, NOW(), NOW()),
(UUID(), (SELECT user_id FROM User WHERE email = 'alice@example.com'), 'Mountain Cabin', 'A rustic cabin in the mountains.', '789 Mountain Road', 150.00, NOW(), NOW());

-- Insert sample data into Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
(UUID(), (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'), (SELECT user_id FROM User WHERE email = 'bob@example.com'), '2024-01-10', '2024-01-15', 500.00, 'confirmed', NOW()),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Beach House'), (SELECT user_id FROM User WHERE email = 'charlie@example.com'), '2024-02-20', '2024-02-25', 1250.00, 'pending', NOW()),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Mountain Cabin'), (SELECT user_id FROM User WHERE email = 'alice@example.com'), '2024-03-01', '2024-03-05', 750.00, 'confirmed', NOW());

-- Insert sample data into Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
(UUID(), (SELECT booking_id FROM Booking WHERE status = 'confirmed' AND user_id = (SELECT user_id FROM User WHERE email = 'bob@example.com')), 500.00, NOW(), 'credit_card'),
(UUID(), (SELECT booking_id FROM Booking WHERE status = 'pending' AND user_id = (SELECT user_id FROM User WHERE email = 'charlie@example.com')), 1250.00, NOW(), 'paypal');

-- Insert sample data into Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
(UUID(), (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 5, 'Absolutely loved this place!', NOW()),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Beach House'), (SELECT user_id FROM User WHERE email = 'charlie@example.com'), 4, 'Great view but a bit noisy.', NOW());

-- Insert sample data into Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
(UUID(), (SELECT user_id FROM User WHERE email = 'bob@example.com'), (SELECT user_id FROM User WHERE email = 'alice@example.com'), 'Hi Alice, can you tell me more about your cottage?', NOW()),
(UUID(), (SELECT user_id FROM User WHERE email = 'alice@example.com'), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 'Sure! It’s very cozy and perfect for a weekend getaway!', NOW());