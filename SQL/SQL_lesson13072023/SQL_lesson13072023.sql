-- #**Группировка** - объединение записей на основе общего признака с целью получения обобщеных данных
--**Пример. Вывести страны покупателей с количеством клиентов из каждой**
-- (количественное распределение клиентов по странам
SELECT DISTINCT
	Country
FROM Customers

--

SELECT
	Country,
	COUNT(*) AS total_customers

FROM Customers

GROUP BY Country

ORDER BY total_customers DESC


-- # Пример. Количественное распределение товаров по категориям 
SELECT
	CategoryID,
	COUNT(*) AS total_products
FROM Products

GROUP BY CategoryID

ORDER BY total_products DESC

--

SELECT
	Categories.CategoryName,
	COUNT(*) AS total_products
	-- AVG(Products.Price) AS avg_price

FROM Products

JOIN Categories ON Products.CategoryID=Categories.CategoryID

GROUP BY Products.CategoryID

ORDER BY total_products DESC


-- # Задача. Вывести ТОП-3 менеджеров по ко-ву заказов (фамилия_менеджера, ко-во_заказов)
SELECT 
	Employees.LastName,
	COUNT(*) AS total_orders

FROM Orders

JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID

GROUP BY Employees.EmployeeID

ORDER BY total_orders DESC
LIMIT 3

-- # Задача. Найти сред/стоимость товара для каждого поставщика
SELECT
		Suppliers.SupplierName,
    AVG(Price) AS avg_price
FROM Products

JOIN Suppliers USING(SupplierID)

GROUP BY SupplierID


-- # Задача. Вывести ТОП-1 компанию (и ко-во перевезенных заказов) по количеству доставленных заказов
SELECT
		Shippers.ShipperName,
    COUNT(*) AS total_orders
FROM Orders

JOIN Shippers USING(ShipperID)

GROUP BY ShipperID

ORDER BY total_orders DESC
LIMIT 1


-- # Задача. Вывести страны, в которые было отправлено 3 и более заказов
SELECT
		Customers.Country,
    COUNT(*) AS total_orders
FROM Orders

JOIN Customers ON Orders.CustomerID=Customers.CustomerID

GROUP BY Customers.Country
HAVING total_orders>=3

ORDER BY total_orders DESC 

-- # **Задача. Вывести заказы со стоимостью от `5000` EUR**
--(проекция: `номер_заказа`, `стоимость_заказа`)
SELECT
		OrderDetails.OrderID,
    SUM(OrderDetails.Quantity * Products.Price) AS order_cost
FROM OrderDetails

JOIN Products USING(ProductID)

GROUP BY OrderDetails.OrderID
HAVING
	order_cost >= 5000

ORDER BY order_cost DESC


-- # Пример. Расчитать З/П менеджероb
SELECT
		Employees.LastName,
    SUM(OrderDetails.Quantity * Products.Price) * .05 AS salary
FROM OrderDetails

JOIN Products ON OrderDetails.ProductID=Products.ProductID
JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID

GROUP BY Orders.EmployeeID

ORDER BY salary DESC