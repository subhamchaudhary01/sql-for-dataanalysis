-- SQL 50 - Product Sales Analysis I
/* Write a solution to report the product_name, year, and price for each sale_id in the Sales table */

SELECT
    p.product_name,
    s.year,
    s.price
FROM
    Sales s left join Product p on s.product_id = p.product_id
ORDER BY 
    p.product_name asc;
