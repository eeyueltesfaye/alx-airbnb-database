-- Create the User table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR,
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX (email)  -- Index on email for faster lookups
);

-- Create the Property table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID,
    name VARCHAR NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR NOT NULL,
    pricepernight DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES User(user_id) ON DELETE CASCADE,
    INDEX (host_id)  -- Index on host_id for faster lookups
);

-- Create the Booking table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID,
    user_id UUID,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    INDEX (property_id),  -- Index on property_id for faster lookups
    INDEX (user_id)       -- Index on user_id for faster lookups
);

-- Create the Payment table
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID,
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE,
    INDEX (booking_id)  -- Index on booking_id for faster lookups
);

-- Create the Review table
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    property_id UUID,
    user_id UUID,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    INDEX (property_id),  -- Index on property_id for faster lookups
    INDEX (user_id)       -- Index on user_id for faster lookups
);

-- Create the Message table
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID,
    recipient_id UUID,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES User(user_id) ON DELETE CASCADE,
    INDEX (sender_id),  -- Index on sender_id for faster lookups
    INDEX (recipient_id) -- Index on recipient_id for faster lookups
);