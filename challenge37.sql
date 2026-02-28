-- SQL 50 - Employees whose manager left the company
/*
  ind the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.
*/

select
    employee_id
from 
    employees
where 
    employee_id in (select manager_id from employees where salary < 30000);