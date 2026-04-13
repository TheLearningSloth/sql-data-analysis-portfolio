-- =============================================
-- First query: Just peek at the data
-- Goal: Get comfortable seeing what the Superstore sales data looks like
-- Date: April 13, 2026
-- =============================================

-- Simple SELECT to show the first 10 rows
-- This is exactly like the very first thing you probably did in your LinkedIn course
SELECT *
FROM superstore_sales
LIMIT 10;
-- =============================================
-- Second query: Total sales by category
-- Goal: Start doing real analysis — group and sum
-- This uses GROUP BY and SUM (common in your LinkedIn course)
-- =============================================

SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Category
ORDER BY total_sales DESC;
-- =============================================
-- Third query: Sales and profit by region
-- Goal: See which regions are driving the most money
-- Reusing GROUP BY + SUM + COUNT (same pattern as query 2, just different columns)
-- =============================================

SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Region
ORDER BY total_profit DESC;
-- =============================================
-- Fourth query: Top 10 most profitable products
-- Goal: See which individual products make the most money
-- Reusing GROUP BY + SUM + ORDER BY + new LIMIT (same pattern, one small addition)
-- =============================================

SELECT 
    Product_Name,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Product_Name
ORDER BY total_profit DESC
LIMIT 10;
-- =============================================
-- Fifth query: Top 5 cities by total sales
-- Goal: See which cities bring in the most revenue
-- Reusing the same pattern (GROUP BY + SUM + ORDER BY + LIMIT)
-- =============================================

SELECT 
    City,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY City
ORDER BY total_sales DESC
LIMIT 5;
-- =============================================
-- Sixth query: Total sales by customer segment
-- Goal: See which customer types buy the most
-- Same pattern again — this repetition is how it starts to feel less foreign
-- =============================================

SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Segment
ORDER BY total_sales DESC;
