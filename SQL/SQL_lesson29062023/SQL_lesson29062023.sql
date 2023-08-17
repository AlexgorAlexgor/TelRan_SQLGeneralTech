select disting Country
from Customers
country like 'm%'

SELECT *,

	CASE
	    	WHEN Price >= 100 THEN Price * .9
				WHEN Price >= 50 THEN Price * .85
        ELSE Price
	END AS Price_down

FROM Products


UPDATE Products
	SET Price=

	CASE
	    	WHEN ProductID = 1 THEN Price * (1-.05)
        ELSE Price * (1-.1)
  END

WHERE
	ProductID IN (1, 2)



-- Вывести заказы имеющихся клиентов
SELECT *
FROM Orders
JOIN Customers ON Orders.CustomerID=Customers.CustomerID

-- Вывести ВСЕ заказы, включая заказы клиентов, которые были удалены
SELECT *
FROM Orders
LEFT JOIN Customers ON Orders.CustomerID=Customers.CustomerID

-- Вывести клиентов без заказов
SELECT *
FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID=Customers.CustomerID
WHERE
	Orders.OrderID IS null

--**Задача. Вывести информацию о заказах**
--проекция: `номер_заказа`, `фамилия_менеджера`)
    SELECT O.OrderID , E.LastName as LastName_Employee
FROM Orders as O
join Employees as E on E.EmployeeID=O.EmployeeID


--Задача. Вывести названия товаров, которые не были проданы ни разу
delete FROM [OrderDetails]
where OrderDetailID =1

SELECT 
	Products.ProductName
FROM Products

LEFT JOIN OrderDetails ON Products.ProductID=OrderDetails.ProductID

WHERE
	OrderDetails.ProductID IS NULL




--Задача. Вывести фамилии менеджеров, у которых отсутствуют заказы
SELECT Employees.LastName as LastName_employee
FROM Employees
left join Orders on Employees.EmployeeID=Orders.EmployeeID
where Orders.OrderID is null

--Задача. Вывести названия компаний-перевозчиков, у которых нет заказов
DELETE FROM Orders
WHERE
	ShipperID=3


SELECT *
FROM [Shippers]
left join Orders on Shippers.ShipperID=Orders.ShipperID
where Orders.OrderID is null


--## Вертикальное объединение таблиц
--
- Операторы
    - `UNION` только уникальные значения
   -- - `UNION ALL` все значения
    
  --  Примеры запросов
SELECT Country FROM Suppliers
UNION
SELECT Country FROM Customers


-- Вывести города поставщиков и клиентов только из Germany
SELECT City FROM Suppliers
WHERE Country='Germany'

UNION

SELECT City FROM Customers
WHERE Country='Germany'



-- Вывести названия и цены трех самых дорогих и самых дешевых товаров
(SELECT ProductName, Price
FROM Products
ORDER BY Price DESC
LIMIT 3)

UNION
(SELECT ProductName, Price
FROM Products
ORDER BY Price ASC
LIMIT 3)

--Задача. Вывести один самый новый и один самый старый заказы
(SELECT *
FROM orders
ORDER BY OrderDate DESC
LIMIT 1)

UNION

(SELECT *
FROM orders
ORDER BY OrderDate ASC
LIMIT 1)