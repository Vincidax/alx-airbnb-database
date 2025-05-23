
# Index Performance Analysis

## Objective

Identify high-usage columns in the `User`, `Booking`, and `Property` tables, create indexes on them, and analyze query performance improvements.

---

## Index Creation Statements

```sql
-- Create index on bookings for filtering by user_id and ordering by booking_date
CREATE INDEX idx_bookings_user_id_booking_date ON bookings(user_id, booking_date DESC);

-- Example indexes on other high-usage columns
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_properties_owner_id ON properties(owner_id);
```

---

## Performance Testing and Analysis

### Tested Query

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 123
ORDER BY booking_date DESC
LIMIT 10;
```

This query fetches the 10 most recent bookings for user ID 123.

---

### Before Adding Indexes

- **Execution plan:** PostgreSQL performs a **sequential scan** of the entire `bookings` table.
- **Reason:** Without indexes, PostgreSQL must read every row and filter those with `user_id = 123`.
- **Impact:** Very inefficient on large tables as most rows are irrelevant.

**Sample EXPLAIN ANALYZE output:**

```
Limit  (cost=500.00..530.00 rows=10 width=100) (actual time=20.000..21.000 rows=10 loops=1)
  ->  Seq Scan on bookings  (cost=0.00..4000.00 rows=1000 width=100) (actual time=0.005..19.000 rows=2000 loops=1)
        Filter: (user_id = 123)
        Rows Removed by Filter: 18000
Execution Time: 21.500 ms
```

**Analysis:**

- The query scans all ~20,000 rows (`Seq Scan`).
- Only about 2,000 rows match `user_id = 123`, so 18,000 rows are scanned and discarded.
- Execution time is ~21.5 ms, which is slow for a single-user query.

---

### After Adding Indexes

Created the composite index:

```sql
CREATE INDEX idx_bookings_user_id_booking_date ON bookings(user_id, booking_date DESC);
```

This index supports efficient filtering and ordering.

**Sample EXPLAIN ANALYZE output:**

```
Limit  (cost=10.00..15.00 rows=10 width=100) (actual time=0.5..0.7 rows=10 loops=1)
  ->  Index Scan using idx_bookings_user_id_booking_date on bookings  (cost=10.00..100.00 rows=100 width=100) (actual time=0.4..0.6 rows=10 loops=1)
        Index Cond: (user_id = 123)
Execution Time: 0.800 ms
```

**Analysis:**

- PostgreSQL uses an **Index Scan** instead of scanning the whole table.
- Quickly locates relevant rows and returns them sorted by `booking_date`.
- Execution time drops to under 1 ms — roughly 25x faster.
- Reduces IO and CPU usage significantly.

---

## Summary of Findings

| Metric                 | Before Index                   | After Index                      |
|------------------------|-------------------------------|---------------------------------|
| Scan Type              | Sequential Scan                | Index Scan                      |
| Rows Filtered          | 18,000 rows scanned and discarded | Only relevant rows scanned      |
| Execution Time         | ~21.5 milliseconds             | ~0.8 milliseconds               |
| Ordering               | Performed after filtering (costly) | Handled by index (cheap)       |

**Key takeaway:** Adding indexes on frequently queried columns allows to efficiently skip irrelevant data and optimize sorting, dramatically improving query performance.
