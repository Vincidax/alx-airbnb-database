# 📐 Database Normalization

## Objective:
To ensure the Airbnb clone database is normalized to **Third Normal Form (3NF)** to reduce redundancy and improve data integrity.

---

## 🔍 1. First Normal Form (1NF)
- **Rule**: All tables must have atomic (indivisible) values and unique rows.
- ✅ All attributes in each table contain atomic values (e.g., no arrays or multiple values in a single column).
- ✅ Each table has a primary key to uniquely identify rows.

---

## 🔄 2. Second Normal Form (2NF)
- **Rule**: Must be in 1NF and all non-key attributes must be fully functionally dependent on the entire primary key.
- ✅ No partial dependencies exist. All non-key attributes depend on the whole primary key:
  - In `Booking`, attributes like `start_date`, `end_date`, and `status` depend entirely on `booking_id`.
  - In `Payment`, `amount` and `payment_method` depend fully on `payment_id`.

---

## 🧠 3. Third Normal Form (3NF)
- **Rule**: Must be in 2NF and all attributes must depend only on the primary key (no transitive dependencies).
- ✅ No transitive dependencies:
  - In `User`, `email` is not dependent on `first_name` or `last_name` but directly on `user_id`.
  - In `Property`, `location` and `pricepernight` are attributes of the property itself and not derivable from another table's non-key attribute.
  - Messages are clearly separated into `sender_id`, `recipient_id`, and `message_body`, all dependent on `message_id`.

---

## ✅ Conclusion
The current schema satisfies **3NF**:
- All tables have atomic columns.
- No partial dependencies exist.
- All non-key attributes directly depend on the primary key with no transitive dependencies.

This normalization helps:
- Minimize redundancy
- Prevent update anomalies
- Improve overall database consistency
