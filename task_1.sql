select * from sales_data;
---retrieve alll sales from south region
select *from sales_data
Where region='South'
;
-----get top 10 highest value orders
select * from sales_data
order by total_amount Desc
limit 10;
-----total sales per region
select region,sum(total_amount) as total_sales
from sales_data
group by region;
----products priced above average
select product_name,price_per_unit
from sales_data
where price_per_unit > (select avg(price_per_unit) from sales_data);
----monthly sales summary
create view monthly_sales as
select date_trunc('month',order_date) as month,sum(total_amount) as total_sales
from sales_data
group by month
order by month;
---------
select * from monthly_sales;
-----total quantity sold per product
SELECT product_name, SUM(quantity) AS total_quantity
FROM sales_data
GROUP BY product_name
ORDER BY total_quantity DESC;
----average order value by region
SELECT region, ROUND(AVG(total_amount), 2) AS avg_order_value
FROM sales_data
GROUP BY region;
-----orders placed using cash on deliver
SELECT * FROM sales_data
WHERE payment_mode = 'Cash on Delivery';
-------number of orders per payment mode
SELECT payment_mode, COUNT(*) AS total_orders
FROM sales_data
GROUP BY payment_mode
ORDER BY total_orders DESC;

------day with highest total sales
SELECT order_date, SUM(total_amount) AS day_sales
FROM sales_data
GROUP BY order_date
ORDER BY day_sales DESC
LIMIT 1;
