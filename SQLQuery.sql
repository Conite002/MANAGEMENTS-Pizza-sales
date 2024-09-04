SELECT * from pizza_sales
SELECT SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value FROM pizza_sales;
SELECT CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10, 2)) AS Avg_Pizza_Per_Order FROM pizza_sales
SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
SELECT DATENAME(MONTH, order_date) as order_month, COUNT(DISTINCT order_id) AS Total_orders  FROM pizza_sales GROUP BY (DATENAME(MONTH, order_date)) 
ORDER BY Total_orders DESC

SELECT pizza_category, sum(total_price) * 100 / (select sum(total_price) from pizza_sales)  as Total_price 
from pizza_sales
where month(order_date) = 1
group by pizza_category

select pizza_size, sum(total_price) as Total_price, sum(total_price)*100/ (select  sum(total_price) from pizza_sales) as PCT
from pizza_sales
group by pizza_size
order by PCT desc

select top 5 pizza_name, sum(total_price) as Total_price 
from pizza_sales 
group by pizza_name
order by Total_price desc

select top 5 pizza_name, count(distinct order_id) as Total_order
from pizza_sales
group by pizza_name
order by Total_order desc