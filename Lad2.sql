SELECT CategoryName, Productname, UnitPrice
FROM Products, Categories
WHERE Products.CategoryID = Categories.CategoryID

SELECT c.Categoryname, p.Productname, p.UnitPrice
FROM Products as p JOIN Categories as c 
ON p.CategoryID = c.CategoryID  

SELECT c.Categoryname, p.Productname, p.UnitPrice
FROM Products as p JOIN Categories as c 
ON p.CategoryID = c.CategoryID
WHERE CategoryName = 'seafood'

SELECT CompanyName, OrderID
FROM Orders, Shippers
WHERE Shippers.ShipperID = Orders.Shipvia

SELECT CompanyName, OrderID
FROM Orders JOIN Shippers
ON Shippers.ShipperID = Orders.Shipvia

SELECT CompanyName, OrderID
FROM Orders, Shippers
WHERE Shippers.ShipperID = Orders.Shipvia
AND OrderID = 10275

SELECT CompanyName, OrderID
FROM Orders JOIN Shippers
ON Shippers.ShipperID=Orders.Shipvia
WHERE OrderID=10275
