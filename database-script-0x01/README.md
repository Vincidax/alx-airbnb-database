# 🏗️ Airbnb Clone Database Schema

## 🎯 Objective
This directory contains SQL statements that define the schema for the Airbnb clone project. The schema is designed based on normalization principles and includes appropriate constraints and indexes.

---

## 📦 Tables and Relationships

### 1. User
- Stores user account information.
- Fields: user_id, name, email, password, role.
- Constraints: Unique email, role must be guest/host/admin.

### 2. Property
- Each property belongs to a host (User).
- Fields: property_id, host_id, name, description, location, price.
- Foreign Key: host_id → User(user_id)

### 3. Booking
- Represents a reservation by a user on a property.
- Fields: booking_id, property_id, user_id, dates, status.
- Foreign Keys: property_id → Property(property_id), user_id → User(user_id)

### 4. Payment
- Tied to a booking.
- Fields: payment_id, booking_id, amount, method.
- Foreign Key: booking_id → Booking(booking_id)

### 5. Review
- A user can leave a review on a property.
- Fields: review_id, property_id, user_id, rating, comment.
- Constraints: Rating must be between 1 and 5.

### 6. Message
- Represents messages between users.
- Fields: message_id, sender_id, recipient_id, message_body.
- Foreign Keys: sender_id, recipient_id → User(user_id)

---

## 🗂️ Indexing

- Indexed: `email`, `property_id`, `booking_id`, `host_id`, `user_id`
- Primary keys are indexed by default.

---

## 💡 Usage

To initialize the schema in PostgreSQL or MySQL:

```bash
psql -U your_user -d your_db -f schema.sql
