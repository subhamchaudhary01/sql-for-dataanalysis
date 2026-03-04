-- SQL 50 - 602 Friend Requests II: Who Has the Most Friends
/*
Write a solution to find the people who have the most friends and the most friends number.
The test cases are generated so that only one person has the most friends.
*/

SELECT 
    id,
    COUNT(*) AS num
FROM (
        SELECT requester_id AS id FROM RequestAccepted
        UNION ALL
        SELECT accepter_id FROM RequestAccepted
     ) t
GROUP BY id
ORDER BY num DESC
LIMIT 1;
