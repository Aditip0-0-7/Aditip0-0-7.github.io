SELECT * FROM Products
SELECT * FROM Employees
SELECT * FROM EmployeesID,firsname,lastname FROM Employees

SELECT * FROM Employees WHERE City = 'London'

SELECT * FROM Employees 
WHERE City = 'London'

SELECT City,COuntry 
FROM Customers

SELECT DiSTINCT City, Country 
FROM Customers

SELECT *
FROM Products
WHERE UnitPrice > 200

SELECT *
FROM Customers
WHERE City = 'London'
OR City = 'vancouver'

SELECT *
FROM Customers
WHERE Country = 'USA'
OR City = 'vancouver'

SELECT *
FROM Products
WHERE UnitPrice>=50
and UnitsInStock<20

SELECT *
FROM Products
WHERE UnitsInStock< 20
OR UnitsInStock <= ReorderLevel

SELECT *
FROM Products
WHERE UnitPrice BETWEEN 50 AND 100

SELECT *
FROM Products
WHERE UnitPrice>= 50 and UnitPrice<= 100

SELECT *
FROM Customers
WHERE Country IN('Brazil','Argentina','Mexico')

SELECT *
FROM Employees
WHERE FirstName LIKE 'n%'

SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%'

SELECT *
FROM Customers
WHERE CompanyName LIKE '%y'

SELECT firstname, lastname
FROM Employees
WHERE FirstName LIKE '%an%'

SELECT *
FROM Employees
WHERE FirstName LIKE '_____'

SELECT Country
FROM Customers
WHERE CompanyName LIKE 'a%'

SELECT * FROM Products
SELECT * FROM Employees
SELECT * FROM EmployeesID,firsname,lastname FROM Employees

SELECT * FROM Employees WHERE City = 'London'

SELECT * FROM Employees 
WHERE City = 'London'

SELECT City,COuntry 
FROM Customers

SELECT DiSTINCT City, Country 
FROM Customers

SELECT *
FROM Products
WHERE UnitPrice > 200

SELECT *
FROM Customers
WHERE City = 'London'
OR City = 'vancouver'

SELECT *
FROM Customers
WHERE Country = 'USA'
OR City = 'vancouver'

SELECT *
FROM Products
WHERE UnitPrice>=50
and UnitsInStock<20

SELECT *
FROM Products
WHERE UnitsInStock< 20
OR UnitsInStock <= ReorderLevel

SELECT *
FROM Products
WHERE UnitPrice BETWEEN 50 AND 100

SELECT *
FROM Products
WHERE UnitPrice>= 50 and UnitPrice<= 100

SELECT *
FROM Customers
WHERE Country IN('Brazil','Argentina','Mexico')

SELECT *
FROM Employees
WHERE FirstName LIKE 'n%'

SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%'

SELECT *
FROM Customers
WHERE CompanyName LIKE '%y'

SELECT firstname, lastname
FROM Employees
WHERE FirstName LIKE '%an%'

SELECT ProductID,ProductName,UnitPrice
FROM Products
ORDER BY UnitPrice DESC

SELECT ProductID,ProductName,UnitPrice
FROM Products
ORDER BY UnitPrice 

SELECT companyname,co


SELECT top 10 Productname,unitprice,UnitsInStock
FROM Products
ORDER BY UnitsInStock DESC

SELECT CategoryID,ProductName,Unitprice
FROM Products
ORDER BY CategoryID ASC, UnitPrice DESC








