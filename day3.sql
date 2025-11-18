-- Management wants to see the top 3 highest-priced products in the e-commerce system
use ecommercedb;
select * from product;
select * from sales;
select * from product order by price desc limit 3;

-- Management wants summary statistics of the sales data
SELECT 
    COUNT(*) AS sales_count,
    SUM(sale_amount * quantity) AS total_sales,
    AVG(sale_amount * quantity) AS avg_sales,
    MAX(sale_amount * quantity) AS maximum_sale,
    MIN(sale_amount * quantity) AS minimum_sale
FROM sales;


-- Management wants to know which products have total sales amount greater than ₹100
SELECT 
    product_id,
   SUM(sale_amount) AS total_sales
FROM sales
GROUP BY product_id
HAVING total_sales > 100;

-- Management wants a ranking of products based on their prices
SELECT 
    product_id,
    product_name,
    price,
    DENSE_RANK() OVER (order by price desc) AS price_rank
FROM product;
