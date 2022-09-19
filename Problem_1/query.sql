-- not feasible solution

SELECT
   *
FROM 
   pizzaOrders
WHERE 
   order = 'Margherita' OR order = 'Prosciutto'

-- Pivot via case

SELECT 
	customerId,
	SUM ( CASE 
			WHEN [order] = 'Prosciutto' THEN 1
			ELSE 0
		  END
		) AS Prosciutto ,
	SUM ( CASE 
			WHEN [order] = 'Margherita' THEN 1
			ELSE 0
		  END
		) AS Margherita 
FROM 
	[pizzaPlace].[orders]
GROUP BY 
	customerId

-- pivot table can be used to find the right customers

WITH pivotedTable AS (
    SELECT 
	customerId,
	SUM ( CASE 
			WHEN [order] = 'Prosciutto' THEN 1
			ELSE 0
		  END
		) AS Prosciutto ,
	SUM ( CASE 
			WHEN [order] = 'Margherita' THEN 1
			ELSE 0
		  END
		) AS Margherita 
FROM 
	[pizzaPlace].[orders]
GROUP BY 
	customerId
)
SELECT 
    customerId
FROM 
    pivotedTable
WHERE   
    Margherita = 1 AND Prosciutto = 1

-- using count to find the right customers

SELECT 
  customerId
FROM
  [pizzaPlace].[orders]
WHERE 
   [order] = 'Margherita' OR [order] = 'Prosciutto'
GROUP BY 
  customerId
HAVING 
  COUNT(*) = 2

-- get list of all orders from filtered customers

WITH filteredCustomers AS (
SELECT 
  customerId
FROM
  [pizzaPlace].[orders]
WHERE 
   [order] = 'Margherita' OR [order] = 'Prosciutto'
GROUP BY 
  customerId
HAVING 
  COUNT(*) = 2)

SELECT 
	customerId,
	 STRING_AGG(CONVERT(NVARCHAR(max), [order]), ',')
FROM
	[pizzaPlace].[orders]
WHERE
	customerId IN (SELECT * from filteredCustomers)
GROUP BY 
	customerId