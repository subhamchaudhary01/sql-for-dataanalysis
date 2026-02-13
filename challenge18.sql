-- SQL 50 - Percentage of Users Attended a Contest
/*
  Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
  Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.
*/

SELECT 
    contest_id, 
    Round((count(user_id) / (select count(user_id) from users)) * 100, 2) as percentage 
FROM 
    register 
GROUP BY
    contest_id 
ORDER BY
    percentage desc, contest_id asc;