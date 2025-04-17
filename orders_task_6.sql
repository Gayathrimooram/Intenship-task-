SELECT * FROM task_6;

-- extract month
select extract(month from `order date`) as month from task_6 group by month order by month;

-- month wise sales
select extract(month from `Order Date`) as month, count(`order id`) as total_orders, round(sum(sales)) as revenue 
from task_6  group by month order by month;

-- year wise sales
select year(`order date`) as year,round(sum(`sales`)) as sales from task_6 group by year order by year;

-- DISTINCT 
select count(distinct order_id) as total_orders from task_6;

-- sorting and grouping
select Customer_ID, Customer_Name, sum(sales) as total_sales from task_6 group by Customer_ID, Customer_Name order by total_sales desc;

select Category, sum(Profit) as total_profit from task_6 group by category order by total_profit desc;

select * from task_6 where profit <0; 

-- Aggregation function 
select sum(sales) as total_sales from task_6;
select count(distinct order_id) as total_orders from task_6;
select round(avg(`profit`),2) as Profit from task_6;

-- limit
select * from task_6 where region="south" order by sales asc limit 10;
select * from task_6 where `sales` > (select avg(`sales`) from task_6) order by sales desc limit 10; 


SELECT
    EXTRACT(YEAR FROM CAST(`Order Date` AS DATE)) AS year,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM task_6
GROUP BY year
ORDER BY year;





