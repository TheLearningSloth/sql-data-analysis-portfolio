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
-- =============================================
-- Seventh query: Average discount by category
-- Goal: See which categories get the most discounting
-- Same exact pattern — repetition builds familiarity
-- =============================================

SELECT 
    Category,
    ROUND(AVG(Discount) * 100, 2) AS avg_discount_percent,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Category
ORDER BY avg_discount_percent DESC;
-- =============================================
-- Eighth query: Total sales by ship mode
-- Goal: See which shipping methods are used the most
-- Same exact pattern (GROUP BY + SUM + ORDER BY) — repetition is building familiarity
-- =============================================

SELECT 
    Ship_Mode,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Ship_Mode
ORDER BY total_sales DESC;
-- =============================================
-- Ninth query: Top 5 states by total sales
-- Goal: See which states are driving the most revenue
-- Same pattern again (GROUP BY + SUM + ORDER BY + LIMIT) — this is how familiarity builds
-- =============================================

SELECT 
    State,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY State
ORDER BY total_sales DESC
LIMIT 5;
-- =============================================
-- Tenth query: Total profit by sub-category
-- Goal: See which product sub-categories are most profitable
-- Same pattern again (GROUP BY + SUM + ROUND + ORDER BY) — repetition builds real familiarity
-- =============================================

SELECT 
    Sub_Category,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Sub_Category
ORDER BY total_profit DESC;
-- =============================================
-- Eleventh query: Total quantity sold by category
-- Goal: See which categories have the highest volume
-- Same pattern again (GROUP BY + SUM + ORDER BY) — repetition is the key
-- =============================================

SELECT 
    Category,
    SUM(Quantity) AS total_quantity_sold,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Category
ORDER BY total_quantity_sold DESC;
-- =============================================
-- Twelfth query: Orders by order date year
-- Goal: See sales trends by year (basic time analysis)
-- Same pattern (GROUP BY + SUM + ORDER BY) — repetition builds familiarity
-- =============================================

SELECT 
    strftime('%Y', "Order Date") AS order_year,   -- extracts just the year from the date column
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY order_year
ORDER BY order_year;
-- =============================================
-- Thirteenth query: Monthly sales trend
-- Goal: See sales by month (basic time series)
-- Same pattern (GROUP BY + SUM + ORDER BY) with a date function you saw in query 12
-- =============================================

SELECT 
    strftime('%Y-%m', "Order Date") AS order_month,   -- extracts year-month from the date column
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY order_month
ORDER BY order_month;
-- =============================================
-- Fourteenth query: Sales by ship mode and region
-- Goal: See which shipping methods perform best in each region
-- Same pattern (GROUP BY + SUM + ORDER BY) with two columns this time
-- =============================================

SELECT 
    Ship_Mode,
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Ship_Mode, Region
ORDER BY total_sales DESC;
-- =============================================
-- Fifteenth query: Sales by segment and category
-- Goal: See which customer segments buy which categories the most
-- Same pattern (GROUP BY two columns + SUM + ORDER BY) — repetition is building familiarity
-- =============================================

SELECT 
    Segment,
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Segment, Category
ORDER BY total_sales DESC;
-- =============================================
-- Sixteenth query: Top 10 customers by total sales
-- Goal: See which customers bring in the most revenue
-- Same pattern (GROUP BY + SUM + ORDER BY + LIMIT) — repetition is making this less foreign
-- =============================================

SELECT 
    Customer_Name,
    Customer_ID,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Customer_Name, Customer_ID
ORDER BY total_sales DESC
LIMIT 10;
-- =============================================
-- Seventeenth query: Top 5 products by quantity sold
-- Goal: See which products move the most units
-- Same pattern (GROUP BY + SUM + ORDER BY + LIMIT) — repetition is making this less foreign
-- =============================================

SELECT 
    Product_Name,
    SUM(Quantity) AS total_quantity_sold,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS number_of_orders
FROM superstore_sales
GROUP BY Product_Name
ORDER BY total_quantity_sold DESC
LIMIT 5;
