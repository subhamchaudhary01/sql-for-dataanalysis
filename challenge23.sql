
-- HackerRank Advanced Problem
/*
As plan of business expansion efforts at a company, your help is needed to find all pairs of customers and agents who had been in contact more than once. for each such pair, display the user_id, first_name, last_name and the customer id, name and number of contact person. order result by ascending order
*/

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    c.customer_id,
    c.name,
    COUNT(*) AS number_of_contacts
FROM contact ct
JOIN user_account u 
    ON ct.user_id = u.user_id
JOIN customer c
    ON ct.customer_id = c.customer_id
GROUP BY 
    u.user_id,
    u.first_name,
    u.last_name,
    c.customer_id,
    c.name
HAVING COUNT(*) > 1
ORDER BY u.user_id, c.customer_id;
