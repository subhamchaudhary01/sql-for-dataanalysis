-- SQL 50 - Managers with at Least 50 Direct Reports

/*
  Write a solution to find managers with at least five direct reports. Return the result table in any order.
*/

SELECT
  name 
FROM 
  Employee 
WHERE
  id in 
  (SELECT managerId from Employee group by managerId having count(managerId) >= 5) order by name asc;