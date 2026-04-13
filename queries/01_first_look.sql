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
