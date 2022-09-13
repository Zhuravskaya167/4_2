--В каком зале проходит выставка у Айвазовского?

SELECT Hall
FROM EXPOSITIONS
WHERE [Name] LIKE '%Aivazovsky%'

--Выведете среднюю цену билетов;

SELECT AVG(Cost) AS [AVG]
FROM EXPOSITIONS

--Выведете ID направления modernism.

SELECT ID_Direction
FROM DIRECTION
WHERE [Name] = 'modernism'

--Найдите художника по его ID; (также можно реализовать с помощью функции или процедуры)

SELECT *
FROM ARTISTS
WHERE ID_Artist = '113';

--На какие выставки можно попасть 04.07.2022?

SELECT [Name]														--, [Start date], [Date end]
FROM EXPOSITIONS
WHERE '04.07.2022' > [Start date] AND '04.07.2022' < [Date end]

--Создать перекрестный запрос «Картины-Выставки», в котором на пересечении строк и столбцов
--должно определяться количество произведений искусства, выставленных на определенной выставке;

SELECT COUNT(P.ID_Picture) AS 'Count'
FROM PICTURES AS P
INNER JOIN PICTURES_EXPOSITIONS AS PE
ON P.ID_Picture = PE.ID_Picture
INNER JOIN EXPOSITIONS AS E
ON PE.ID_Exposition = E.ID_Exposition
WHERE E.ID_Exposition = '7'

--Какие залы мне необходимо посетить, если я хочу посмотреть произведения искусства периода барокко и ренессанса?

SELECT Hall
FROM EXPOSITIONS
WHERE [Name] LIKE '%Baroque%' OR [Name] LIKE '%Renaissance%'

--Какие картины я смогу посмотреть, если приду в картинную галерею 05 апреля 2022 года,
--не покупая билет на выставку, который открывает доступ на просмотр всех картин?

SELECT DISTINCT P.Title
FROM PICTURES AS P
INNER JOIN PICTURES_EXPOSITIONS AS PE
ON P.ID_Picture = PE.ID_Picture
INNER JOIN EXPOSITIONS AS E
ON PE.ID_Exposition = E.ID_Exposition
WHERE '05.04.2022' > E.[Start date] AND '05.04.2022' < E.[Date end] AND E.[Name] <> 'All'

--Вывести в порядке возрастания направления и их количество выставленных картин в текущий момент времени;

SELECT COUNT(D.[Name]) AS 'Count', D.[Name]
FROM DIRECTION AS D
INNER JOIN PICTURES AS P
ON D.ID_Direction = P.Direction
INNER JOIN PICTURES_EXPOSITIONS AS PE
ON P.ID_Picture = PE.ID_Picture
INNER JOIN EXPOSITIONS AS E
ON PE.ID_Exposition = E.ID_Exposition
WHERE GETDATE() > E.[Start date] AND GETDATE() < E.[Date end]
GROUP BY D.[Name]
ORDER BY 'Count'

--Определить художников, которые писали картины в разных направлениях;
--???SELF JOIN???
SELECT DISTINCT A.[Full Name], D.[Name]
FROM ARTISTS AS A
INNER JOIN PICTURES AS P
ON A.ID_Artist = P.ID_Artist
INNER JOIN DIRECTION AS D
ON P.Direction = D.ID_Direction 
--AND D.ID_Direction <> P.Direction
GROUP BY A.[Full Name], D.[Name]

--Определить год, в который было написано больше всего картин;
--1, хитрый
SELECT TOP(1) MAX([Year of writing]) AS M, COUNT([Year of writing]) AS 'Count'
FROM PICTURES
GROUP BY [Year of writing]
ORDER BY [Count] DESC

--Определить художника, который написал больше всего картин;
--1
SELECT TOP(1) A.[Full Name], COUNT(P.Title) AS 'Count'
FROM ARTISTS AS A, PICTURES AS P
WHERE A.ID_Artist = P.ID_Artist
GROUP BY A.[Full Name]
ORDER BY [Count] DESC

--Определить выставку с наибольшим количеством картин;

SELECT TOP(1) E.[Name], COUNT(P.Title) AS 'Count'
FROM EXPOSITIONS AS E
INNER JOIN PICTURES_EXPOSITIONS AS PE
ON E.ID_Exposition = PE.ID_Exposition
INNER JOIN PICTURES AS P
ON PE.ID_Picture = P.ID_Picture
GROUP BY E.[Name]
ORDER BY 'Count' DESC

