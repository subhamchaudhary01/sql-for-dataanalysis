-- SQL 50 - Not Boring Movies
/* 
  Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
  Return the result table ordered by rating in descending order.
*/

select id, movie, description, rating from Cinema Where id in (
    select case
        when id % 2 != 0 and description != 'boring' then id -- case used
    end as Odd_Id
    from Cinema
) order by id desc;