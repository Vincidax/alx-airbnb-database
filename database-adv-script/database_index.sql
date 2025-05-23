-- Create indexes to optimize queries

-- Index on bookings for filtering by user_id and ordering by booking_date
CREATE INDEX idx_bookings_user_id_booking_date ON bookings(user_id, booking_date DESC);

-- Index on users for email-based lookups
CREATE INDEX idx_users_email ON users(email);

-- Index on properties for owner_id-based lookups
CREATE INDEX idx_properties_owner_id ON properties(owner_id);

-- Performance Measurement using EXPLAIN ANALYZE

-- Before adding index (comment this out after index is added)
-- EXPLAIN ANALYZE
-- SELECT *
-- FROM bookings
-- WHERE user_id = 123
-- ORDER BY booking_date DESC
-- LIMIT 10;

-- After adding index
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 123
ORDER BY booking_date DESC
LIMIT 10;
