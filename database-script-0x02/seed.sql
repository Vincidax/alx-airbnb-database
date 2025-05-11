-- seed.sql

-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('uuid-001', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '1234567890', 'host'),
('uuid-002', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '0987654321', 'guest'),
('uuid-003', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw_3', '1112223333', 'host');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES 
('prop-001', 'uuid-001', 'Sunny Loft', 'Modern loft in the city center.', 'New York, NY', 120.00),
('prop-002', 'uuid-003', 'Cozy Cottage', 'A quiet cottage in the woods.', 'Asheville, NC', 95.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
('book-001', 'prop-001', 'uuid-002', '2025-06-01', '2025-06-05', 480.00, 'confirmed'),
('book-002', 'prop-002', 'uuid-002', '2025-07-10', '2025-07-15', 475.00, 'pending');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES 
('pay-001', 'book-001', 480.00, 'credit_card'),
('pay-002', 'book-002', 475.00, 'paypal');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES 
('rev-001', 'prop-001', 'uuid-002', 5, 'Amazing place, very clean and well-located.'),
('rev-002', 'prop-002', 'uuid-002', 4, 'Nice and peaceful but a bit remote.');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES 
('msg-001', 'uuid-002', 'uuid-001', 'Hi Alice, is the loft available next weekend?'),
('msg-002', 'uuid-001', 'uuid-002', 'Yes! I just opened up the dates.');
