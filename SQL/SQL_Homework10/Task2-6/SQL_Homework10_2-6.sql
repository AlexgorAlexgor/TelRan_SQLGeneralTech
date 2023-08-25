--#2.Вывести три самых продаваемых товара

SELECT ProductName, ProductID , Quantity
FROM [OrderDetails] join Products using (ProductID)
group by ProductID
order by Quantity desc
limit 3
/* Result:
Number of Records: 3
ProductName	          ProductID	Quantity
Chocolade	               48	70
Northwoods Cranberry Sauce	8	70
Chef Anton's Gumbo Mix	    5	65 */

--#3.Очистить почтовый индекс у всех клиентов не из China
update Customers
set PostalCode =''
WHERE Country <> 'China'

/* Result:
You have made changes to the database. Rows affected: 91

SELECT * FROM [Customers]
Result:
Number of Records: 91
 */

--#4. Вывести данные о поставщике, который находится на четвертом месте по ко-ву поставленных товаров

SELECT SupplierID, SupplierName , count(SupplierID)as count_products_from_supplier 
FROM [Products] join Suppliers using(SupplierID)
group by SupplierID
order by count_products_from_supplier desc
limit 3, 1

/* Result:
Number of Records: 1
SupplierID	SupplierName	             count_products_from_supplier
2	        New Orleans Cajun Delights	 4 
*/

--#5 Вывести среднюю стоимость заказа

SELECT  avg (Price*Quantity)as average_order_value
FROM [OrderDetails]
join Products using (ProductID) 

/* Result:
Number of Records: 1
average_order_value
745.992722007722 */

--#6 Вывести товары со скидочной ценой (скидка 15%)

SELECT *, Round(Price*0.85,2) as Price_discont_15percent FROM [Products]

/* Result:
Number of Records: 77
ProductID	ProductName	SupplierID	CategoryID	Unit	   Price  Price_discont_15percent
1	        Chais	    1	        1	      10 boxesx20 bags 18	15.3
2	        Chang	    1           1	      24-12 oz bottles 19	16.15 
*/