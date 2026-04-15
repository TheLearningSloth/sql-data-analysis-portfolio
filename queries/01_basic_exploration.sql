-- =============================================
-- 01_basic_exploration.sql
-- Business goal: Get familiar with the Superstore dataset and see raw data
-- Skills shown: SELECT, LIMIT
-- Date created: April 2026
-- =============================================

-- Query 1: First look at the data
SELECT *
FROM superstore_sales
LIMIT 10;

-- Query 2: Total sales by category
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Category
ORDER BY total_sales DESC;

-- Query 3: Sales and profit by region
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Region
ORDER BY total_profit DESC;

-- Query 4: Top 10 most profitable products
SELECT 
    Product_Name,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Product_Name
ORDER BY total_profit DESC
LIMIT 10;

-- Query 5: Top 5 cities by total sales
SELECT 
    City,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY City
ORDER BY total_sales DESC
LIMIT 5;

-- Query 6: Total sales by customer segment
SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Segment
ORDER BY total_sales DESC;
