# 🧪 Sample Data Seeding - Airbnb Clone

## 🎯 Objective
This directory contains SQL scripts that populate the Airbnb clone database with realistic sample data. This data helps with testing queries and demonstrating functionality.

---

## 🗃️ Included Entities

### 👤 Users
- 3 users with distinct roles (`host`, `guest`).
- Users have emails, hashed passwords, and phone numbers.

### 🏠 Properties
- Each property is linked to a host user.
- Includes name, description, location, and nightly price.

### 📅 Bookings
- Bookings associate guests with properties for specific dates.
- Includes status (`confirmed`, `pending`), and total price.

### 💳 Payments
- Tied to a booking.
- Includes payment method and amount.

### ⭐ Reviews
- Users can review properties they’ve stayed at.
- Includes rating and comment.

### 💬 Messages
- Users can send messages to one another.
- Contains sender, recipient, and message body.

---

## 📁 Files

- `seed.sql`: SQL insert statements to seed the database.
- `README.md`: This explanation file.

---

## 🚀 Usage

To seed your database:

```bash
psql -U your_user -d your_db -f seed.sql
