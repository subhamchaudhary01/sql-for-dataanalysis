-- SQL 50 - Product Sales Analysis III
/*
  Write a solution to find all sales that occurred in the first year each product was sold.
  For each product_id, identify the earliest year it appears in the Sales table.
  Return all sales entries for that product in that year.
  Return a table with the following columns: product_id, first_year, quantity, and price.
*/

SELECT 
    product_id,
    year AS first_year,
    quantity,
    price
FROM (
        SELECT *,
               RANK() OVER (PARTITION BY product_id ORDER BY year) AS rnk
        FROM Sales
     ) t
WHERE rnk = 1;