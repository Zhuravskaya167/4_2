--1. Функция поиска автора по его id
CREATE FUNCTION SearchByID (@ID INT)
RETURNS VARCHAR(60)
AS
BEGIN
RETURN
(
SELECT [Full Name]
FROM ARTISTS
WHERE ID_Artist = @ID
)
END

--DROP FUNCTION SearchByID
--Реализация
SELECT DISTINCT dbo.SearchByID(113) AS [Full Name]
FROM ARTISTS

--2. Функция поиска автора по его дате рождения
CREATE FUNCTION SearchByDateOfBirth (@D DATE)
RETURNS VARCHAR(60)
AS
BEGIN
RETURN
(
SELECT [Full Name]
FROM ARTISTS
WHERE [Date of birth] = @D
)
END

--DROP FUNCTION SearchByDateOfBirth
--Реализация
SELECT DISTINCT dbo.SearchByDateOfBirth('15.04.1452') AS [Full Name]
FROM ARTISTS


--3. Функция поиска автора по ID картины
CREATE FUNCTION SearchArtistByIDOfPictures (@ID INT) 
RETURNS VARCHAR(60)
AS
BEGIN
RETURN
(
SELECT [Full Name]
FROM ARTISTS AS A
INNER JOIN PICTURES AS P
ON A.ID_Artist = P.ID_Artist
WHERE ID_Picture = @ID
)
END

--DROP FUNCTION SearchArtistByIDOfPictures
--Реализация
SELECT DISTINCT dbo.SearchArtistByIDOfPictures (1141) AS [Full Name]
FROM ARTISTS