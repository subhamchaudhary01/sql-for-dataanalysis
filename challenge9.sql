-- Average time of process per Machine
/* 
There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process. 
*/

SELECT
    a.machine_id,
    ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a
JOIN Activity b
  ON a.machine_id = b.machine_id
 AND a.process_id = b.process_id
 AND a.activity_type = 'start'
 AND b.activity_type = 'end'
GROUP BY a.machine_id;

