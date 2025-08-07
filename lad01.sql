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
