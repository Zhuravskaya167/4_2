--Создание таблицы Картины-Выставки для разрыва связи многие-ко-многим

CREATE TABLE PICTURES_EXPOSITIONS
(
ID_Picture_Exposition INT PRIMARY KEY NONCLUSTERED,
ID_Picture INT FOREIGN KEY REFERENCES PICTURES (ID_Picture) NOT NULL,
ID_Exposition INT FOREIGN KEY REFERENCES EXPOSITIONS (ID_Exposition) NOT NULL
);
