--Вариант 7_2
--1
--Найти максимальную дату рождения из таблицы HumanResources.Employee
SELECT MAX(BirthDate)
FROM HumanResources.Employee

--2	
--Найти количество нулевых значений цвета (Color) из таблицы Production.Product.
SELECT COUNT (ISNULL(Color, 1))
FROM Production.Product
WHERE Color IS NULL

--3
--Показать суммарную и среднюю стоимость товаров каждого цвета из таблицы Production.Product (из выборки исключить пустые поля).
SELECT Color, SUM (ListPrice) AS 'SUM', AVG (ListPrice) AS 'AVG'
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY Color

--4
--Вывести профессии из таблицы HumanResources.Employee, где количество человек, принятых позже 2010 года, больше 1
SELECT JobTitle
FROM HumanResources.Employee
WHERE ModifiedDate > '01.01.2010'
GROUP BY JobTitle
HAVING COUNT (JobTitle) > 1

--4 (12 вариант)
--Найти профессии из таблицы HumanResources.Employee, где количество работников женского пола больше 1 (из выборки исключить пустые поля).
SELECT DISTINCT JobTitle AS AllJob
FROM HumanResources.Employee
WHERE Gender = 'F' AND JobTitle IS NOT NULL
GROUP BY JobTitle
HAVING (COUNT( Gender ) > 1)

--5
--Вывести EmployeeID, ShipDate и максимум по SubTotal для всевозможных EmployeeID с одинаковой ShipDate, предусмотреть
--вывод самого максимального StandardPrice за определнный ShipDate из таблицы Purchasing.PurchaseOrderHeader.
--(Использовать CUBE)
SELECT EmployeeID, ShipDate, MAX(SubTotal) AS StandardPrice
FROM Purchasing.PurchaseOrderHeader
GROUP BY CUBE (EmployeeID, ShipDate)

SELECT *
FROM Purchasing.PurchaseOrderHeader