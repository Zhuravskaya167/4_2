--¬ариант 7_3
--1
--ѕоказать скидку на цену за штуку (UnitPriceDiscount) и пол€ Name, ProductNumber из таблиц Production.Product,
--Sales.SalesOrderDetail.
SELECT ProductNumber, [Name], UnitPriceDiscount
FROM Production.Product AS PP
JOIN Sales.SalesOrderDetail AS SS ON PP.ProductID = SS.ProductID
ORDER BY PP.ProductID

SELECT *
FROM Production.Product --ProductID
SELECT *
FROM Sales.SalesOrderDetail --SalesOrderID, SalesOrderDetailID, ProductID, SpecialOfferID

--2
--ѕоказать список людей (пол€ FirstName, LastName), в котором указан Ђузелї человека (OrganizationNode)в организации или нет,
--из таблиц Person.Person, HumanResources.Employee, использу€ LEFT OUTER JOIN.
SELECT FirstName, LastName, OrganizationNode
FROM Person.Person AS PP
LEFT OUTER JOIN HumanResources.Employee AS HR ON PP.BusinessEntityID = HR.BusinessEntityID

SELECT *
FROM Person.Person --BusinessEntityID
SELECT *
FROM HumanResources.Employee --BusinessEntityID, NationalIDNumber, LoginID

--3
--ѕоказать список товаров (поле Name), в котором указан, есть ли у товара дата окончани€ отслеживани€ цены (EndDate) или нет,
--из таблицы Production.ProductListPriceHistory, Production.Product, использу€ RIGHT OUTER JOIN.
SELECT [Name], EndDate
FROM Production.ProductListPriceHistory AS PPH
RIGHT OUTER JOIN Production.Product AS PP ON PPH.ProductID = PP.ProductID

SELECT *
FROM Production.ProductListPriceHistory --ProductID
SELECT *
FROM Production.Product --ProductID, productSubcategoryID, ProductModelID

--4
--ѕоказать список продуктов (ProductID), которые имеют несколько различных количеств заказов (OrderQty),
--из таблицы Purchasing.PurchaseOrderDetail, использу€ SELF JOIN.
--≈ще примеры формулироовки с исп self join: какие производители произод€т все товары? какие товары производ€т все производители?
SELECT DISTINCT A.ProductID, A.OrderQty
FROM Purchasing.PurchaseOrderDetail AS A
INNER JOIN Purchasing.PurchaseOrderDetail AS B
ON A.ProductID = B.ProductID
WHERE A.OrderQty <> B.OrderQty;

SELECT *
FROM Purchasing.PurchaseOrderDetail --PurchaseOrderID, PurchaseOrderDetailID, ProductID

--5
--ѕоказать список количеств заказов (OrderQty), к которым относ€тс€ несколько продуктов (ProductID),
--из таблицы Purchasing.PurchaseOrderDetail, использу€ SELF JOIN.
SELECT DISTINCT A.ProductID, A.OrderQty
FROM Purchasing.PurchaseOrderDetail AS A
INNER JOIN Purchasing.PurchaseOrderDetail AS B
ON A.OrderQty = B.OrderQty
AND A.ProductID <> B.ProductID

SELECT *
FROM Purchasing.PurchaseOrderDetail --PurchaseOrderID, PurchaseOrderDetailID, ProductID

--6
--ѕоказать список моделей продуктов (ProductModelID), которые имеют несколько несколько цен реализации (ListPrice) больше 100,
--из таблицы Production.Product, использу€ SELF JOIN.
SELECT A.ProductModelID, B.ListPrice							--DISTINCT
FROM Production.Product A, Production.Product B
WHERE B.ListPrice > '100'

SELECT *
FROM Production.Product

--7
--ѕоказать комбинированный список таблиц Person.Person, Person.BusinessEntityAddress по пол€м BusinessEntityID, rowguid,
--ModifiedDate, использу€ UNION.
SELECT PP.BusinessEntityID, PP.rowguid, PP.ModifiedDate
FROM Person.Person PP
UNION
SELECT PB.BusinessEntityID, PB.rowguid, PB.ModifiedDate
FROM Person.BusinessEntityAddress PB

SELECT *
FROM Person.Person 
SELECT *
FROM Person.BusinessEntityAddress

--8
--ѕоказать список ProductID, которые содержатс€ в таблице Production.Product, но не содержатс€ в таблице Production.ProductInventory.
SELECT A.ProductID
FROM Production.Product A
EXCEPT
SELECT B.ProductID
FROM Production.ProductInventory B

SELECT *
FROM Production.Product
SELECT *
FROM Production.ProductInventory