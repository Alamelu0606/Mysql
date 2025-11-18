-- List all products sorted by price descending
use ecommercedb;
select * from product order by price desc;

-- Show the top 3 most expensive products

-- Find the total_sales,average,min and max amount across all sales
select sum(sale_amount *quantity) as Total_sales,
AVG(sale_amount * quantity) AS avg_sales,
MAX(sale_amount * quantity) AS maximum_sale,
MIN(sale_amount * quantity) AS minimum_sale
FROM sales; 

-- Find total sales amount per product
select product_id,sum(sale_amount) from sales group by product_id;

-- List products whose total sales exceed ₹50,000
select product_id,sum(sale_amount)  from sales group by product_id having sale_amount>50000;

select product_id,sum(sale_amount) as sales  from sales group by product_id having sales>50000;

-- Show total sales per product, sorted descending by total sales
select product_id,sum(sale_amount) as sales  from sales group by product_id order by sales desc ;

-- Use GROUP BY product_id, aggregate with SUM(sale_amount), sort descending, and limit to 3 rows
select product_id,sum(sale_amount) as sales  from sales group by product_id order by sales desc limit 3;

-- Use GROUP BY product_id and HAVING SUM(sale_amount) > 30000 AND AVG(sale_amount) > 10000
SELECT 
    product_id,
    SUM(sale_amount) AS total_sales,
    AVG(sale_amount) AS avg_sale_amount
FROM sales
GROUP BY product_id having total_sales>30000 and avg_sale_amount>10000;

