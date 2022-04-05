--������� 7_2
--1
--����� ������������ ���� �������� �� ������� HumanResources.Employee
SELECT MAX(BirthDate)
FROM HumanResources.Employee

--2	
--����� ���������� ������� �������� ����� (Color) �� ������� Production.Product.
SELECT COUNT (ISNULL(Color, 1))
FROM Production.Product
WHERE Color IS NULL

--3
--�������� ��������� � ������� ��������� ������� ������� ����� �� ������� Production.Product (�� ������� ��������� ������ ����).
SELECT Color, SUM (ListPrice) AS 'SUM', AVG (ListPrice) AS 'AVG'
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY Color

--4
--������� ��������� �� ������� HumanResources.Employee, ��� ���������� �������, �������� ����� 2010 ����, ������ 1
SELECT JobTitle
FROM HumanResources.Employee
WHERE ModifiedDate > '01.01.2010'
GROUP BY JobTitle
HAVING COUNT (JobTitle) > 1

--4 (12 �������)
--����� ��������� �� ������� HumanResources.Employee, ��� ���������� ���������� �������� ���� ������ 1 (�� ������� ��������� ������ ����).
SELECT DISTINCT JobTitle AS AllJob
FROM HumanResources.Employee
WHERE Gender = 'F' AND JobTitle IS NOT NULL
GROUP BY JobTitle
HAVING (COUNT( Gender ) > 1)

--5
--������� EmployeeID, ShipDate � �������� �� SubTotal ��� ������������ EmployeeID � ���������� ShipDate, �������������
--����� ������ ������������� StandardPrice �� ����������� ShipDate �� ������� Purchasing.PurchaseOrderHeader.
--(������������ CUBE)
SELECT EmployeeID, ShipDate, MAX(SubTotal) AS StandardPrice
FROM Purchasing.PurchaseOrderHeader
GROUP BY CUBE (EmployeeID, ShipDate)

SELECT *
FROM Purchasing.PurchaseOrderHeader