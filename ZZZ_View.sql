--Создание представления общей таблицы Картины-Художники по ключу ID_Artist
CREATE VIEW vPicArt
AS
SELECT P.ID_Artist, P.Title, A.[Full Name]
FROM PICTURES AS P
INNER JOIN ARTISTS AS A
ON P.ID_Artist = A.ID_Artist

SELECT *
FROM vPicArt