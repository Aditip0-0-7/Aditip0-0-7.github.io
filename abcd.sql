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

-- 7.   จงแสดงรหัสสินค้า ชื่อสินค้า ชื่อประเภทสินค้า ที่มียอดขาย สูงสุด 10 อันดับแรก ในเดือน ธันวาคม 2539 โดยแสดงยอดขาย และจำนวนที่ขายด้วย
SELECT P.ProductID, P.ProductName, C.CategoryName,
       SUM(OD.Quantity) AS TotalQuantitySold,
       SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSalesAmount
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
JOIN [Order Details] OD ON P.ProductID = OD.ProductID
JOIN Orders O ON OD.OrderID = O.OrderID
WHERE O.OrderDate >= '1996-12-01' AND O.OrderDate < '1997-01-01'
GROUP BY P.ProductID, P.ProductName, C.CategoryName
ORDER BY TotalSalesAmount DESC
LIMIT 10;
-- 8.   จงแสดงหมายเลขใบสั่งซื้อ ชื่อบริษัทลูกค้า ที่อยู่ เมืองประเทศของลูกค้า ชื่อเต็มพนักงานผู้รับผิดชอบ ยอดรวมในแต่ละใบสั่งซื้อ จำนวนรายการสินค้าในใบสั่งซื้อ และเลือกแสดงเฉพาะที่จำนวนรายการในใบสั่งซื้อมากกว่า 2 รายการ
SELECT O.OrderID, C.CompanyName, C.Address, C.City, C.Country,
       E.FirstName + ' ' + E.LastName AS EmployeeFullName,
       SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalOrderAmount,
       COUNT(OD.ProductID) AS NumberOfItems
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
JOIN Employees E ON O.EmployeeID = E.EmployeeID
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY O.OrderID, C.CompanyName, C.Address, C.City, C.Country, E.FirstName, E.LastName
HAVING COUNT(OD.ProductID) > 2;

-- 9.   จงแสดง ชื่อบริษัทลูกค้า ชื่อผู้ติดต่อ เบอร์โทร เบอร์แฟกซ์ ยอดที่สั่งซื้อทั้งหมดในเดือน ธันวาคม 2539 แสดงผลเฉพาะลูกค้าที่มีเบอร์แฟกซ์
SELECT C.CompanyName, C.ContactName, C.Phone, C.Fax,
       SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalOrderAmount
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
WHERE O.OrderDate >= '1996-12-01' AND O.OrderDate < '1997-01-01' AND C.Fax IS NOT NULL
GROUP BY C.CompanyName, C.ContactName, C.Phone, C.Fax;

-- 10.  จงแสดงชื่อเต็มพนักงาน จำนวนใบสั่งซื้อที่รับผิดชอบ ยอดขายรวมทั้งหมด เฉพาะในไตรมาสสุดท้ายของปี 2539 เรียงตามลำดับ มากไปน้อยและแสดงผลตัวเลขเป็นทศนิยม 4 ตำแหน่ง
SELECT E.FirstName + ' ' + E.LastName AS EmployeeFullName,
       COUNT(DISTINCT O.OrderID) AS NumberOfOrders,
       SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSalesAmount
FROM Employees E
JOIN Orders O ON E.EmployeeID = O.EmployeeID
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
WHERE O.OrderDate >= '1996-10-01' AND O.OrderDate < '1997-01-01'
GROUP BY E.FirstName, E.LastName
ORDER BY TotalSalesAmount DESC;

-- 11.  จงแสดงชื่อพนักงาน และแสดงยอดขายรวมทั้งหมด ของสินค้าที่เป็นประเภท Beverage ที่ส่งไปยังประเทศ ญี่ปุ่น
SELECT E.FirstName + ' ' + E.LastName AS EmployeeFullName,
       SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSalesAmount
FROM Employees E
JOIN Orders O ON E.EmployeeID = O.EmployeeID
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
JOIN Categories C ON P.CategoryID = C.CategoryID
JOIN Customers CU ON O.CustomerID = CU.CustomerID
WHERE C.CategoryName = 'Beverages' AND CU.Country = 'Japan'
GROUP BY E.FirstName, E.LastName;

-- 12.  แสดงรหัสบริษัทตัวแทนจำหน่าย ชื่อบริษัทตัวแทนจำหน่าย ชื่อผู้ติดต่อ เบอร์โทร ชื่อสินค้าที่ขาย เฉพาะประเภท Seafood ยอดรวมที่ขายได้แต่ละชนิด แสดงผลเป็นทศนิยม 4 ตำแหน่ง เรียงจาก มากไปน้อย 10 อันดับแรก
SELECT C.CustomerID, C.CompanyName, C.ContactName, C.Phone, P.ProductName,
       SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSalesAmount
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
JOIN Categories Cat ON P.CategoryID = Cat.CategoryID
WHERE Cat.CategoryName = 'Seafood'
GROUP BY C.CustomerID, C.CompanyName, C.ContactName, C.Phone, P.ProductName
ORDER BY TotalSalesAmount DESC
LIMIT 10;
-- 13.  จงแสดงชื่อเต็มพนักงานทุกคน วันเกิด อายุเป็นปีและเดือน พร้อมด้วยชื่อหัวหน้า
SELECT E.EmployeeID, E.FirstName + ' ' + E.LastName AS EmployeeFullName,
       E.BirthDate, 
       DATEDIFF(YEAR, E.BirthDate, GETDATE()) AS AgeYears,
       DATEDIFF(MONTH, E.BirthDate, GETDATE()) % 12 AS AgeMonths,
       (SELECT FirstName + ' ' + LastName FROM Employees WHERE EmployeeID = E.ReportsTo) AS ManagerName
