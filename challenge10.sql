-- SQL 50 - 577 Employee Bonus
/* Write a solution to report the name and bonus amount of each employee who satisfies either of the following:

  1. The employee has a bonus less than 1000.
  2. The employee did not get any bonus.
*/

SELECT 
    e.name, 
    b.bonus
FROM
    employee e left join bonus b on e.empId = b.empId
WHERE
    b.bonus < 1000 or e.empId not in (select empId from bonus) -- subquery example
ORDER BY
    e.name;