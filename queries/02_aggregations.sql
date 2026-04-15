-- =============================================
-- 02_aggregations.sql
-- Business goal: Practice grouping and aggregating data (SUM, AVG, COUNT, etc.)
-- Skills shown: GROUP BY, SUM, ROUND, AVG, ORDER BY, LIMIT
-- Date created: April 2026
-- =============================================

-- Query 7: Average discount by category
SELECT 
    Category,
    ROUND(AVG(Discount) * 100, 2) AS avg_discount_percent,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Category
ORDER BY avg_discount_percent DESC;

-- Query 8: Total sales by ship mode
SELECT 
    Ship_Mode,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Ship_Mode
ORDER BY total_sales DESC;

-- Query 9: Top 5 states by total sales
SELECT 
    State,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY State
ORDER BY total_sales DESC
LIMIT 5;

-- Query 10: Total profit by sub-category
SELECT 
    Sub_Category,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Sub_Category
ORDER BY total_profit DESC;

-- Query 11: Total quantity sold by category
SELECT 
    Category,
    SUM(Quantity) AS total_quantity_sold,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Category
ORDER BY total_quantity_sold DESC;

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

-- Query 14: Sales by ship mode and region
SELECT 
    Ship_Mode,
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Ship_Mode, Region
ORDER BY total_sales DESC;
