
--**Базовые операторы агрегации**

-- `COUNT()` расчет ко-ва строк
-- `AVG()` расчет сред/ариф. знач.
-- `MAX()` расчет макс. значения
-- `MIN()` расчет мин. значения
-- `SUM()` расчет суммы

--**Пример. Найти ко-во клиентов**
-- всего
SELECT
	COUNT(*) AS total_customers
FROM Customers


-- из Germany
SELECT
	COUNT(*) AS total_customers
FROM Customers

WHERE
	Country='Germany'

--Задача. Вывести ко-во поставщиков не из USA и не из Spain
SELECT
	COUNT(*) AS total_not_usa_spain_suppliers
FROM Suppliers

WHERE
	NOT Country IN ('USA', 'Spain')
--Пример. Вывести сред/стоимость товара
SELECT
	AVG(Price) AS avg_price
FROM Products

--Пример. Вывод статистики по товарам
SELECT
		COUNT(*) AS total_products,
    MAX(Price) AS max_price,
    MIN(Price) AS min_price,
    SUM(Price) AS total_cost,
    AVG(Price) AS total_price
FROM Products

--Задача. Посчитать стоимость заказа 10248
SELECT
	SUM(Products.Price * OrderDetails.Quantity) AS order_cost

FROM OrderDetails

JOIN Products ON OrderDetails.ProductID=Products.ProductID

WHERE
	OrderDetails.OrderID=10248


--Задача. Вывести среднюю стоимость товаров от поставщика 3 (название компании, сред/стоимость)
SELECT
	Suppliers.SupplierName , 
	Round(AVG(Products.Price),2) AS avg_price
FROM 	
	[Suppliers]
join 
	Products using (SupplierID)
where 
	SupplierID =3

--Задача. Вывести название и стоимость самого дорогого товара в 1 категории
SELECT ProductName ,
MAX(Price) AS max_price
FROM Products
WHERE CategoryID=1

--Задача. Вывести название и стоимость самого дешевого товара в ценовом диапазоне 10 - 150 EUR
SELECT ProductName ,
Min(Price) AS min_price
FROM Products
WHERE Price  between  10 and 150

--Задача. Вывести ко-во заказов, которые оформил клиент 1
SELECT
	COUNT(*) AS total_orders
FROM Orders

WHERE
	CustomerID=1

--Задача. Вывести, сколько раз был продан товар 72
SELECT COUNT(*) AS sold_count
FROM [OrderDetails]
where ProductID = 72

--Задача. Вывести ко-во клиентов из Берлина, Германия
SELECT COUNT(*) AS total_customers FROM [Customers]
where City in ("Berlin") and Country = "Germany"

--Задача. Вывести список стран, которые поставляют морепродукты (Seafood)
SELECT DISTINCT
	Suppliers.Country

FROM Products

JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
JOIN Categories ON Products.CategoryID=Categories.CategoryID

WHERE
	Categories.CategoryName='Seafood'

    --Задача. Вывести среднюю стоимость напитка из USA
SELECT 
	Categories.CategoryName,
     Suppliers.Country, 
     AVG(Products.Price) AS avg_price
FROM 	Products
JOIN 	Suppliers ON Products.SupplierID=Suppliers.SupplierID
JOIN 	Categories ON Products.CategoryID=Categories.CategoryID
WHERE 	Suppliers.Country='USA' 
	and CategoryName = "Beverages"

--Задача. Вывести ко-во заказов, которое компания Speedy Express доставила в Brazil
SELECT 	
    COUNT(*) AS total_shipped_to_brazil 
FROM 
    Orders
join 
    Shippers USING(ShipperID) 
join 
    Customers USING(CustomerID) 
where Shippers.ShipperName = "Speedy Express" 
    and  Customers.Country = "Brazil"