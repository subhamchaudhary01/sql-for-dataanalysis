/*
Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
Return the result table in any order.
*/

SELECT
    eu.unique_id,
    e.name
FROM
    Employees e left join EmployeeUNI eu on e.id = eu.id
ORDER BY
    e.name asc;