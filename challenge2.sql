
-- SQL 50 - Find Customer Referee
/*
Find the names of the customer that are either:
  1. referred by any customer with id != 2.
  2. not referred by any customer.
*/

SELECT
    name
FROM
    Customer
WHERE
    referee_id is null OR referee_id != 2
ORDER BY 
    name asc