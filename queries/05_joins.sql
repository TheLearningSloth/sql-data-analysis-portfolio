-- =============================================
-- 05_joins.sql
-- Business goal: Start practicing JOINs between sales and returns data
-- Skills shown: LEFT JOIN on Order ID, filtering joined data
-- Date created: April 2026
-- =============================================

-- First JOIN query: Show the first 10 returned orders with customer and sales info
-- This is a LEFT JOIN so we keep all sales rows and only add return info where it exists
SELECT 
    s."Order ID",
    s."Customer Name",
    ROUND(s.Sales, 2) AS sales_amount,
    r.Returned,
    r.Region AS return_region
FROM superstore_sales s
LEFT JOIN superstore_returns r 
    ON s."Order ID" = r."Order ID"
WHERE r.Returned = 'Yes'
LIMIT 10;
-- =============================================
-- Second JOIN query: Returned orders by category
-- Goal: See which categories have the most returns
-- Same LEFT JOIN pattern, just adding GROUP BY and aggregation
-- =============================================

SELECT 
    s.Category,
    COUNT(*) AS number_of_returns,
    ROUND(SUM(s.Sales), 2) AS total_returned_sales
FROM superstore_sales s
LEFT JOIN superstore_returns r 
    ON s."Order ID" = r."Order ID"
WHERE r.Returned = 'Yes'
GROUP BY s.Category
ORDER BY number_of_returns DESC;
-- =============================================
-- Third JOIN query: Returns by region
-- Goal: See which regions have the most returns
-- Same LEFT JOIN pattern, just grouping on the returns table this time
-- =============================================

SELECT 
    r.Region AS return_region,
    COUNT(*) AS number_of_returns,
    ROUND(SUM(s.Sales), 2) AS total_returned_sales
FROM superstore_sales s
LEFT JOIN superstore_returns r 
    ON s."Order ID" = r."Order ID"
WHERE r.Returned = 'Yes'
GROUP BY r.Region
ORDER BY number_of_returns DESC;
-- =============================================
-- Fourth JOIN query: Profit on returned orders by category
-- Goal: See how much profit was lost on returned items by category
-- Same LEFT JOIN pattern, adding Profit column and aggregation
-- =============================================

SELECT 
    s.Category,
    COUNT(*) AS number_of_returns,
    ROUND(SUM(s.Profit), 2) AS total_profit_lost_on_returns,
    ROUND(SUM(s.Sales), 2) AS total_returned_sales
FROM superstore_sales s
LEFT JOIN superstore_returns r 
    ON s."Order ID" = r."Order ID"
WHERE r.Returned = 'Yes'
GROUP BY s.Category
ORDER BY total_profit_lost_on_returns ASC;
-- =============================================
-- Fifth JOIN query: Return rate by category
-- Goal: Calculate what % of sales in each category were returned
-- New concept: Using COUNT + CASE to calculate return rate (slightly more advanced)
-- =============================================

SELECT 
    s.Category,
    COUNT(*) AS total_orders_in_category,
    SUM(CASE WHEN r.Returned = 'Yes' THEN 1 ELSE 0 END) AS number_of_returns,
    ROUND(100.0 * SUM(CASE WHEN r.Returned = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS return_rate_percent
FROM superstore_sales s
LEFT JOIN superstore_returns r 
    ON s."Order ID" = r."Order ID"
GROUP BY s.Category
ORDER BY return_rate_percent DESC;
-- =============================================
-- Sixth JOIN query: Returned orders with full customer and product details
-- Goal: See detailed info on returned orders (combining more columns)
-- Same LEFT JOIN pattern, just selecting more fields for readability
-- =============================================

SELECT 
    s."Order ID",
    s."Customer Name",
    s.Category,
    s.Sub_Category,
    s.Product_Name,
    ROUND(s.Sales, 2) AS sales_amount,
    ROUND(s.Profit, 2) AS profit_amount,
    r.Returned,
    r.Region AS return_region
FROM superstore_sales s
LEFT JOIN superstore_returns r 
    ON s."Order ID" = r."Order ID"
WHERE r.Returned = 'Yes'
ORDER BY s.Sales DESC
LIMIT 20;
