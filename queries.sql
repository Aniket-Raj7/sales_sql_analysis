-- running total and MTD

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