FROM Employees E;

-- 14.  จงแสดงชื่อบริษัทลูกค้าที่อยู่ในประเทศ USA และแสดงยอดเงินการซื้อสินค้าแต่ละประเภทสินค้า
SELECT C.CompanyName, Cat.CategoryName,
       SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSalesAmount
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
JOIN Categories Cat ON P.CategoryID = Cat.CategoryID
WHERE C.Country = 'USA'
GROUP BY C.CompanyName, Cat.CategoryName
ORDER BY C.CompanyName, Cat.CategoryName;

-- 15.  แสดงข้อมูลบริษัทผู้จำหน่าย ชื่อบริษัท ชื่อสินค้าที่บริษัทนั้นจำหน่าย จำนวนสินค้าทั้งหมดที่ขายได้และราคาเฉลี่ยของสินค้าที่ขายไปแต่ละรายการ แสดงผลตัวเลขเป็นทศนิยม 4 ตำแหน่ง
SELECT S.SupplierID, S.CompanyName, P.ProductName,
       SUM(OD.Quantity) AS TotalQuantitySold,
       AVG(OD.UnitPrice * (1 - OD.Discount)) AS AveragePrice
FROM Suppliers S
JOIN Products P ON S.SupplierID = P.SupplierID
JOIN [Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY S.SupplierID, S.CompanyName, P.ProductName
ORDER BY S.CompanyName, P.ProductName;

-- 16.  ต้องการชื่อบริษัทผู้ผลิต ชื่อผู้ต่อต่อ เบอร์โทร เบอร์แฟกซ์ เฉพาะผู้ผลิตที่อยู่ประเทศ ญี่ปุ่น พร้อมทั้งชื่อสินค้า และจำนวนที่ขายได้ทั้งหมด หลังจาก 1 มกราคม 2541
SELECT S.CompanyName, S.ContactName, S.Phone, S.Fax, P.ProductName,
       SUM(OD.Quantity) AS TotalQuantitySold
FROM Suppliers S
JOIN Products P ON S.SupplierID = P.SupplierID
JOIN [Order Details] OD ON P.ProductID = OD.ProductID
JOIN Orders O ON OD.OrderID = O.OrderID
WHERE S.Country = 'Japan' AND O.OrderDate >= '1998-01-01'
GROUP BY S.CompanyName, S.ContactName, S.Phone, S.Fax, P.ProductName
ORDER BY S.CompanyName, P.ProductName;

-- 17.  แสดงชื่อบริษัทขนส่งสินค้า เบอร์โทรศัพท์ จำนวนรายการสั่งซื้อที่ส่งของไปเฉพาะรายการที่ส่งไปให้ลูกค้า ประเทศ USA และ Canada แสดงค่าขนส่งโดยรวมด้วย
SELECT ShipperID, CompanyName, Phone,
       COUNT(O.OrderID) AS NumberOfOrders,
       SUM(O.Freight) AS TotalFreight
FROM Shippers S
JOIN Orders O ON S.ShipperID = O.ShipVia
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE C.Country IN ('USA', 'Canada')
GROUP BY S.ShipperID, S.CompanyName, S.Phone
ORDER BY NumberOfOrders DESC;

-- 18.  ต้องการข้อมูลรายชื่อบริษัทลูกค้า ชื่อผู้ติดต่อ เบอร์โทรศัพท์ เบอร์แฟกซ์ ของลูกค้าที่ซื้อสินค้าประเภท Seafood แสดงเฉพาะลูกค้าที่มีเบอร์แฟกซ์เท่านั้น
SELECT C.CompanyName, C.ContactName, C.Phone, C.Fax
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
JOIN Categories Cat ON P.CategoryID = Cat.CategoryID
WHERE Cat.CategoryName = 'Seafood' AND C.Fax IS NOT NULL
GROUP BY C.CompanyName, C.ContactName, C.Phone, C.Fax;

-- 19.  จงแสดงชื่อเต็มของพนักงาน  วันเริ่มงาน (รูปแบบ 105) อายุงานเป็นปี เป็นเดือน ยอดขายรวม เฉพาะสินค้าประเภท Condiment ในปี 2540
SELECT E.EmployeeID, E.FirstName + ' ' + E.LastName AS EmployeeFullName,
       CONVERT(VARCHAR, E.HireDate, 105) AS HireDateFormatted,
       DATEDIFF(YEAR, E.HireDate, GETDATE()) AS YearsInService,
       DATEDIFF(MONTH, E.HireDate, GETDATE()) % 12 AS MonthsInService,
       SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalSalesAmount
FROM Employees E
JOIN Orders O ON E.EmployeeID = O.EmployeeID
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE C.CategoryName = 'Condiments' AND O.OrderDate >= '1997-01-01' AND O.OrderDate < '1998-01-01'
GROUP BY E.EmployeeID, E.FirstName, E.LastName, E.HireDate
ORDER BY TotalSalesAmount DESC;

-- 20.  จงแสดงหมายเลขใบสั่งซื้อ  วันที่สั่งซื้อ(รูปแบบ 105) ยอดขายรวมทั้งหมด ในแต่ละใบสั่งซื้อ โดยแสดงเฉพาะ ใบสั่งซื้อที่มียอดจำหน่ายสูงสุด 10 อันดับแรก
SELECT O.OrderID, CONVERT(VARCHAR, O.OrderDate, 105) AS OrderDateFormatted,
       SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS TotalOrderAmount
FROM Orders O
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY O.OrderID, O.OrderDate
ORDER BY TotalOrderAmount DESC
LIMIT 10;


      
