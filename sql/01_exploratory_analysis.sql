USE [OnlineRetailDB];

SELECT *
FROM [dbo].[OnlineRetail];

-- Question 1: What is the total revenue, total quantity sold, and total number of transactions?
SELECT 
    SUM(Revenue) AS TotalRevenue,
    SUM(Quantity) AS TotalQuantity,
    COUNT(DISTINCT InvoiceNo) AS TotalTransactions
FROM 
    OnlineRetail;

-- Question 2: Analyzed revenue trends and fluctuations across multiple time horizons (Yearly, Monthly, and Day-of-Week).
SELECT Year, SUM(Revenue) AS TotalRevenue
FROM OnlineRetail
GROUP BY Year
ORDER BY Year;

SELECT Year, Month, SUM(Revenue) AS MonthlyRevenue
FROM OnlineRetail
GROUP BY Year, Month
ORDER BY Year, Month;

SELECT Weekday,
       SUM(Revenue) AS Revenue
FROM OnlineRetail
GROUP BY Weekday
ORDER BY Revenue DESC;

-- Question 3: How many unique customers have made a purchase?
SELECT COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM OnlineRetail;

-- Question 4: Which country has the highest number of transactions?
SELECT TOP 1
    Country,
    COUNT(DISTINCT InvoiceNo) AS TotalTransactions
FROM OnlineRetail
GROUP BY Country
ORDER BY TotalTransactions DESC;

-- Question 5: What are the top 10 best-selling products by quantity?
SELECT TOP 10
    Description,
    SUM(Quantity) AS TotalQuantity
FROM OnlineRetail
GROUP BY Description
ORDER BY TotalQuantity DESC;

-- Question 6: How does revenue fluctuate month over month?
SELECT
    Year,
    Month,
    SUM(Revenue) AS MonthlyRevenue
FROM OnlineRetail
GROUP BY Year, Month
ORDER BY Year, Month;

-- Question 7: Which day of the week generates the highest revenue?
SELECT
    Weekday,
    SUM(Revenue) AS Revenue
FROM OnlineRetail
GROUP BY Weekday
ORDER BY Revenue DESC;

-- Question 8: Which hour of the day has the most transactions?
SELECT
    Hour,
    COUNT(DISTINCT InvoiceNo) AS TotalTransactions
FROM OnlineRetail
GROUP BY Hour
ORDER BY TotalTransactions DESC;

-- Question 9: Who are the top 10 customers by total revenue?
SELECT TOP 10
    CustomerID,
    SUM(Revenue) AS TotalRevenue
FROM OnlineRetail
GROUP BY CustomerID
ORDER BY TotalRevenue DESC;

-- Question 10: Which country has the highest Average Order Value (AOV)?
SELECT TOP 1
    Country,
    AVG(Revenue) AS AvgOrderValue
FROM OnlineRetail
GROUP BY Country
ORDER BY AvgOrderValue DESC;



