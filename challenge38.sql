-- SQL 50 - 1731 Number of Employees which reports to each employee
/*
  For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
  Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
  Return the result table ordered by employee_id.
*/

SELECT 
    m.employee_id,
    m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(AVG(e.age)) AS average_age
FROM Employees m
JOIN Employees e
    ON m.employee_id = e.reports_to
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;