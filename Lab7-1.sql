/*
Lab 7-1: Create Views
Create views for the queries you wrote in the last unit.

Instructions:

Select all the customers with their addresses
Select all the barista at all the different stores with their address
Select the customers favorite products
*/

USE [love_you_a_latte]
GO

DROP VIEW Person_Addresses;
GO

CREATE VIEW Person_Addresses AS
SELECT Person_ID, Name, Phone, Email, Addresses.Address_ID, Address, City, State, Zip 
	FROM Person, Addresses
	WHERE Person.Address_ID=Addresses.Address_ID;
GO

DROP VIEW Barista_Addresses;
GO
CREATE VIEW Barista_Addresses AS
SELECT Barista_ID, FirstName, LastName, Badge, Store.Store_ID, Store.Name AS 'Store Name', Store.Email as 'Store Email', Manager, Store.Phone as 'Store Phone',
	Addresses.Address_ID as 'Address ID',  Address, City, State, Zip
	FROM Barista,Store,Addresses
	WHERE Barista.Store_ID=Store.Store_ID
		AND	Store.Address_ID=Addresses.Address_ID;
GO

DROP VIEW Customer_Favorite_Products;
GO

CREATE VIEW Customer_Favorite_Products AS
SELECT Person.Name as 'Customer Name', Product.Name as 'Product Name', Customer_Favorites.Cream, Customer_Favorites.Sugar
	FROM Person,Product,Customer_Favorites
	WHERE Person.Person_ID=Customer_Favorites.Person_ID
		AND Customer_Favorites.Product_ID=Product.Product_ID
GO