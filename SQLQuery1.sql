SELECT 
    YEAR(soh.OrderDate) AS OrderYear,
    pc.Name AS ProductCategory,
    SUM(sod.LineTotal) AS TotalSalesAmount
FROM 
    Sales.SalesOrderHeader soh
JOIN 
    Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    Production.Product p ON sod.ProductID = p.ProductID
JOIN 
    Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN 
    Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE 
    soh.OrderDate >= DATEADD(year, -3, GETDATE())  -- Sales data for the past three years
GROUP BY 
    YEAR(soh.OrderDate),
    pc.Name
ORDER BY 
    OrderYear DESC,
    TotalSalesAmount DESC;
