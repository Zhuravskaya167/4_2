--Создание таблицы "Художники"

CREATE TABLE ARTISTS
(
ID_Artist INT PRIMARY KEY NONCLUSTERED NOT NULL,
[Full Name] VARCHAR (55) NOT NULL UNIQUE,
[Date of birth] DATE,
[Place of birth] VARCHAR (25)
);
