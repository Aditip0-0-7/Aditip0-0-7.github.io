SELECT title FROM Employees where FirstName = 'Nancy';

Select * FROM Employees
where Title = (Select Title
FROM Employees
where FirstName = 'Nancy')

Select Firstname, Lastname from Employees
where BirthDate = (Select min(BirthDate) from Employees)

Select ProductName from Products
where UnitPrice > (Select UnitPrice from Products
where ProductName = 'Ikura')

SELECT CompanyName FROM Customers
WHERE City = (Select city from Customers
where CompanyName = 'Around the Horn')

SELECT FirstName, LastName
FROM Employees
WHERE HireDate > (
    SELECT MAX(HireDate)
    FROM Employees);


--ข้อมูลใบสั่งซื้อที่ถูกส่งไปประเทศที่ไม่มีผู้ผลิตสินค้าตั้งอยู่
SELECT *
FROM Orders
WHERE ShipCountry NOT IN (
    SELECT DISTINCT Country
    FROM Suppliers
);

--การใส่ตัวเลขลำดับ
--ต้องการข้อมูลสินค้าที่มีราคาน้อยกว่า 50$
Select ROW_NUMBER() OVER(ORDER BY UnitPrice DESC) AS RowNum,
ProductName, UnitPrice 
from Products
where UnitPrice < 50

--
INSERT into Shippers
VALUES('บริษัทขนเยอะจำกัด','081-12345678 ')

INSERT into Shippers (CompanyName)
VALUES('บริษัทขนมหาสานเยอะจำกัด')

SELECT* FROM Customers
SELECT* FROM Employees
SELECT* FROM Products


INSERT into Customers(CustomerID, CompanyName)
VALUES('A0001','บริษัทซื้อดยอะจำกัด')

---จงเพิ่มข้อมูลพนักงาน1 คน (ใส่ข้อมูลเท่าที่มี)
INSERT into Employees(FirstName, LastName)
VALUES('อดิทีปย์','ยมศรีเคน')

---จงเพิ่มสินค้า ปลาแดกบอง ราคา 1.5$ บาท จำนวน 12
INSERT into Products(ProductName, UnitPrice, UnitsInStock)
VALUES('ปลาแดกบอง', 1.5, 12)

SELECT * FROM Products
-----


UPDATE Shippers
SET Phone = '081-9999999'
WHERE ShipperID = 6

SELECT * FROM Shippers

---ปรับปรุงขจำนวนสินค้าคงเหลือของสินค้า รหัส 1 เพิ่มจำนวนเข้าไป 100 ชิ้น
UPDATE Products
SET UnitsInStock = UnitsInStock + 100
WHERE ProductID = 1

SELECT * FROM Products

---ปรับปรุง เมือง และประเทศลูกค้า ทีรหัส 'A0001' ให้เป็น อุดรธานี ,Thailand
UPDATE Customers
SET City = 'อุดรธานี', Country = 'Thailand'
WHERE CustomerID = 'A0001'

SELECT * FROM Customers


DELETE FROM Shippers
WHERE ShipperID = 6

DELETE FROM Products
WHERE ProductID = 78



