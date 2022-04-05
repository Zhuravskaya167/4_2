--������� 7_4
--1
--�������� ������������ ������� � ����� ������� ����������� ����� (������� Production.Product).
DECLARE @I MONEY;
SET @I =	
	(
	SELECT MAX(StandardCost)
	FROM Production.Product
	);
PRINT @I;
SELECT [Name], StandardCost
FROM Production.Product
WHERE StandardCost = @I

SELECT *
FROM Production.Product

--� �����������

SELECT [Name], StandardCost
FROM Production.Product
WHERE StandardCost =
	  (
		SELECT MAX(StandardCost)
		FROM Production.Product
	  );

--2
--�������� ���������� ����������� � ���������, �� ������� �������� ����������� ���������� �����������
--(������������� [HumanResources].[vEmployeeDepartment]).
SELECT TOP(30) JobTitle, COUNT(JobTitle) AS 'Count'
FROM [HumanResources].[vEmployeeDepartment]
GROUP BY JobTitle
ORDER BY Count

SELECT *
FROM [HumanResources].[vEmployeeDepartment]

--3
--��������������� �������
--�������� ������, ��� ������� ���������� ������ ���� ����� � ����� ������� (����� � ������ ���������)
--(������� Production.Product). �������� ���� [Name], Style � Size.
--3.1
SELECT [Name], Style, Size
FROM Production.Product
WHERE Size IS NOT NULL AND Style IS NOT NULL
GROUP BY [Name], Size, Style

--3.2
SELECT p1.[Name], p1.Style, p1.Size
FROM Production.Product AS p1
WHERE p1.Size IS NOT NULL AND p1.Style IN
	(
	SELECT p2.Style
	FROM Production.Product AS p2
	WHERE p2.Style IS NOT NULL AND p2.Size IS NOT NULL
	)



--4
--�������� ������, ���� ������� ����� ����������� (������ ����) ���� ������ ��� �� ������� ���������
--(������� ��������� ����������) (������� Production.Product). �������� ���� [Name], ListPrice � ProductLine.
SELECT p1.[Name], p1.ListPrice, p1.ProductLine
FROM Production.Product AS p1
WHERE p1.Size IS NOT NULL AND p1.ListPrice = 
	(
	SELECT MIN(p2.ListPrice)
	FROM Production.Product AS p2
	WHERE p1.Style = p2.Style
	)
ORDER BY p1.ListPrice

--5
--�������� ������, ���� ������� ������ ������� ���� � �����(ANY/ALL) ������� ��������� (������� ��������� ����������)
--(������� Production.Product). �������� ���� [Name], ListPrice � ProductLine.
SELECT [Name], ListPrice, ProductLine
FROM Production.Product
WHERE ProductLine IS NOT NULL AND ListPrice < 
		(
		SELECT MIN([Avg])
		FROM 
			(
			SELECT AVG(ListPrice) AS [Avg]
			FROM Production.Product
			WHERE ListPrice > 0
			)
		AS T
		)
ORDER BY ListPrice