-- Windows function in SQL
-- Partition by category example

select 
  name,
  category, 
  count(category) 
over (partition by category) as dept_avg 
from 
  pizza_types;