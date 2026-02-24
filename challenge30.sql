-- fetching top N items(pizza) on basis of category
-- where cannot be used with partition by or order by clause
select * from (select 
	pizza_types.category, 
    pizza_types.name, 
    pizzas.size, 
    pizzas.price,
    dense_rank() over (partition by pizza_types.category order by pizzas.price desc) as pizza_rank
from 
	pizzas join pizza_types
on 
	pizzas.pizza_type_id = pizza_types.pizza_type_id) as a
where pizza_rank <= 3;