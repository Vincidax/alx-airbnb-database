## Files

- `joins_queries.sql`: Contains SQL queries using INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.
- `README.md`: This documentation file.

# Complex SQL Joins

This project demonstrates the use of INNER JOIN, LEFT JOIN, and FULL OUTER JOIN in SQL to retrieve related data from multiple tables.

## Aggregations and Window Functions

This script demonstrates the use of SQL aggregation and window functions to analyze booking data in the Airbnb database.

- The **first query** calculates the total number of bookings made by each user using the `COUNT` function combined with a `GROUP BY` clause. This helps identify how active each user is in making bookings.

- The **second query** ranks properties based on the total number of bookings they have received. It uses the `RANK()` window function alongside aggregation to assign ranks to properties, with the highest booked properties receiving the top ranks. This provides insight into the most popular listings.

Both queries serve as examples of how to perform grouping and ranking operations to extract meaningful patterns from booking data.

## Author
Vincent Dushime
