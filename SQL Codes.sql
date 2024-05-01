--What are the most popular products among customers?
SELECT TOP 10
    Product.Name AS ProductName,
    SUM(SalesOrderDetail.OrderQty) AS TotalQuantitySold
FROM Sales.SalesOrderDetail AS SalesOrderDetail
INNER JOIN Production.Product AS Product
    ON SalesOrderDetail.ProductID = Product.ProductID
GROUP BY Product.Name
ORDER BY TotalQuantitySold DESC;


--Which geographic regions generate the most sales?
SELECT
    SalesTerritory.[Group] AS GeographicRegion,
    ROUND(SUM(SalesOrderHeader.TotalDue), 2) AS TotalSales
FROM Sales.SalesOrderHeader AS SalesOrderHeader
INNER JOIN Sales.Customer AS Customer
    ON SalesOrderHeader.CustomerID = Customer.CustomerID
INNER JOIN Sales.SalesTerritory AS SalesTerritory
    ON SalesOrderHeader.TerritoryID = SalesTerritory.TerritoryID
GROUP BY SalesTerritory.[Group]
ORDER BY TotalSales DESC;


--How has sales volume changed over time?
SELECT 
    YEAR(OrderDate) AS SalesYear, 
    ROUND(SUM(TotalDue), 2) AS TotalSales 
FROM Sales.SalesOrderHeader 
GROUP BY YEAR(OrderDate)
ORDER BY SalesYear


