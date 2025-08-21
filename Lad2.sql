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

select e.EmployeeID, FirstName , count(*) as [จำานวน order]
, sum(freight) as [Sum of Freight]
from Employees e join Orders o on e.EmployeeID = o.EmployeeID
where year(orderdate) = 1998
group by e.EmployeeID, FirstName

--ต้องการชื่อบริษัทผขนส่ง และจำนวนใบสั่งซื้อที่เกี่ยวข้อง
SELECT s.CompanyName, COUNT(o.OrderID) AS จำนวนใบสั่งซื้อ
FROM Shippers s
JOIN Orders o ON s.ShipperID = o.ShipVia
GROUP BY s.CompanyName;



--ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทีทั้งหมดที่ขายได้
SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS จำนวนที่ขายได้
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName;

--ต้องการรหัสสินค้า ชื่อสินค้า ที่  nancy ขายได้ ทั้งหมด เรียงตามลำดับชืรอสินค้า
SELECT distinct p.ProductID, p.ProductName 
FROM Employees e 
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE e.FirstName = 'Nancy'
ORDER BY p.ProductID

--ต้องาการชื่อบริษัทลูกค้าชื่อ Around the Horn ซื้อสินค้าที่มาจากประเทศอะไรบ้าง
SELECT DISTINCT s.Country
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE c.CompanyName = 'Around the Horn'

-- บริษัทลูกค้าชื่อ Around the Horn ซื้อสินค้าอะไรบ้าง จำนวนเท่าไหร่

SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS จำนวนที่ซื้อ
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE c.CompanyName = 'Around the Horn'
GROUP BY p.ProductID, p.ProductName

--ต้องการหมายเลขใบสั่งซื้อ ชื่อพนักงาน และยอดขายในใบสั่งซื้อนั้น
SELECT o.OrderID, firstname, ROUND(SUM(od.Quantity* od.UnitPrice * (1 - od.Discount)),2) TotalCash
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, e.FirstName;

