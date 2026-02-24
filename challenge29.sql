-- Example of Window Function
-- Most important question from interview perspective
-- Rank on the basis of sales
/*   Sales      Rank()        Dense_Rank()   Row_Number()
     5000       1                1              1
     1500       2                2              2
     1500       2                2              3
     1000       4                3              4
     800        5                4              5
     500        6                5              6
     300        7                6              7
     300        7                6              8
     300        7                6              9
     200        10               7              10
 */    
     -- Rank (skips the next number if values are same)
     -- Dense_Rank doesn't skip next number even if the values are same
     -- Row_Number doesn't give same rank but unique values to each of them

select 
	pizza_types.category, 
    pizza_types.name, 
    pizzas.size, 
    pizzas.price,
    rank() over (order by pizzas.price desc) as Rank_Function,
    dense_rank() over (order by pizzas.price desc) as Dense_Rank_Function,
    row_number() over (order by pizzas.price desc) as Row_Number_Function
from 
	pizzas join pizza_types
on 
	pizzas.pizza_type_id = pizza_types.pizza_type_id;