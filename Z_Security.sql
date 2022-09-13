--Проверка обновления пакетов, защищающих сервер БД

SELECT CONVERT(char(20), SERVERPROPERTY('productlevel'));  

--Изменение прав на суерпользователя
ALTER AUTORIZATION ON DATABASE::COURSE02 TO sa;