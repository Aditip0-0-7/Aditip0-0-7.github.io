SELECT CategoryName, Productname, UnitPrice
FROM Products, Categories
WHERE Products.CategoryID = Categories.CategoryID
