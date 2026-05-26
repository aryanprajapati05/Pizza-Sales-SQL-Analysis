create database Pizzahut
use pizzahut

select * from pizzas

SELECT COUNT(*) AS total_rows
FROM orders;

select * from pizzas
select * from orders
select * from order_details
select * from pizza_types

--Retrieve the total number of orders placed.
select count(order_id) as Total_Orders from orders

--Calculate the total revenue generated from pizza sales.
select sum(quantity*price) as total_revenue from order_details inner join pizzas
on order_details.pizza_id=pizzas.pizza_id

--Identify the highest-priced pizza.
select top 1 * from pizzas
order by price desc

--Identify the most common pizza size ordered.
select top 1 size,count(size) as Count_size from order_details inner join pizzas
on order_details.pizza_id=pizzas.pizza_id
group by size
order by count_size desc

--List the top 5 most ordered pizza types along with their quantities.
select top 5 pizza_types.name,sum(quantity) as order_quant from pizza_types inner join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
inner join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.name
order by order_quant desc




select * from pizzas
select * from orders
select * from order_details
select * from pizza_types

--Join the necessary tables to find the total quantity of each pizza category ordered.
select sum(quantity) as Total_Quantity_Ordered,category from order_details inner join pizzas
on order_details.pizza_id=pizzas.pizza_id
join pizza_types
on pizzas.pizza_type_id=pizza_types.pizza_type_id
group by category

--Determine the distribution of orders by hour of the day.
select datepart(hour,order_time) as order_hour,count(order_id) as order_count from orders
group by datepart(hour,order_time)
order by order_count desc

--Join relevant tables to find the category-wise distribution of pizzas
select count(pizza_type_id),category from pizza_types
group by category

--Group the orders by date and calculate the average number of pizzas ordered per day.

select avg(total_quantity) from
(SELECT 
    orders.order_date,
    SUM(order_details.quantity) AS total_quantity
FROM orders
JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY orders.order_date) as order_quantity

--Determine the top 3 most ordered pizza types based on revenue.
select * from pizzas
select * from orders
select * from order_details
select * from pizza_types

select top 5 round(sum(quantity*price),2) as Revenue,name from order_details inner join pizzas
on order_details.pizza_id=pizzas.pizza_id
inner join pizza_types
on pizzas.pizza_type_id=pizza_types.pizza_type_id
group by name
order by round(sum(quantity*price),2) desc

--Calculate the percentage contribution of each pizza type to total revenue.

select name,Revenue,((revenue/sum(revenue) OVER())*100) as Revenue_percentage from

(select round(sum(quantity*price),2) as Revenue,name from order_details inner join pizzas
on order_details.pizza_id=pizzas.pizza_id
inner join pizza_types
on pizzas.pizza_type_id=pizza_types.pizza_type_id
group by name
) as Revenue_per_pizza

order by ((revenue/sum(revenue) OVER())*100) desc

--Analyze the cumulative revenue generated over time.

select order_date,sum(revenue) over(order by order_date) as cum_revenue from
(SELECT 
    orders.order_date,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM order_details
JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id
JOIN orders
ON orders.order_id = order_details.order_id
GROUP BY orders.order_date) as sales

--Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select category,name,revenue, rank() over(partition by category order by revenue desc) as rnk from 
(select round(sum(quantity*price),2) as Revenue,category,name from order_details inner join pizzas
on order_details.pizza_id=pizzas.pizza_id
inner join pizza_types
on pizzas.pizza_type_id=pizza_types.pizza_type_id
group by category,name) as revenue_per_category