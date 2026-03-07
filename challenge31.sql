-- SQL 50 - Classes with at least 5 students
/*
Each row of this table indicates the name of a student and the class in which they are enrolled.
Write a solution to find all the classes that have at least five students.
Return the result table in any order.
*/

select 
  class 
from 
  courses 
group by 
  class 
having 
  count(student) >= 5 
order by 
  class asc;