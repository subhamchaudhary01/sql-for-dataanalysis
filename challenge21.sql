-- SQL 50 - Immediate Food Delivery II
/*
  If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled. The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.

  Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
*/

SELECT 
ROUND(
    100.0 * SUM(d.order_date = d.customer_pref_delivery_date) / COUNT(*),
    2
) AS immediate_percentage
FROM Delivery d
JOIN (
    SELECT customer_id, MIN(order_date) AS first_date
    FROM Delivery
    GROUP BY customer_id
) f
ON d.customer_id = f.customer_id
AND d.order_date = f.first_date;