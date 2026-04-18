-- running total and MTD
--------------------------------------------------------------

with a as(select orders.order_date,
round(sum(order_details.quantity*pizzas.price),2) as sales from orders
join order_details
using  (order_id)
join pizzas
using(pizza_id)
GROUP BY(orders.order_date))


select * , round(sum(sales) over(ORDER BY order_date),2) as running_total, 
round(sum(sales) over(PARTITION BY MONTH(order_date) ORDER BY order_date),2) as MTD

from a;

-- ranking as per price of pizza 
--------------------------------------------------------------


select pizza_types.category , pizza_types.name, pizzas.size, pizzas.price,

RANK() OVER(order by pizzas.price desc) as rnk,
DENSE_RANK() OVER(ORDER BY pizzas.price desc) as dense_rnk,
ROW_NUMBER() OVER(ORDER BY pizzas.price desc) as row_num

from pizza_types 
join pizzas using(pizza_type_id);

-- top 3 pizzas from each category
--------------------------------------------------------------


with a as (select pizza_types.category , pizza_types.name, pizzas.size, pizzas.price,

DENSE_RANK() OVER(PARTITION by pizza_types.category ORDER BY pizzas.price desc) as dense_rnk

from pizza_types 
join pizzas using(pizza_type_id))

select * from a 
where dense_rnk <=3;
