select Region, Country, City CompanyName,Phone
from Customers
order by 1 asc, 2 asc, 3asc 

select PRODUCTID รหัส, PRODUCTName สินค้า, 
  Unitprice ราคา, Unitsinstock จำนวน,
  unitprice* Unitsinstock AS stockValue
from Products

Select PRODUCTID as รหัส,PRODUCTname as สิรค้า,
unitsinstook + unitsonorder as จำนวนคงเหลือทั้งหมดม
reorderleve as จุดสั่งซื้อ
from products
where (unitsinstock + unitsonorder) <Reorderlevel

select PRODUCTID, PRODUCTname,
Unitpric RouND(UnitPric * 0.07)asvat7
from Products

SELECT 
    ProductID, 
    ProductName, 
    UnitPrice, 
    ROUND(UnitPrice * 0.07, 2) AS Vat7
FROM Products;

SELECT 
    ProductID AS รหัส,
    ProductName AS สินค้า,
    UnitsInStock + UnitsOnOrder AS จำนวนคงเหลือทั้งหมด,
    ReorderLevel AS จุดสั่งซื้อ
FROM Products
WHERE (UnitsInStock + UnitsOnOrder) < ReorderLevel;


SELECT EmployeesID,
Titleofcourtesy+firstname+space(1)+lastname AS [Employees name]
FROM Employees

select ORDERid,ProductID,UnitPrice,Quantity,Discount,
(UNITPrice * Quantity) AS totalPrice,
(UnitPrice * Quantity)-(UnitPrice * Quantity * Discount) AS netPrice
from [ORDER Details]

--ราคาจริง = ราคาเต็ม - ส่วนลด
--ราคาเต็ม = ราคา * จำนวน
--ส่วนลด = ราคาเต็ม * ส่วนลด
--ราคาจริง = ราคา * จำนวน * (1-ลด)
select(42.40*35)-(42.40*35*0.15)

select ORDERid,ProductID,UnitPrice,Quantity,Discount,
(UNITPrice * Quantity) AS totalPrice,
UnitPrice * Quantity*(1-Discount) AS netPrice
from [ORDER Details]

SELECT 
    EmployeeID, FirstName, BirthDate, DATEDIFF(YEAR, BirthDate, '2024-12-31') AS Age,
    HireDate, DATEDIFF(YEAR, HireDate, GETDATE()) AS YearInOffice
FROM Employees;


select getdate()

select count(*) as จำนวนสินค้า, count(ProductID), count(ProductName), count(Unitprice)
       from Products
       WHERE UnitsInStock < 15

       ------จำนาวลูกค้าที่อยู่ในประเทศ  USA
SELECT COUNT(*) AS จำนวนลูกค้า_USA
FROM Customers
WHERE Country = 'USA';

       ------จำนาวพนักงานที่อยู่ในเมือง London
       SELECT COUNT(*) AS จำนวนพนักงาน_London
FROM Employees
WHERE City = 'London';

-----------จำนวนใบสั่งซื้อที่ออกในปี 1997
SELECT COUNT(*) AS จำนวนใบสั่งซื้อ_1997
FROM Orders WHERE YEAR(OrderDate) = 1997;

-----------จำนวนครั้งที่ขายสินค้ารหัส 1
select COUNT(*) AS จำนวนครั้งที่ขายสินค้ารหัส_1
FROM [order Details]
WHERE ProductID = 1;

-----------function sum
-------จำนวนสินค้าทีขายได้ทั้งหมด เฉพาะสินค้ารหัส 1
SELECT SUM(Quantity)
FROM [order Details]
WHERE ProductID =2
------มูลค่าสินในคร้งทั้งหมด
select sum(unitprice * UnitsInStock)
from Products
---จำนวนสินค้ารหัส 8 ที่สั่งซื้อทัแล้ว
SELECT  sum(unitsonorder)
from Products
WHERE ProductID = 8;
--------function max, min
---------ราคาสินค้ารหัส 1 ที่ขายได้ราคาสูงสุด
SELECT MAX(UnitPrice), min(UnitPrice)
FROM [order Details]    
WHERE ProductID = 71;
----function avg
----ราคาสิรนค้ารเฉลี่ยทั้งหมดที่เคยขายได้ เฉพาะสินค้ารหัส 5
select AVG(UnitPrice), min(UnitPrice), max(UnitPrice)
FROM [order Details]    
WHERE ProductID = 5;    

select Country, count(*) as  [num fo COuntry]
FROM Customers
GROUP BY Country

--รหัสประเภทสินค้า ราคาเฉลี่ยของสินค้าประเภทเดียวกัน
SELECT CategoryID, AVG(UnitPrice), min(unitPrice), MAX(UnitPrice)
FROM Products
GROUP BY CategoryID;
--รายสินค้าในใบสั่งซื้อทุกใบ [order details]
SELECT OrderID, count(*)
from [order Details]
GROUP BY OrderID
HAVING count(*)>3;
--ประเทศ และจำนวนใบสั่งซื้อที่ส่งสินค้าไปถึงปลายทาง
--ต้องการเฉพาะสินค้าที่มีจำนวนใบสั่งซื้อ 100 ขึ้นไป
SELECT shipCountry, COUNT(*) numoforders
FROM Orders
GROUP BY shipCountry
HAVING COUNT(*) >= 100;

select country, count(*) as "num of contry"
FROM Customers
GROUP BY country
HAVING count(*)>5
      
--ข้อมูลรหัสใบสั่งซื้อ  ยอดเงินรวมในใบสั่งซื้อนั้น แสดงเฉพาะใบสั่งซื้อที่มียอดเงินรวมน้อยกว่า 100 [order details]
SELECT OrderID, SUM(UnitPrice * Quantity * (1 - Discount))
FROM [order Details]
GROUP BY OrderID
HAVING SUM(UnitPrice * Quantity * (1 - Discount)) < 100;


--ประเทศใดที่มีจำนวนใบสั่งซื้อที่ส่งสินค้าไปถึงปลายทางต่ำกว่า 20 รายการ ในปี 1997
SELECT ShipCountry, COUNT(*) AS NumOfOrders
FROM Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY ShipCountry
HAVING COUNT(*) < 20;
ORDER BY count(*) DESC;

--ใบสั่งซื้อใดมียอดขายสูงที่สุด แสดงรหัสใบสั่งซื้อและยอดขาย
SELECT top 1 OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) AS Total
FROM [order Details]
GROUP BY OrderID
order BY Total DESC

--ใบสั่งซื้อใดมียอดขายต่ำที่สุด 5 อัน แสดงรหัสใบสั่งซื้อและยอดขาย
SELECT top 5 OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) AS Total
FROM [order Details]
GROUP BY OrderID
ORDER BY Total ASC;
