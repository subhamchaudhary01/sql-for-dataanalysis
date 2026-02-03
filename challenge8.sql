/* 
Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
*/

SELECT
    customer_id, 
    count(visit_id) as "count_no_trans"
FROM
    Visits
WHERE 
    visit_id not in (SELECT distinct(visit_id) from Transactions)
GROUP BY
    customer_id
ORDER BY
    visit_id;