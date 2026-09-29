CREATE TABLE ecommerce_sales (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR(20),
    Category VARCHAR(50),
    Product VARCHAR(100),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Discount_Percent DECIMAL(5,2),
    Sales DECIMAL(12,2),
    Cost DECIMAL(12,2),
    Profit DECIMAL(12,2),
    City VARCHAR(50),
    Payment_Method VARCHAR(50),
    Order_Status VARCHAR(30)
);
show tables;
SELECT COUNT(*) FROM ecommerce_sales;
SELECT COUNT(*) AS total_rows
FROM ecommerce_sales;
SELECT *
FROM ecommerce_sales
LIMIT 10;
SELECT
    COUNT(*) AS total_rows,
    SUM(Order_ID IS NULL) AS missing_order_id,
    SUM(Order_Date IS NULL) AS missing_date,
    SUM(Customer_ID IS NULL) AS missing_customer,
    SUM(Category IS NULL) AS missing_category,
    SUM(Product IS NULL) AS missing_product,
    SUM(Sales IS NULL) AS missing_sales,
    SUM(Profit IS NULL) AS missing_profit
FROM ecommerce_sales;
SELECT
    COUNT(DISTINCT Order_ID) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM ecommerce_sales
WHERE Order_Status = 'Delivered';
-- Step 2: Category-wise Sales and Profit

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS units_sold
FROM ecommerce_sales
WHERE Order_Status = 'Delivered'
GROUP BY Category
ORDER BY total_sales DESC;
-- Step 3: Monthly Sales Analysis

SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS month,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS units_sold
FROM ecommerce_sales
WHERE Order_Status = 'Delivered'
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY month;
-- Step 4: Top 10 Best-Selling Products

SELECT
    Product,
    SUM(Quantity) AS units_sold,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM ecommerce_sales
WHERE Order_Status = 'Delivered'
GROUP BY Product
ORDER BY total_sales DESC
LIMIT 10;
-- STEP 5: City-wise Sales & Profit Analysis

SELECT
    City,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY City
ORDER BY Total_Sales DESC;
-- STEP 6: Category-wise Sales & Profit Analysis

SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY Category
ORDER BY Total_Sales DESC;
-- STEP 7: Monthly Sales & Profit Analysis

SELECT
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Order_Year, Order_Month;
-- STEP 8: Top 10 Products by Sales
-- STEP 8: Top 10 Products by Sales

-- STEP 8: Top 10 Products by Sales

SELECT
    Product_Name,
    SUM(Sales) AS Total_Sales
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;
DESCRIBE ecommerce_sales;
SELECT
    Product,
    SUM(Sales) AS Total_Sales
FROM ecommerce_sales
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 10;
-- STEP 9: Top 10 Products by Profit

SELECT
    Product,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 10;
-- STEP 10: Segment-wise Sales & Profit Analysis

-- STEP 10: Payment Method-wise Sales & Profit

SELECT
    Payment_Method,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY Payment_Method
ORDER BY Total_Sales DESC;
-- STEP 11: Order Status-wise Sales & Profit

SELECT
    Order_Status,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY Order_Status
ORDER BY Total_Orders DESC;
-- STEP 12: Customer-wise Sales Analysis

SELECT
    Customer_ID,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY Customer_ID
ORDER BY Total_Sales DESC
LIMIT 10;
-- STEP 13: City-wise Order Analysis

SELECT
    City,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY City
ORDER BY Total_Orders DESC;
-- STEP 14: Category-wise Average Order Value

SELECT
    Category,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    ROUND(AVG(Sales), 2) AS Average_Order_Value
FROM ecommerce_sales
GROUP BY Category
ORDER BY Average_Order_Value DESC;
-- STEP 15: Overall Business Summary

SELECT
    COUNT(Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Cost) AS Total_Cost,
    SUM(Profit) AS Total_Profit,
    ROUND(AVG(Sales), 2) AS Average_Order_Value
FROM ecommerce_sales;
-- STEP 16: Overall Profit Margin

SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM ecommerce_sales;
-- STEP 17A: Top 10 Products by Profit

SELECT
    Product,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 10;
-- STEP 17B: Bottom 10 Products by Profit

SELECT
    Product,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY Product
ORDER BY Total_Profit ASC
LIMIT 10;
-- STEP 18: Final Business Insights

SELECT
    COUNT(Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT Product) AS Total_Products,
    COUNT(DISTINCT City) AS Total_Cities,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM ecommerce_sales;









