USE [AMA_MAAME]
GO

SELECT [pizza_id]
      ,[order_id]
      ,[pizza_name_id]
      ,[quantity]
      ,[order_date]
      ,[order_time]
      ,[unit_price]
      ,[total_price]
      ,[pizza_size]
      ,[pizza_category]
      ,[pizza_ingredients]
      ,[pizza_name]
  FROM [dbo].[pizza_sales$]

GO


--1	Total Revenue
SELECT SUM([total_price]) AS TOTAL_REVENUE
FROM [dbo].[pizza_sales$]

--2	Total Pizzas Sold
SELECT SUM([quantity]) AS TOTAL_PIZZA_SOLD
FROM [dbo].[pizza_sales$]

--3	Total number of Orders
SELECT COUNT([order_id]) AS TOTAL_ORDERS
FROM [dbo].[pizza_sales$]
--4	How many order Veggie pizza category was sold
SELECT SUM([quantity]) AS VEGGIE_ORDERS
FROM [dbo].[pizza_sales$]
WHERE [pizza_category] = 'VEGGIE'

--5	How many  The Hawaiian Pizza and  The Greek Pizza  was sold
SELECT  [pizza_name]
		,SUM([quantity])
FROM [dbo].[pizza_sales$]
WHERE [pizza_name] IN ('The Hawaiian Pizza','The Greek Pizza')
GROUP BY  [pizza_name] 

--6	List of pizza ordered in January 2015
SELECT [order_date],[pizza_name]
FROM [dbo].[pizza_sales$]
WHERE [order_date] BETWEEN '2015-01-01' AND '2015-01-31'


--7	List of pizza ordered between 1st of November till 31st December 2015
SELECT [order_date],[pizza_name]
FROM [dbo].[pizza_sales$]
WHERE [order_date] BETWEEN '2015-11-01' AND '2015-12-31'
--8	What is the quantity of The Spinach Supreme Pizza sold in March 2015

SELECT  [pizza_name]
	,SUM([quantity]) AS QTY_SOLD_MARCH
FROM [dbo].[pizza_sales$]
WHERE [pizza_name] = 'The Spinach Supreme Pizza'
  AND [order_date] BETWEEN '2015-03-01' AND '2015-03-31'
GROUP BY [pizza_name]

--9	List of Medium pizza sold
SELECT  [pizza_name],[pizza_size]
FROM [dbo].[pizza_sales$]
WHERE [pizza_size] = 'M'
  
--10	List of pizza that sold for more than 12.5

SELECT  [pizza_name],[unit_price]
FROM [dbo].[pizza_sales$]
WHERE [unit_price] >'12.5'
