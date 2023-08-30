-- 1. Описать таблицу videos с исп. механизма Constraints (поля: id, название, продолжительность, статусопубликования, датавремя_добавления)

CREATE TABLE IF NOT EXISTS videos  (

video_id int primary key auto_increment,
title         varchar(128) not null,
duration int,
status    bool,
created_at timestamp default current_timestamp,

);


-- 2. Вывести товары, которые не были ни разу заказы (с помощью подзапросов)
SELECT *
FROM Products
WHERE ProductId NOT IN (SELECT ProductId FROM OrderDetails)

/* 
SELECT *
FROM Products LEFT JOIN OrderDetails using (ProductId)
WHERE OrderID is Null;

 */



-- 3. Вывести заказы, сделанные с 1 мая 2022 по 20 мая 2022 (в рамках новой БД, сделанной в "супер-песочнице")

SELECT * 
FROM orders 
WHERE 	created_at 
BETWEEN '2022-05-01' AND '2022-05-20'


