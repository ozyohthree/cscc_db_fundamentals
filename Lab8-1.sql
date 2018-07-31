/*
Lab 8-1: Create a Stored Procedure
 
Instructions:
Create a new stored procedure to purchase a product (i.e. cup of coffee for Dave Thompson).
*/


USE [love_you_a_latte]
GO

DROP PROCEDURE uspGetOrder
GO

CREATE PROCEDURE uspGetOrder @Person_Name varchar(50) = NULL, @Product_Name varchar(255) = NULL
AS
SELECT Person.Name as 'Customer Name', Product.Name as 'Product Name', Product.Price
	FROM Person,Product
	WHERE Person.Person_ID = (SELECT Person_ID FROM Person WHERE Person.Name=@Person_Name)
		AND Product.Product_ID=(SELECT Product_ID FROM Product WHERE Product.Name=@Product_Name)
GO

--Example
EXEC uspGetOrder  @Person_Name = 'Tony Anthony', @Product_Name = 'Kenya Coffee'

-- Returns
-- Tony Anthony Kenya Coffee $10

