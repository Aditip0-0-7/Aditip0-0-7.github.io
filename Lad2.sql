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

--ต้องการรหัสสินค้า ชื่อสินค้า บริษัทผู้จำหน่าย ประเมศ
SELECT p.ProductID, p.ProductName, s.CompanyName, s.Country 
FROM Products p 
JOIN Suppliers s 
ON p.SupplierID = s.SupplierID
WHERE s.Country IN ('USA', 'UK');


--ต้องการรหัสพนักงาน ชื่อพนักงาน รหัสใบสั่งซื้อที่เกี่ยวข้อง เรียงตามลำดับรหัสพนักงาน
SELECT e.EmployeeID, e.FirstName, e.LastName, o.OrderID
FROM Employees e
JOIN Orders o
ON e.EmployeeID = o.EmployeeID
WHERE o.OrderID IS NOT NULL
ORDER BY e.EmployeeID;


SELECT O.OrderID เลขใบสั่งซื้อ, C.CompanyName ลูกค้า,
E.FirstName พนักงาน, O.ShipAddress ส่งไปที่
FROM Orders O, Customers C, Employees E
WHERE O.CustomerID=C.CustomerID
AND O.EmployeeID=E.EmployeeID

SELECT O.OrderID เลขใบสั่งซื้อ, C.CompanyName ลูกค้า,
E.FirstName พนักงาน, O.ShipAddress ส่งไปที่
FROM Orders O
join Customers C on O.CustomerID=C.CustomerID
join Employees E on O.EmployeeID=E.EmployeeID


