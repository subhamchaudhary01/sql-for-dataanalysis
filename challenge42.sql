-- SQL 50 - Product price at given date
/*
  (product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
Initially, all products have price 10.
Write a solution to find the prices of all products on the date 2019-08-16.
Return the result table in any order.
*/

SELECT 
    p.product_id,
    COALESCE(t.new_price, 10) AS price
FROM (
        SELECT DISTINCT product_id 
        FROM Products
     ) p
LEFT JOIN (
        SELECT product_id, new_price
        FROM Products
        WHERE (product_id, change_date) IN (
                SELECT 
                    product_id,
                    MAX(change_date)
                FROM Products
                WHERE change_date <= '2019-08-16'
                GROUP BY product_id
        )
     ) t
ON p.product_id = t.product_id;