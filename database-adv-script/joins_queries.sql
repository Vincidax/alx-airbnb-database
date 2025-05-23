-- ========================================
-- File: joins_queries.sql
-- Description: SQL queries demonstrating
-- INNER JOIN, LEFT JOIN, and FULL OUTER JOIN
-- Author: Vincent Dushime
-- ========================================

-- ========================================
-- 1. INNER JOIN
-- Retrieve all bookings and the respective users who made those bookings
-- ========================================
SELECT 
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.firstname,
    users.lastname,
    users.email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;

-- ========================================
-- 2. LEFT JOIN
-- Retrieve all properties and their reviews, including properties that have no reviews
-- ========================================
SELECT 
    properties.id AS property_id,
    properties.title,
    properties.location,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id;

-- ========================================
-- 3. FULL OUTER JOIN (PostgreSQL syntax)
-- Retrieve all users and all bookings, even if unmatched
-- ========================================
SELECT 
    users.id AS user_id,
    users.firstname,
    users.lastname,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.id = bookings.user_id;
