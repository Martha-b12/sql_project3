---1.1
-- Query to retrieve sales data grouped by product category and aggregated over time
SELECT 
    pc.Name AS ProductCategory,
    YEAR(soh.OrderDate) AS OrderYear,
    MONTH(soh.OrderDate) AS OrderMonth,
    SUM(sod.LineTotal) AS TotalSalesAmount
FROM 
    Sales.SalesOrderHeader soh
INNER JOIN 
    Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN 
    Production.Product p ON sod.ProductID = p.ProductID
INNER JOIN 
    Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN 
    Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY 
    pc.Name, YEAR(soh.OrderDate), MONTH(soh.OrderDate)
ORDER BY 
    pc.Name, YEAR(soh.OrderDate), MONTH(soh.OrderDate);