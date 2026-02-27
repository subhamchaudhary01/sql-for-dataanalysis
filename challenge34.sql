-- SQL 50 - User Activity for past 30 days
/*
  Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.
*/

SELECT 
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM 
  Activity
WHERE 
  activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY)
                        AND '2019-07-27'
GROUP BY 
  activity_date;