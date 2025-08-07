SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Products';

--1. สินค้าที่มีราคา 15 บาท
SELECT * 
FROM Products 
WHERE UnitPrice = 15;
-- 2. สินค้าที่มีจำนวนคงเหลือในสต๊อกต่ำกว่า 250
SELECT * 
FROM Products 
WHERE UnitsInStock < 250;
-- 3. รหัสสินค้า ชื่อสินค้าที่เลิกจำหน่ายแล้ว
SELECT productID, ProductName 
FROM Products 
WHERE Discontinued = 1;
--4. รหัสสินค้า ชื่อสินค้า ราคา ของสินค้าที่มีราคามากกว่า 100
SELECT productID, ProductName, UnitPrice 
FROM Products 
WHERE UnitPrice > 100;
-- 5. รหัสสินค้า และราคาของยางลบ
SELECT productID, UnitPrice 
FROM Products 
WHERE ProductName LIKE '%ยางลบ%';
--6. หมายเลขใบเสร็จ วันที่ และ ราคารวม ของใบเสร็จที่ออกก่อนวันที่ 15 ก.พ.
SELECT ReceiptID, ReceiptDate, TotalCash
FROM Receipts
WHERE ReceiptDate < '2025-02-15';
-- 7. รหัสสินค้า ชื่อสินค้า ที่มีจำนวนคงเหลือตั้งแต่ 400 ขึ้นไป
SELECT productID, ProductName 
FROM Products 
WHERE UnitsInStock >= 400;
--8. รหัสสินค้า ชื่อสินค้า ราคา และ จำนวนคงเหลือ ของแชมพู, แป้งเด็ก, ดินสอ, ยางลบ
SELECT productID, ProductName, UnitPrice, UnitsInStock 
FROM Products 
WHERE ProductName IN ('แชมพู', 'แป้งเด็ก', 'ดินสอ', 'ยางลบ');
--9. รายละเอียดของสินค้าประเภทเครื่องเขียน
SELECT P.* 
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID 
WHERE C.CategoryName = 'เครื่องเขียน';
--10. รหัสประเภทสินค้า ชื่อประเภท และรายละเอียดของ สินค้าประเภทเครื่องสำอาง
SELECT CategoryID, CategoryName, [Description] FROM Categories 
WHERE CategoryName = 'เครื่องสำอาง';


--11. คำนำหน้า ชื่อ นามสกุล ของพนักงานที่เป็น Sale Representative
SELECT Title, FirstName, LastName 
FROM Employees 
WHERE Position = 'Sale Representative';
-- 12. รหัสพนักงาน ชื่อพนักงาน ชื่อผู้ใช้ รหัสผ่าน ของพนักงานทุกคน
SELECT Title, FirstName, LastName, UserName, [Password]
FROM Employees;

-- 13. ชื่อผู้ใช้ และรหัสผ่านของพนักงานที่ชื่อก้องนิรันดร์
SELECT 
    UserName, 
    Password
FROM Employees
WHERE FirstName = 'ก้องนิรันดร์';
-- 14. รหัสพนักงานที่ออกใบเสร็จหมายเลข 3
SELECT EmployeeID
FROM Receipts
WHERE ReceiptID = 3;
--15. รหัสสินค้า ชื่อสินค้า ราคา ของสินค้าที่มีรหัสประเภท 2, 4
SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE CategoryID IN (2, 4);















