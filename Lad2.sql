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

