-- SQL 50 - 2356. Number of Unique Subjects Taught by Each Teacher
/*
  Write a solution to calculate the number of unique subjects each teacher teaches in the university. Return the result table in any order.
*/

select
    teacher_id, count(distinct(subject_id)) as "cnt"
from 
    Teacher
group by
    teacher_id
order by
    teacher_id asc;