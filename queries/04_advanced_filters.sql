-- =============================================
-- 04_advanced_filters.sql
-- Business goal: Practice filtering after grouping (HAVING) and combining WHERE + GROUP BY
-- Skills shown: HAVING, WHERE before GROUP BY, COUNT(DISTINCT), calculated columns
-- Date created: April 2026
-- =============================================

-- Query 18: Categories with profit margin above 20%
SELECT 
    Category,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin_percent
FROM superstore_sales
GROUP BY Category
HAVING profit_margin_percent > 20
ORDER BY profit_margin_percent DESC;

-- Query 19: Average order value by segment
SELECT 
    Segment,
    ROUND(AVG(Sales), 2) AS avg_order_value,
    COUNT(*) AS number_of_orders,
    ROUND(SUM(Sales), 2) AS total_sales
FROM superstore_sales
GROUP BY Segment
ORDER BY avg_order_value DESC;

-- Query 20: Customers who placed more than 10 orders
SELECT 
    Customer_Name,
    Customer_ID,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_spent
FROM superstore_sales
GROUP BY Customer_Name, Customer_ID
HAVING total_orders > 10
ORDER BY total_orders DESC;

-- Query 21: High-value orders (sales over $1000)
SELECT 
    Order_ID,
    Customer_Name,
    ROUND(SUM(Sales), 2) AS order_total,
    COUNT(*) AS items_in_order
FROM superstore_sales
GROUP BY Order_ID, Customer_Name
HAVING order_total > 1000
ORDER BY order_total DESC;

-- Query 24: Consumer segment sales by region
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
WHERE Segment = 'Consumer'
GROUP BY Region
ORDER BY total_sales DESC;

-- Query 25: Number of unique customers by region
SELECT 
    Region,
    COUNT(DISTINCT Customer_ID) AS unique_customers,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS total_orders
FROM superstore_sales
GROUP BY Region
ORDER BY unique_customers DESC;
