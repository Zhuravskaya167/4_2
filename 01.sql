--������� 7_1
--1
--�������� ��� ���� �� ������� Production.ProductSubCategory 
SELECT *
FROM Production.ProductSubcategory;

--2
--�������� ���� ProductReviewID, ProductID, ReviewerName �� ������� Production.ProductReview
SELECT ProductReviewID, ProductID, ReviewerName 
FROM Production.ProductReview

--3 + 4
--�������� ���� ProductID, StartDate, EndDate, StandardCost �� ������� Production.ProductCostHistory.
--�������� ������ �� ������, ��� ������� ����������� ��������� (StandardCost) ������ $150 � ������ $200
--� �������� ���� ��������� ��������� �������� (EndDate). ������������ �������� BETWEEN
SELECT ProductID, StartDate, EndDate, StandardCost
FROM Production.ProductCostHistory
WHERE (StandardCost BETWEEN '150' AND '200') AND (EndDate IS NOT NULL)

--5
--�� ������� Production.ProductPhoto �������� ID ���������� ������ (ProductPhotoID) � �������� �����
--� �������������� ����������� (LargePhotoFileName). �������� ������ �� ������, ����������� ����
--(ThumbnailPhotoFileName) ������� ��������� � �������� �������� ('green')
SELECT ProductPhotoID, LargePhotoFileName, ThumbnailPhotoFileName
FROM Production.ProductPhoto 
WHERE ThumbnailPhotoFileName LIKE '%green%'

--6
--�������� ���� BusinessEntityID, AccountNumber, Name �� ������� Purchasing.Vendor.
--�������� ������ �������� ���� Name �� ������ ('Australia Bike Retailer', 'Chicago Rent-All',
--'Light Speed', 'First National Sport Co.'). ������������ �������� IN
SELECT BusinessEntityID, AccountNumber, [Name]
FROM Purchasing.Vendor
WHERE Name IN ('Australia Bike Retailer', 'Chicago Rent-All', 'Light Speed', 'First National Sport Co.')

--7
--�� ������� Production.Document �������� ����� ��������� � ������ (DocumentNode), ��������� ��������� (Title), 
--���������� ����� (FileExtension). �������� ������ ������ �� ��������� NULL � ���� DocumentSummary
--� �������� ��� �������� NULL � ������ ���� �� 'No' (����). �������� ����� �������� ��� ���������
SELECT DocumentNode, Title, FileExtension, ISNULL(DocumentSummary, 'No') AS DocumentSummary
FROM Production.Document 
WHERE DocumentSummary IS NULL

--8
--�������� ���� ProductID, Name �� ������� Production.Product � ����������� ������� COALESCE(). 
--�������� ���� Meauserement, ���, �����, ���� �������� � ���� Weight ��������, �� �������� ���,
--� �����, �������� �������� � ���� Style. ���� � � ���� Style �������� ����������, �� ������� �������� 'UNKNOWN'
SELECT  ProductID, [Name], COALESCE (CAST(Weight AS NVARCHAR(12)), ProductLine, 'UNKNOWN') AS Meauserement
FROM Production.Product

--9
--�� ������� Production.WorkOrderRouting �������� ���������� �������� ���� ProductID � ���� LocationID.
--������������� ��� ������ � ���������� ������� ������������ ���� LocationID
SELECT DISTINCT ProductID, LocationID
FROM Production.WorkOrderRouting
ORDER BY LocationID

--10
--�� ������� Purchasing.Vendor �������� ���� BusinessEntityID, AccountNumber, Name � ActiveFlag,
--���� �������� ���������� ���� ����� 0. � ���� ActiveFlag �������� ��� �������� 0 �� NULL,
--� �������� ���� �������� �� 'Vendor is actively used'
SELECT BusinessEntityID, AccountNumber, Name, NULLIF (ActiveFlag, '0') AS 'Vendor is actively used'
FROM Purchasing.Vendor
WHERE ActiveFlag = '0'
