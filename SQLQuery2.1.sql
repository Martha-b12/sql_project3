--2.1 
    SELECT 
    c.CustomerID,
    COUNT(soh.SalesOrderID) AS PurchaseFrequency,
    SUM(soh.TotalDue) AS TotalSpend
FROM 
    Sales.Customer c
INNER JOIN 
    Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY 
    c.CustomerID
ORDER BY 
    c.CustomerID;