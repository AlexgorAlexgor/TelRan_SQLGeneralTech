SELECT * 
FROM [Customers]
where CustomerName like "usa"


SELECT * 
FROM [Customers]
where CustomerName like "t%"


SELECT * FROM [Customers]
where CustomerName like "%sp%"

SELECT * FROM [Employees]
where LastName like "%ler%"

SELECT * FROM [Customers]
where country like 'f%' 
/* CustomerID	CustomerName	ContactName	Address	City	PostalCode	Country
7	Blondel père et fils	Frédérique Citeaux	24, place Kléber	Strasbourg	67000	France
9	Bon app'	Laurence Lebihans	12, rue des Bouchers	Marseille	13008	France
18	Du monde entier	Janine Labrune	67, rue des Cinquante Otages	Nantes	44000	France
23	Folies gourmandes	Martine Rancé	184, chaussée de Tournai	Lille	59000	France
26	France restauration	Carine Schmitt	54, rue Royale	Nantes	44000	France
40	La corne d'abondance	Daniel Tonini	67, avenue de l'Europe	Versailles	78000	France
41	La maison d'Asie	Annette Roulet	1 rue Alsace-Lorraine	Toulouse	31000	France
57	Paris spécialités	Marie Bertrand	265, boulevard Charonne	Paris	75012	France
74	Spécialités du monde	Dominique Perrier	25, rue Lauriston	Paris	75016	France
84	Victuailles en stock	Mary Saveley	2, rue du Commerce	Lyon	69004	France
85	Vins et alcools Chevalier	Paul Henriot	59 rue de l'Abbaye	Reims	51100	France
87	Wartian Herkku	Pirkko Koskitalo	Torikatu 38	Oulu	90110	Finland
90	Wilman Kala	Matti Karttunen	Keskuskatu 45	Helsinki	21240	Finland */

SELECT *,
round (price* 1.06, 2) as price_USD
FROM [Products]


SELECT * , 
case 
when Price >= 100 then true
              else false
              end AS is_premium
FROM [Products]


SELECT * , case 
      when Price >= 100 then  price* 0.9
      when Price >=50  then price* 0.85
              else Price 
              END  AS Price_down
FROM [Products]

SELECT * , 
case when Country in ("Germany" ,"France")  then true
      else false
              END  AS is_europe
FROM customers

SELECT * ,
case when 
CategoryID in (3, 5) and price >= 20 
 then Round(price *1.125, 2)
else price
end as price_up

SELECT * 
FROM Orders
join Customers on 
Orders.CustomerID= Customers.CustomerID

SELECT * 
FROM Customers
join Orders on 
Customers.CustomerID = Orders.CustomerID

SELECT Orders.OrderID, Customers.CustomerName, Customers.Country
FROM Customers
join Orders on 
Customers.CustomerID = Orders.CustomerID

SELECT Orders.OrderID, Customers.CustomerName, Customers.Country
FROM Orders
join Customers on 
 Orders.CustomerID = Customers.CustomerID


select Products.ProductName,
Products.Price * 1.06 Price_USD,
Categories.CategoryName
from products
join Categories on Products.CategoryID = Categories.CategoryID

SELECT *
FROM Orders
join Shippers on Orders.ShipperID=Shippers.ShipperID
where ShipperName = "Speedy Express"

select *
from Products
join Suppliers on Suppliers.SupplierID=Products.SupplierID

SELECT
	Orders.OrderID,
	Customers.CustomerName,
	Customers.Country,
	Employees.FirstName,
	Employees.LastName 
FROM Orders
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
WHERE  Customers.Country IN ('Germany', 'UK', 'USA');

SELECT *
FROM Products
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE	Suppliers.Country IN ('Japan') and
price between 10 and 150;

SELECT
	Products.ProductName,
    Products.Price AS Price_full,
    Round(Products.Price * .85,2) AS Price_discount_15_perc,
    Suppliers.SupplierName
FROM Products
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE Suppliers.Country ='Japan'
	AND
	Products.Price BETWEEN 10 AND 150