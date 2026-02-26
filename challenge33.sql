-- SQL 50 - 619 Biggest Single Number
/*
  Table: MyNumbers

+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+
This table may contain duplicates (In other words, there is no primary key for this table in SQL). Each row of this table contains an integer.
A single number is a number that appeared only once in the MyNumbers table.
Find the largest single number.
*/

select 
  max(num) as num 
from 
  myNumbers 
where 
  num in (select num from mynumbers group by num having count(num) = 1);