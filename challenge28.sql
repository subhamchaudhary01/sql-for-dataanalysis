-- using partition by & order by
-- Month till Date (Month-till-date)

with a as (select
	o.order_date,
    round(sum(od.quantity * p.price), 2) as Sales
from
	orders o join order_details od on o.order_id = od.order_id join pizzas p on p.pizza_id = od.pizza_id
group by 
	o.order_date)

select *,
round(sum(Sales) over (order by order_date), 2) as Cumulative_Sales, 
round(sum(Sales) over (partition by month(order_date) order by order_date), 2) as MTD from a;