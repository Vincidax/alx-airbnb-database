-- Index on user_id in bookings table for faster lookups by user
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);

-- Composite index on (user_id, booking_date DESC) for filtering and ordering
CREATE INDEX IF NOT EXISTS idx_bookings_user_id_booking_date ON bookings(user_id, booking_date DESC);

-- Index on property_id in bookings table for fast property-related queries
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);

-- Index on email in users table for quick user lookups by email
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);

-- Index on host_id in properties table to speed up joins/filters by host
CREATE INDEX IF NOT EXISTS idx_properties_host_id ON properties(host_id);

-- Optional: Index on location in properties table if filtering/searching by location
CREATE INDEX IF NOT EXISTS idx_properties_location ON properties(location);
