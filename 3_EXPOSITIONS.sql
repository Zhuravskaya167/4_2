--Создание таблицы Выставки

CREATE TABLE EXPOSITIONS
(
ID_Exposition INT PRIMARY KEY NONCLUSTERED NOT NULL,
[Name] VARCHAR (55) NOT NULL UNIQUE,
[Start date] DATE,
[Date end] DATE,
Hall INT,
Cost MONEY
);