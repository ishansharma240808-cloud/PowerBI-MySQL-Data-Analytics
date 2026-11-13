Create Database SQL_project_p1 ;
Use SQL_project_p1 ;

Create table retail_sales
	(
	transaction_id INT primary key ,
    sale_date Date ,
    sale_time Time ,
    customer_id int ,
    gender varchar(15),
    age Int, 
    category varchar(15),
    quantity Int ,
    price_per_unit Float ,
    cogs Float , 
    total_sale Float 
    );
select * from retail_sales ;

# Calculate total sales 
SELECT
    COUNT(*) AS total_transactions,
    SUM(total_sale) AS total_revenue,
    AVG(total_sale) AS average_transaction_value
FROM retail_sales;

#Compare product categories
SELECT
    category,
    COUNT(*) AS transactions,
    SUM(quantity) AS units_sold,
    SUM(total_sale) AS revenue
FROM retail_sales
GROUP BY category
ORDER BY revenue DESC;

#Analyze monthly sales
SELECT
    YEAR(sale_date) AS sales_year,
    MONTH(sale_date) AS sales_month,
    SUM(total_sale) AS monthly_revenue
FROM retail_sales
GROUP BY
    YEAR(sale_date),
    MONTH(sale_date)
ORDER BY
    sales_year,
    sales_month;

USE SQL_project_p1;

SELECT
    COUNT(*) AS total_transactions,
    SUM(total_sale) AS total_revenue,
    ROUND(AVG(total_sale), 2) AS avg_transaction_value,
    SUM(quantity) AS total_units_sold
FROM retail_sales;

select 
	count(*) AS total_transactions,
    SUM(quantity) AS units_sold,
    round(sum(total_sale),2) AS TOTAL_REVENUE,
    ROUND(avg(total_sale),2) AS avg_total_transaction 
    from retail_sales
    group by category 
    order by total_revenue DESC ;
    
SELECT
    YEAR(sale_date) AS sales_year,
    MONTH(sale_date) AS sales_month,
    COUNT(*) AS total_transactions,
    ROUND(SUM(total_sale), 2) AS monthly_revenue
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY sales_year, sales_month;

SELECT
    category,
    COUNT(*) AS transactions,
    ROUND(SUM(total_sale), 2) AS total_revenue
FROM retail_sales
GROUP BY category
ORDER BY total_revenue DESC;
    
SELECT
    customer_id,
    COUNT(*) AS total_transactions,
    ROUND(SUM(total_sale), 2) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

SELECT
    gender,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(total_sale), 2) AS total_revenue,
    ROUND(AVG(total_sale), 2) AS avg_transaction_value
FROM retail_sales
GROUP BY gender
ORDER BY total_revenue DESC;

drop Database SQL_project_p1 ; 