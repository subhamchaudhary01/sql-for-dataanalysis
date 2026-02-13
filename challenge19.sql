-- SQL 50 - Queries Quality and Percentage
/*
  Write a solution to find each query_name, the quality and poor_query_percentage.
  Both quality and poor_query_percentage should be rounded to 2 decimal places.
  Return the result table in any order.
*/

SELECT
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND(100.0 * SUM(rating < 3) / COUNT(*), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name
ORDER BY query_name;