--Which customer segments generate the most revenue?
SELECT 
    CASE 
        WHEN Customer.AccountNumber LIKE 'AW%' THEN 'A'
        WHEN Customer.AccountNumber LIKE 'CB%' THEN 'C'
        ELSE 'B'
    END AS CustomerSegment,
    SUM(SalesOrderHeader.TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader AS SalesOrderHeader
INNER JOIN Sales.Customer AS Customer
    ON SalesOrderHeader.CustomerID = Customer.CustomerID
GROUP BY 
    CASE 
        WHEN Customer.AccountNumber LIKE 'AW%' THEN 'A'
        WHEN Customer.AccountNumber LIKE 'CB%' THEN 'C'
        ELSE 'B'
    END
ORDER BY 
    TotalRevenue DESC;

--Confirmatory test 
SELECT COUNT(DISTINCT 
    CASE 
        WHEN Customer.AccountNumber LIKE 'AW%' THEN 'A'
        WHEN Customer.AccountNumber LIKE 'CB%' THEN 'C'
        ELSE 'B'
    END) AS UniqueCustomerSegments
FROM Sales.SalesOrderHeader AS SalesOrderHeader
INNER JOIN Sales.Customer AS Customer
    ON SalesOrderHeader.CustomerID = Customer.CustomerID;


--How effective are promotional campaigns in driving sales?
SELECT
    SalesMonth,
    ROUND(SUM(MonthlySalesRevenue), 2) AS TotalSalesRevenue,
    MAX(PromotionRunning) AS PromotionRunning
FROM (
    SELECT
        CONVERT(CHAR(7), SalesOrderHeader.OrderDate, 120) AS SalesMonth,
        SUM(SalesOrderDetail.LineTotal) AS MonthlySalesRevenue,
        CASE
            WHEN EXISTS (
                SELECT 1 FROM Sales.SpecialOffer AS SO
                WHERE SalesOrderHeader.SalesOrderID IN (
                    SELECT SalesOrderID FROM Sales.SalesOrderDetail
                    WHERE SpecialOfferID = SO.SpecialOfferID
                )
                AND GETDATE() BETWEEN SO.StartDate AND SO.EndDate
            )
            THEN 'Yes'
            ELSE 'No'
        END AS PromotionRunning
    FROM 
        Sales.SalesOrderDetail AS SalesOrderDetail
    INNER JOIN 
        Sales.SalesOrderHeader AS SalesOrderHeader 
        ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
    GROUP BY 
        CONVERT(CHAR(7), SalesOrderHeader.OrderDate, 120),
        SalesOrderHeader.SalesOrderID
) AS MonthlySales
GROUP BY 
    SalesMonth
ORDER BY 
    SalesMonth DESC;


--Which salespeople are the most successful?
SELECT 
    sp.BusinessEntityID, 
    ROUND(SUM(soh.TotalDue), 2) AS TotalSales, 
    sp.SalesQuota
FROM Sales.SalesPerson sp
JOIN Sales.SalesOrderHeader soh
    ON sp.BusinessEntityID = soh.SalesPersonID
GROUP BY sp.BusinessEntityID, sp.SalesQuota
ORDER BY TotalSales DESC;



--How does sales performance vary by geographic region?
SELECT 
  ST.Name AS TerritoryName, 
  SUM(SOH.TotalDue) AS TotalSales
FROM 
  Sales.SalesOrderHeader SOH 
  INNER JOIN Sales.Customer C ON SOH.CustomerID = C.CustomerID
  INNER JOIN Sales.SalesPerson SP ON SOH.SalesPersonID = SP.BusinessEntityID
  INNER JOIN Sales.SalesTerritory ST ON SP.TerritoryID = ST.TerritoryID
GROUP BY 
  ST.Name
ORDER BY 
  TotalSales DESC;


--Are there any correlations between salesperson characteristics and performance?
SELECT 
    sp.TerritoryID,
    sp.SalesQuota,
    SUM(soh.TotalDue) AS TotalSales
FROM 
    Sales.SalesPerson sp
    INNER JOIN Sales.SalesOrderHeader soh ON sp.BusinessEntityID = soh.SalesPersonID
GROUP BY 
    sp.TerritoryID,
    sp.SalesQuota
ORDER BY 
    TotalSales DESC;


--Which territories generate the most revenue?
SELECT st.TerritoryID, st.Name AS TerritoryName, ROUND(SUM(soh.TotalDue), 2) AS TotalRevenue
FROM Sales.SalesTerritory st
INNER JOIN Sales.SalesOrderHeader soh ON st.TerritoryID = soh.TerritoryID
GROUP BY st.TerritoryID, st.Name
ORDER BY TotalRevenue DESC;


--How does sales performance vary by territory?
SELECT 
  st.Name AS TerritoryName,
  ROUND(SUM(soh.TotalDue), 2) AS TotalSales,
  AVG(sod.OrderQty) AS AvgOrderQuantity,
  AVG(sod.LineTotal) AS AvgOrderValue
FROM 
  Sales.SalesOrderHeader AS soh
  INNER JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
  INNER JOIN Sales.SalesPerson AS sp ON soh.SalesPersonID = sp.BusinessEntityID
  INNER JOIN Sales.SalesTerritory AS st ON sp.TerritoryID = st.TerritoryID
GROUP BY 
  st.Name
ORDER BY 
  TotalSales DESC;


--What are the most profitable products?
SELECT TOP 10 
    p.Name AS ProductName, 
    SUM(od.LineTotal) AS TotalSales, 
    SUM(od.LineTotal - (od.OrderQty * p.StandardCost)) AS TotalProfit,
    (SUM(od.LineTotal - (od.OrderQty * p.StandardCost)) / SUM(od.LineTotal)) * 100 AS ProfitMargin
FROM 
    Sales.SalesOrderDetail od
    INNER JOIN Production.Product p ON od.ProductID = p.ProductID
GROUP BY 
    p.Name
ORDER BY 
    ProfitMargin DESC;


--Are there any patterns or trends in product sales over time?
SELECT CONVERT(date, MAX(Sales.SalesOrderHeader.OrderDate)) AS MaxOrderDate, 
       YEAR(Sales.SalesOrderHeader.OrderDate) AS OrderYear, 
       MONTH(Sales.SalesOrderHeader.OrderDate) AS OrderMonth,
       SUM(Sales.SalesOrderDetail.LineTotal) AS TotalSales
FROM Sales.SalesOrderHeader
JOIN Sales.SalesOrderDetail ON Sales.SalesOrderHeader.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID
GROUP BY YEAR(Sales.SalesOrderHeader.OrderDate), MONTH(Sales.SalesOrderHeader.OrderDate)
ORDER BY OrderYear, OrderMonth;



--How does product popularity vary by geographic region?
SELECT TOP 10 
    p.Name AS ProductName,
    st.Name AS TerritoryName,
    SUM(od.OrderQty) AS TotalQuantitySold
FROM 
    Sales.SalesOrderDetail od
    INNER JOIN Production.Product p ON od.ProductID = p.ProductID
    INNER JOIN Sales.SalesOrderHeader oh ON od.SalesOrderID = oh.SalesOrderID
    INNER JOIN Sales.SalesTerritory st ON oh.TerritoryID = st.TerritoryID
GROUP BY 
    p.Name, 
    st.Name
ORDER BY 
    TotalQuantitySold DESC;



--How does supplier performance vary by product category?
SELECT pc.Name AS CategoryName, v.Name AS VendorName,
    COUNT(DISTINCT po.PurchaseOrderID) AS TotalOrders,
    SUM(pod.OrderQty * pod.UnitPrice) AS TotalSpent
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS pcs ON pcs.ProductSubcategoryID = p.ProductSubcategoryID
JOIN Production.ProductCategory AS pc ON pc.ProductCategoryID = pcs.ProductCategoryID
JOIN Purchasing.PurchaseOrderDetail AS pod ON pod.ProductID = p.ProductID
JOIN Purchasing.PurchaseOrderHeader AS po ON po.PurchaseOrderID = pod.PurchaseOrderID
JOIN Purchasing.Vendor AS v ON v.BusinessEntityID = po.VendorID
GROUP BY pc.Name, v.Name
ORDER BY pc.Name ASC, TotalSpent DESC;


--Total Revenue by Order Year and Quarter
  SELECT YEAR(OrderDate) AS OrderYear, DATEPART(QUARTER, OrderDate) AS OrderQuarter, SUM(TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), DATEPART(QUARTER, OrderDate);