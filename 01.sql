--Вариант 7_1
--1
--Показать все поля из таблицы Production.ProductSubCategory 
SELECT *
FROM Production.ProductSubcategory;

--2
--Показать поля ProductReviewID, ProductID, ReviewerName из таблицы Production.ProductReview
SELECT ProductReviewID, ProductID, ReviewerName 
FROM Production.ProductReview

--3 + 4
--Показать поля ProductID, StartDate, EndDate, StandardCost из таблицы Production.ProductCostHistory.
--Показать только те записи, для которых стандартная стоимость (StandardCost) больше $150 и меньше $200
--и известна дата окончания стоимости продукта (EndDate). Использовать оператор BETWEEN
SELECT ProductID, StartDate, EndDate, StandardCost
FROM Production.ProductCostHistory
WHERE (StandardCost BETWEEN '150' AND '200') AND (EndDate IS NOT NULL)

--5
--Из таблицы Production.ProductPhoto показать ID фотографии товара (ProductPhotoID) и название файла
--с полноразмерной фотографией (LargePhotoFileName). Показать только те товары, миниатюрные фото
--(ThumbnailPhotoFileName) которых содержать в названии «зеленый» ('green')
SELECT ProductPhotoID, LargePhotoFileName, ThumbnailPhotoFileName
FROM Production.ProductPhoto 
WHERE ThumbnailPhotoFileName LIKE '%green%'

--6
--Показать поля BusinessEntityID, AccountNumber, Name из таблицы Purchasing.Vendor.
--Показать только значения поля Name из списка ('Australia Bike Retailer', 'Chicago Rent-All',
--'Light Speed', 'First National Sport Co.'). Использовать оператор IN
SELECT BusinessEntityID, AccountNumber, [Name]
FROM Purchasing.Vendor
WHERE Name IN ('Australia Bike Retailer', 'Chicago Rent-All', 'Light Speed', 'First National Sport Co.')

--7
--Из таблицы Production.Document показать место документа в памяти (DocumentNode), заголовок документа (Title), 
--расширение файла (FileExtension). Показать только строки со значением NULL в поле DocumentSummary
--и заменить все значения NULL в данном поле на 'No' («нет»). Названия полей оставить без изменений
SELECT DocumentNode, Title, FileExtension, ISNULL(DocumentSummary, 'No') AS DocumentSummary
FROM Production.Document 
WHERE DocumentSummary IS NULL

--8
--Показать поля ProductID, Name из таблицы Production.Product с применением функции COALESCE(). 
--Показать поле Meauserement, так, чтобы, если значение в поле Weight известно, то показать его,
--а иначе, показать значение в поле Style. Если и в поле Style значение неизвестно, то вывести значение 'UNKNOWN'
SELECT  ProductID, [Name], COALESCE (CAST(Weight AS NVARCHAR(12)), ProductLine, 'UNKNOWN') AS Meauserement
FROM Production.Product

--9
--Из таблицы Production.WorkOrderRouting показать уникальные значения поля ProductID и поле LocationID.
--Отсортировать все строки в алфавитном порядке относительно поля LocationID
SELECT DISTINCT ProductID, LocationID
FROM Production.WorkOrderRouting
ORDER BY LocationID

--10
--Из таблицы Purchasing.Vendor показать поля BusinessEntityID, AccountNumber, Name и ActiveFlag,
--если значение последнего поля равно 0. В поле ActiveFlag заменить все значения 0 на NULL,
--а название поля заменить на 'Vendor is actively used'
SELECT BusinessEntityID, AccountNumber, Name, NULLIF (ActiveFlag, '0') AS 'Vendor is actively used'
FROM Purchasing.Vendor
WHERE ActiveFlag = '0'
