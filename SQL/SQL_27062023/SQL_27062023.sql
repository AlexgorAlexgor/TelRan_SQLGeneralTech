SELECT first_name, last_name, (
    CASE
      WHEN salary < 5000 THEN 0
      WHEN salary < 10000 THEN 1
      ELSE 2
    END
  ) AS salary_cat
FROM hr.employees
ORDER BY salary_cat;


SELECT
		Products.ProductName,
    Products.Price,
    Categories.CategoryName
FROM Products

JOIN Categories ON Products.CategoryID=Categories.CategoryID



--title, react.created_at,  value

SELECT title, reactions.created_at,  value
from steams as S
JOIN reactions as R 
using(stream_id);

SELECT S.title,
  R.created_at,
  R.value
FROM streams AS S
  LEFT JOIN reactions AS R USING(stream_id);


SELECT S.title, R.created_at,  R.value username
from steams as S
Left JOIN reactions as R using(stream_id);
left JOIN users as U on  U.user_id=R.author_id;

SELECT first_name,
  last_name
FROM hr.employees
WHERE first_name LIKE '__t%';
 
 
-- @block
-- %tt % Matt _ %tt %_ Matthew __t % _ - 1 любой % - 0..n любых символов 
-- @block
SELECT salary AS salary_number,
  IF(salary > 5000, 1, 0) AS salary_cat,
  IF(department_id = 40, 1, 0) AS dep_cat
FROM hr.employees AS E;
 
 
-- @block
SELECT first_name,
  last_name,
  (
    CASE
      WHEN salary < 5000 THEN 0
      WHEN salary < 10000 THEN 1
      ELSE 2
    END
  ) AS salary_cat
FROM hr.employees
ORDER BY salary_cat;
 
 
-- @block
SELECT NOW();
 
 
-- @block
SELECT *
FROM Orders AS O
  LEFT JOIN Customers AS C ON O.CustomerID = C.CustomerID
  LEFT JOIN Discounts AS D ON D.CustomerID = O.CustomerID;
 
 
-- @block
SELECT *
FROM Orders
  INNER JOIN Customers USING(CustomerID)
  INNER JOIN Discounts USING(DiscountID);
 
 
-- @block
USE hr;
 
 
hr.employees -- @block
DROP DATABASE IF qwerty;
 
 
-- @block
SELECT username,
  title
FROM streams AS S
  LEFT JOIN users AS U ON S.author_id = U.user_id;
 
 
-- @block
SELECT S.title,
  R.created_at,
  R.value
FROM streams AS S
  LEFT JOIN reactions AS R USING(stream_id);
 
  -- @block
SELECT S.title,
  R.created_at,
  R.value,
  username
FROM streams AS S
  LEFT JOIN reactions AS R USING(stream_id)
  LEFT JOIN users as U ON R.author_id = U.user_id;