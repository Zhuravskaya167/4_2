--������� 7_3
--1
--�������� ������ �� ���� �� ����� (UnitPriceDiscount) � ���� Name, ProductNumber �� ������ Production.Product,
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
--�������� ������ ����� (���� FirstName, LastName), � ������� ������ ����� �������� (OrganizationNode)� ����������� ��� ���,
--�� ������ Person.Person, HumanResources.Employee, ��������� LEFT OUTER JOIN.
SELECT FirstName, LastName, OrganizationNode
FROM Person.Person AS PP
LEFT OUTER JOIN HumanResources.Employee AS HR ON PP.BusinessEntityID = HR.BusinessEntityID

SELECT *
FROM Person.Person --BusinessEntityID
SELECT *
FROM HumanResources.Employee --BusinessEntityID, NationalIDNumber, LoginID

--3
--�������� ������ ������� (���� Name), � ������� ������, ���� �� � ������ ���� ��������� ������������ ���� (EndDate) ��� ���,
--�� ������� Production.ProductListPriceHistory, Production.Product, ��������� RIGHT OUTER JOIN.
SELECT [Name], EndDate
FROM Production.ProductListPriceHistory AS PPH
RIGHT OUTER JOIN Production.Product AS PP ON PPH.ProductID = PP.ProductID

SELECT *
FROM Production.ProductListPriceHistory --ProductID
SELECT *
FROM Production.Product --ProductID, productSubcategoryID, ProductModelID

--4
--�������� ������ ��������� (ProductID), ������� ����� ��������� ��������� ��������� ������� (OrderQty),
--�� ������� Purchasing.PurchaseOrderDetail, ��������� SELF JOIN.
--��� ������� ������������� � ��� self join: ����� ������������� ��������� ��� ������? ����� ������ ���������� ��� �������������?
SELECT DISTINCT A.ProductID, A.OrderQty
FROM Purchasing.PurchaseOrderDetail AS A
INNER JOIN Purchasing.PurchaseOrderDetail AS B
ON A.ProductID = B.ProductID
WHERE A.OrderQty <> B.OrderQty;

SELECT *
FROM Purchasing.PurchaseOrderDetail --PurchaseOrderID, PurchaseOrderDetailID, ProductID

--5
--�������� ������ ��������� ������� (OrderQty), � ������� ��������� ��������� ��������� (ProductID),
--�� ������� Purchasing.PurchaseOrderDetail, ��������� SELF JOIN.
SELECT DISTINCT A.ProductID, A.OrderQty
FROM Purchasing.PurchaseOrderDetail AS A
INNER JOIN Purchasing.PurchaseOrderDetail AS B
ON A.OrderQty = B.OrderQty
AND A.ProductID <> B.ProductID

SELECT *
FROM Purchasing.PurchaseOrderDetail --PurchaseOrderID, PurchaseOrderDetailID, ProductID

--6
--�������� ������ ������� ��������� (ProductModelID), ������� ����� ��������� ��������� ��� ���������� (ListPrice) ������ 100,
--�� ������� Production.Product, ��������� SELF JOIN.
SELECT A.ProductModelID, B.ListPrice							--DISTINCT
FROM Production.Product A, Production.Product B
WHERE B.ListPrice > '100'

SELECT *
FROM Production.Product

--7
--�������� ��������������� ������ ������ Person.Person, Person.BusinessEntityAddress �� ����� BusinessEntityID, rowguid,
--ModifiedDate, ��������� UNION.
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
--�������� ������ ProductID, ������� ���������� � ������� Production.Product, �� �� ���������� � ������� Production.ProductInventory.
SELECT A.ProductID
FROM Production.Product A
EXCEPT
SELECT B.ProductID
FROM Production.ProductInventory B

SELECT *
FROM Production.Product
SELECT *
FROM Production.ProductInventory