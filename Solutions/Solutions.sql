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


-- 12. Calculate total profit (SUM of Sale Price - Cost Price).


-- 13. Find the average Discount Amount.


-- 14. Calculate total Finance Amount issued.


-- 15. Find total revenue per PC Make.


-- 16. Find average Sale Price per Storage Type.


-- 17. Calculate total revenue per Shop Name.


-- 18. Calculate total revenue per Sales Person Name.


-- 19. Find average Credit Score per Payment Method.


-- 20. Calculate total Cost of Repairs per Sales Person Department.

-- ADVANCED QUESTIONS

-- 21. Calculate profit per Shop Name.
-- 22. Calculate profit margin per sale ((Sale Price - Cost Price) / Sale Price).
-- 23. Determine which Continent has the highest total revenue.
-- 24. Calculate average Sale Price per RAM size.
-- 25. Find the PC Model with the highest Sale Price.
-- 26. Calculate the average number of days between Purchase Date and Ship Date.
-- 27. Determine which Sales Person Department generates the highest revenue.
-- 28. Calculate total revenue per Storage Capacity.
-- 29. Identify sales where Sale Price is lower than PC Market Price.
-- 30. Rank Sales Person Name by Total Sales per Employee using a window function.
