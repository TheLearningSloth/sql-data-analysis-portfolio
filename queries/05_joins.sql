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
