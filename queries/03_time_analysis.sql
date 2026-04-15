-- =============================================
-- 03_time_analysis.sql
-- Business goal: Analyze sales trends over time (years, months, specific years)
-- Skills shown: date functions (strftime), GROUP BY with dates, WHERE + GROUP BY
-- Date created: April 2026
-- =============================================

-- Query 12: Orders by order date year
SELECT 
    strftime('%Y', "Order Date") AS order_year,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY order_year
ORDER BY order_year;

-- Query 13: Monthly sales trend
SELECT 
    strftime('%Y-%m', "Order Date") AS order_month,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY order_month
ORDER BY order_month;

-- Query 23: Orders placed in 2017 only
SELECT 
    strftime('%Y-%m', "Order Date") AS order_month,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
WHERE strftime('%Y', "Order Date") = '2017'
GROUP BY order_month
ORDER BY order_month;

-- Query 8: Total sales by ship mode
SELECT 
    Ship_Mode,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Ship_Mode
ORDER BY total_sales DESC;

-- Query 11: Total quantity sold by category
SELECT 
    Category,
    SUM(Quantity) AS total_quantity_sold,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Category
ORDER BY total_quantity_sold DESC;

-- Query 9: Top 5 states by total sales
SELECT 
    State,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY State
ORDER BY total_sales DESC
LIMIT 5;
