
-- Initial complex query retrieving booking with user, property, and payment details
-- Performance optimization to follow

-- Before optimization
EXPLAIN ANALYZE
SELECT b.id AS booking_id, b.booking_date, u.id AS user_id, u.name AS user_name,
       p.id AS property_id, p.name AS property_name, pay.id AS payment_id, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;
