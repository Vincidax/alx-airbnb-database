# Partitioning Performance Report

## Objective
To improve performance of queries on a large `bookings` table by implementing partitioning based on the `start_date` column.

## Partitioning Strategy
The `bookings` table was partitioned using **RANGE** partitioning by `start_date`, with separate partitions for each year (2023, 2024, 2025).

## Test Query
```sql
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';

## Summary
Partitioning by start_date significantly reduced the number of rows scanned by allowing PostgreSQL to use partition pruning, resulting in faster execution times and improved efficiency for date-range queries.
