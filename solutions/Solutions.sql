-- ======================================================
-- SQL PROJECT QUESTIONS
-- Dataset: PC Sales
-- ======================================================

-- BASIC QUESTIONS

-- Query to retrieve all rows and columns fro the table
SELECT *
FROM [PC_Sales].[dbo].[Laptops_Data]

-- 1. Count the total number of sales records

SELECT COUNT(*) AS Number_of_Sales
FROM [PC_Sales].[dbo].[Laptops_Data]

-- 2. Count the number of sales per Continent.

SELECT COUNT(*) AS Number_of_Sales,
       [Continent]
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY [Continent]

-- 3. Count the number of sales per Country or State.

SELECT COUNT(*) AS Number_of_Sales,
       [Country_or_State]
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY [Country_or_State]

-- 4. List all distinct Shop Name values.

SELECT DISTINCT [Shop_Name]
FROM [PC_Sales].[dbo].[Laptops_Data]


-- 5. Find the average Sale Price.

SELECT AVG([Sale_Price])
FROM [PC_Sales].[dbo].[Laptops_Data]

-- 6. Find the highest and lowest Sale Price.

SELECT MAX([Sale_Price]) AS Highest_Sale_Price,
       MIN([Sale_Price]) AS Lowest_Sale_Price
FROM [PC_Sales].[dbo].[Laptops_Data]

-- 7. Count the number of sales by Payment Method.

SELECT COUNT(*) AS Number_Of_Sales,
       [Payment_Method]
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY [Payment_Method]

-- 8. Count the number of sales by Channel (Online vs Offline).

SELECT COUNT(*) AS Number_Of_Sales,
       [Channel]
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY [Channel]

-- 9. Count the number of sales by Priority level.

SELECT COUNT(*) AS Number_Of_Sales,
       [Priority]
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY [Priority]


-- 10. Count the number of distinct PC Make values.

SELECT COUNT(DISTINCT [PC_Make]) AS PC_Make
FROM [PC_Sales].[dbo].[Laptops_Data]


-- INTERMEDIATE QUESTIONS

-- 11. Calculate total revenue (SUM of Sale Price). 

SELECT SUM(Sale_Price) AS Total_Revenue
FROM [PC_Sales].[dbo].[Laptops_Data]


-- 12. Calculate total profit (SUM of Sale Price - Cost Price).

SELECT SUM(Sale_price - Cost_Price) AS Total_Profit
FROM [PC_Sales].[dbo].[Laptops_Data]


-- 13. Find the average Discount Amount.

SELECT AVG(Discount_Amount) AS Average_Discount_Amount
FROM [PC_Sales].[dbo].[Laptops_Data]


-- 14. Calculate total Finance Amount issued.

SELECT SUM(CAST(Finance_Amount AS bigint)) AS Total_Financial_Amount
FROM [PC_Sales].[dbo].[Laptops_Data]


-- 15. Find total revenue per PC Make.

SELECT PC_Make,
       SUM(Sale_Price) AS Total_Revenue
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY PC_Make


-- 16. Find average Sale Price per Storage Type.

SELECT Storage_Type,
       AVG(Sale_Price) AS Sale_Per_StorageType
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY Storage_Type


-- 17. Calculate total revenue per Shop Name.

SELECT Shop_Name,
       SUM(Sale_Price) AS Total_Revenue_PerShop
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY Shop_Name


-- 18. Calculate total revenue per Sales Person Name.

SELECT Sales_Person_Name,
       SUM(Sale_Price) AS Total_Sales_Per_PersonName
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY Sales_Person_Name


-- 19. Find average Credit Score per Payment Method.

SELECT Payment_Method,
       AVG(Credit_Score) AS Average_Score_Payment_Method
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY Payment_Method


-- 20. Calculate total Cost of Repairs per Sales Person Department.

SELECT Sales_Person_Department,
       SUM(CAST(Cost_of_Repairs AS int)) AS Total_Cost_Of_Repairs
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY Sales_Person_Department


-- ADVANCED QUESTIONS

-- 21. Calculate profit per Shop Name.

SELECT Shop_Name,
       SUM(Sale_Price - Cost_Price) AS Profit_Per_Shop_Name
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY Shop_Name


-- 22. Calculate profit margin per sale ((Sale Price - Cost Price) / Sale Price).

SELECT
      PC_Make,
      SUM(Sale_Price) AS Revenue,
      SUM(Sale_Price) * 100.0
      / SUM(SUM(Sale_Price))
      OVER () AS Revenue_Percentage
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY PC_Make
ORDER BY Revenue

-- 23. Determine which Continent has the highest total revenue.

SELECT TOP 1 Continent,
       SUM(CAST(Sale_Price AS bigint)) AS Total_Revenue
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY Continent
ORDER BY Total_Revenue DESC


-- 24. Calculate average Sale Price per RAM size.

SELECT RAM,
       AVG(Sale_Price) AS Average_Sale_Price
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY RAM

-- 25. Find the PC Model with the highest Sale Price.

SELECT TOP 1 PC_Model,
       (Sale_Price) AS Highest_Sale_Price
FROM [PC_Sales].[dbo].[Laptops_Data]
ORDER BY Sale_Price DESC


-- 26. Calculate the average number of days between Purchase Date and Ship Date.

SELECT AVG(DATEDIFF(Day,
       TRY_CAST (Purchase_date AS datetime),
       TRY_CAST (Ship_Date AS datetime))) AS Days_between_PD_SD
FROM [PC_Sales].[dbo].[Laptops_Data]
WHERE Purchase_Date IS NOT NULL AND Ship_Date IS NOT NULL


-- 27. Determine which Sales Person Department generates the highest revenue.

SELECT Sales_Person_Department,
       SUM(CAST(Sale_Price - Discount_Amount AS BIGINT)) AS Total_Revenue
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY Sales_Person_Department
ORDER BY Total_Revenue DESC


-- 28. Calculate total revenue per Storage Capacity.

SELECT Storage_Capacity,
       SUM(CAST(Sale_Price - Discount_Amount AS BIGINT)) AS Total_Revenue
FROM [PC_Sales].[dbo].[Laptops_Data]
GROUP BY Storage_Capacity
ORDER BY Total_Revenue DESC


-- 29. Identify sales where Sale Price is lower than PC Market Price.

SELECT Sale_Price,
       PC_Market_Price
FROM [PC_Sales].[dbo].[Laptops_Data]
WHERE Sale_Price < PC_Market_Price


-- 30. Rank Sales Person Name by Total Sales per Employee using a window function.

SELECT Sales_Person_Name,
       Total_Sales_Per_Employee,
       RANK () OVER (ORDER BY Total_Sales_Per_Employee DESC) Sales_Rank
FROM [PC_Sales].[dbo].[Laptops_Data]
