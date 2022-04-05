--Создание таблицы Картины:

CREATE TABLE PICTURES
(
ID_Picture INT PRIMARY KEY NONCLUSTERED NOT NULL,
Direction INT FOREIGN KEY REFERENCES DIRECTION (ID_Direction),
ID_Artist INT FOREIGN KEY REFERENCES ARTISTS (ID_Artist),
Title VARCHAR (55),
[Year of writing] INT,
Genre VARCHAR (40)
);
