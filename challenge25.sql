/*
The times that employees log in and log out are recorded over the course of a month. for each employee, determine the number of hours worked during the weekends. For simplicity, hours worked in a day, hours are truncated to their integer part. for example, there are 10 hours between '2000:01:01 00:45:00' and '2000:01:01 10:45:00'. There are 9 hours between '2000:01:01 00:46:00' and '2000:01:01 10:45:00'. Return a list of employee ids and weekend hours worked, descending by hours worked.
*/
WITH numbered AS (
    SELECT
        emp_id,
        timestamp,
        ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY timestamp) AS rn
    FROM attendance
),
sessions AS (
    SELECT
        login.emp_id,
        login.timestamp AS login_time,
        logout.timestamp AS logout_time
    FROM numbered login
    JOIN numbered logout
      ON login.emp_id = logout.emp_id
     AND login.rn % 2 = 1          -- odd row = login
     AND logout.rn = login.rn + 1  -- even row = logout
)
SELECT
    emp_id,
    SUM(FLOOR(TIMESTAMPDIFF(MINUTE, login_time, logout_time)/60)) AS weekend_hours
FROM sessions
WHERE DAYOFWEEK(login_time) IN (1,7)  -- weekend only
GROUP BY emp_id
ORDER BY weekend_hours DESC;
