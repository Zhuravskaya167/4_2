--1. ������� ������ ������ �� ��� id
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
--����������
SELECT DISTINCT dbo.SearchByID(113) AS [Full Name]
FROM ARTISTS

--2. ������� ������ ������ �� ��� ���� ��������
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
--����������
SELECT DISTINCT dbo.SearchByDateOfBirth('15.04.1452') AS [Full Name]
FROM ARTISTS


--3. ������� ������ ������ �� ID �������
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
--����������
SELECT DISTINCT dbo.SearchArtistByIDOfPictures (1141) AS [Full Name]
FROM ARTISTS