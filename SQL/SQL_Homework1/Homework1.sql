

select *
from Customers
 WHERE country IN ("USA", "UK")
 
--  1
 SELECT ProductName , Price
FROM Products
-- where Price >= 20 and price <=200
where price between 20 and 200
ORDER BY Price

-- 2
SELECT CustomerName , Country
FROM [Customers]
where country not in ("USA","Germany")


-- 3
SELECT * FROM [Orders]
order by  OrderDate DESC
limit 2

SELECT * 
FROM Orders
order by  OrderDate 
limit 2

-- 4
SELECT * FROM [Products]
order by Price desc
limit 2

-- 5
SELECT ProductName,
price * 1.06 AS Price_usd
-- ROUND(Price * 1.06, 2) AS Price_usd
FROM Products
where price <= 250 and CategoryID in (3, 5)
order by price 
limit 3

--6
--## Удаление записей / оператор `DELETE FROM`
--Пример. Удалить всех клиентов из `USA`
DELETE FROM Customers
WHERE
	Country='USA'

--7
--## Удаление записей / оператор `DELETE FROM`
--Пример. Удалить всех клиентов из `USA`
	DELETE FROM  [Products]

    WHERE
    CategoryID =5 or
    price between 20 and 120


    Country