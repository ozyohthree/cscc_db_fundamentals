/*
Lab 7-2: Create Outer Joins
In this assignment you will create alternative views of the data....

Instructions:

Show the customers who don't have favorites 
*/

USE [love_you_a_latte]
GO

DROP VIEW Customers_Without_Favorites;
GO

CREATE VIEW Customers_Without_Favorites AS
SELECT Person.Name as 'Customer Name'
	FROM Person
	LEFT OUTER JOIN Customer_Favorites ON Person.Person_ID=Customer_Favorites.Person_ID
	WHERE Customer_Favorites.Person_ID IS NULL
GO

/* ALTERNATIVE */
/*
CREATE VIEW Customers_Without_Favorites AS
SELECT Person.Name as 'Customer Name'
	FROM Person
	WHERE Person.Person_ID NOT IN (SELECT Customer_Favorites.Person_ID FROM Customer_Favorites)
GO
*/