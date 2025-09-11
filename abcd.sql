-- 1.   จงแสดงให้เห็นว่าพนักงานแต่ละคนขายสินค้าประเภท Beverage ได้เป็นจำนวนเท่าใด และเป็นจำนวนกี่ชิ้น เฉพาะครึ่งปีแรกของ 2540(ทศนิยม 4 ตำแหน่ง)
SELECT E.EmployeeID, E.FirstName, E.LastName, SUM(OD.Quantity) AS TotalQuantity, COUNT(OD.ProductID) AS NumberOfProducts
FROM Employees E
JOIN Orders O ON E.EmployeeID = O.EmployeeID
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE C.CategoryName = 'Beverages' AND O.OrderDate >= '1997-01-01' AND O.OrderDate < '1997-07-01'
GROUP BY E.EmployeeID, E.FirstName, E.LastName
ORDER BY E.EmployeeID;

-- 2.   จงแสดงชื่อบริษัทตัวแทนจำหน่าย  เบอร์โทร เบอร์แฟกซ์ ชื่อผู้ติดต่อ จำนวนชนิดสินค้าประเภท Beverage ที่จำหน่าย โดยแสดงจำนวนสินค้า จากมากไปน้อย 3 อันดับแรก
SELECT C.CompanyName, C.Phone, C.Fax, C.ContactName, COUNT(DISTINCT P.ProductID) AS NumberOfBeverageProducts
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
JOIN Categories Cat ON P.CategoryID = Cat.CategoryID
WHERE Cat.CategoryName = 'Beverages'
GROUP BY C.CompanyName, C.Phone, C.Fax, C.ContactName
ORDER BY NumberOfBeverageProducts DESC
LIMIT 3;

-- 3.   จงแสดงข้อมูลชื่อลูกค้า ชื่อผู้ติดต่อ เบอร์โทรศัพท์ ของลูกค้าที่ซื้อของในเดือน สิงหาคม 2539 ยอดรวมของการซื้อโดยแสดงเฉพาะ ลูกค้าที่ไม่มีเบอร์แฟกซ์
SELECT C.CompanyName, C.ContactName, C.Phone
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.OrderDate >= '1996-08-01' AND O.OrderDate < '1996-09-01' AND C.Fax IS NULL;

-- 4.   แสดงรหัสสินค้า ชื่อสินค้า จำนวนที่ขายได้ทั้งหมดในปี 2541 ยอดเงินรวมที่ขายได้ทั้งหมดโดยเรียงลำดับตาม จำนวนที่ขายได้เรียงจากน้อยไปมาก พรอ้มทั้งใส่ลำดับที่ ให้กับรายการแต่ละรายการด้วย
SELECT P.ProductID, P.ProductName, SUM(OD.Quantity) AS TotalQuantitySold, SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSalesAmount,
       ROW_NUMBER() OVER (ORDER BY SUM(OD.Quantity) ASC) AS Rank
FROM Products P
JOIN [Order Details] OD ON P.ProductID = OD.ProductID
JOIN Orders O ON OD.OrderID = O.OrderID
WHERE O.OrderDate >= '1998-01-01' AND O.OrderDate < '1999-01-01'
GROUP BY P.ProductID, P.ProductName
ORDER BY TotalQuantitySold ASC;

-- 5.   จงแสดงข้อมูลของสินค้าที่ขายในเดือนมกราคม 2540 เรียงตามลำดับจากมากไปน้อย 5 อันดับใส่ลำดับด้วย รวมถึงราคาเฉลี่ยที่ขายให้ลูกค้าทั้งหมดด้วย
SELECT P.ProductID, P.ProductName, SUM(OD.Quantity) AS TotalQuantitySold, 
       AVG(OD.UnitPrice * (1 - OD.Discount)) AS AveragePrice,
       ROW_NUMBER() OVER (ORDER BY SUM(OD.Quantity) DESC) AS Rank
FROM Products P
JOIN [Order Details] OD ON P.ProductID = OD.ProductID
JOIN Orders O ON OD.OrderID = O.OrderID
WHERE O.OrderDate >= '1997-01-01' AND O.OrderDate < '1997-02-01'
GROUP BY P.ProductID, P.ProductName
ORDER BY TotalQuantitySold DESC
LIMIT 5;

-- 6.   จงแสดงชื่อพนักงาน จำนวนใบสั่งซื้อ ยอดเงินรวมทั้งหมด ที่พนักงานแต่ละคนขายได้ ในเดือน ธันวาคม 2539 โดยแสดงเพียง 5 อันดับที่มากที่สุด
SELECT E.EmployeeID, E.FirstName, E.LastName, COUNT(DISTINCT O.OrderID) AS NumberOfOrders,
       SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSalesAmount
FROM Employees E
JOIN Orders O ON E.EmployeeID = O.EmployeeID
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
WHERE O.OrderDate >= '1996-12-01' AND O.OrderDate < '1997-01-01'
GROUP BY E.EmployeeID, E.FirstName, E.LastName
ORDER BY TotalSalesAmount DESC
LIMIT 5;




      
