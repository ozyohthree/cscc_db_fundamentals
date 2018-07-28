/*
In this assignment you will insert data the tables you created

Instructions:

Insert 2 records in the Store table
Insert 6 records in the Barista table 
Insert 10 customer records with 2 customer having the same address (think couple, children, etc.)
Insert 5 different products
Insert 4 records into Customer_Favorites
Selection:

Select all the customers with their addresses
Select all the barista at all the different stores with their address
Select the customers favorite products
Note: Be mindful of constraints you have added Turn in a script (.sql) file of the data necessary to complete this lab.
*/
USE [love_you_a_latte]
GO

INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(9,'1234 Main St','Columbus','OH','43229');
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(10,'1234 Broad St','Columbus','OH','43215');
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(11,'1234 High St','Columbus','OH','43001');
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(12,'1234 Spring St','Columbus','OH','43215');	
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(13,'1234 Front St','Columbus','OH','43312');
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(14,'4321 Main St','Columbus','OH','43120');
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(15,'1234 Nice St','Columbus','OH','43219');
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(16,'1234 Easton St','Lewis Center','OH','43033');	


INSERT INTO Store(Store_ID,Name,Phone,Email,Address_ID,Manager)
	VALUES(1,'Main Street','6141234567','mainstreet@loveualatte.com',9,'Jim Lee');
INSERT INTO Store(Store_ID,Name,Phone,Email,Address_ID,Manager)
	VALUES(2,'Broad Street','6141234555','broadstreet@loveualatte.com',9,'Obasanjo Okonkwo');

INSERT INTO Barista(Barista_ID,FirstName,LastName,Badge,Store_ID)
	VALUES(1,'John','Baristachamp','123456',1);
INSERT INTO Barista(Barista_ID,FirstName,LastName,Badge,Store_ID)
	VALUES(2,'David','Joe','123457',1);
INSERT INTO Barista(Barista_ID,FirstName,LastName,Badge,Store_ID)
	VALUES(3,'Java','Man','123458',1);
INSERT INTO Barista(Barista_ID,FirstName,LastName,Badge,Store_ID)
	VALUES(4,'Joe','Morning','123459',2);
INSERT INTO Barista(Barista_ID,FirstName,LastName,Badge,Store_ID)
	VALUES(5,'Jim','Latte','123451',2);
INSERT INTO Barista(Barista_ID,FirstName,LastName,Badge,Store_ID)
	VALUES(6,'Vince','Doe','123452',2);

INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(11,'Chris Anthony',1,'7234567890','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(12,'Suzie Anthony',1,'8234567892','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(13,'John Doe',3,'9234567893','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(14,'Dow Doe',3,'2222222222','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(15,'Phoenix Arizona',3,'7234567895','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(16,'Patel Arizona',3,'6234567896','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(17,'John Desmond',8,'5234567897','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(18,'Peter Desmond',8,'4234567898','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(19,'Sue Desmond',8,'3234567899','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(20,'Tony Desmond',8,'111111111','email@email.com');

INSERT INTO Product(Product_ID,Category_ID,Name,Description,Price,Quantity,Status)
     VALUES (1,1,'Kenya Coffee','Nice Coffee','$10',500,'A');
INSERT INTO Product(Product_ID,Category_ID,Name,Description,Price,Quantity,Status)
     VALUES (2,1,'Espresso Kenya','Nice Coffee','$2.99',700,'B');
INSERT INTO Product(Product_ID,Category_ID,Name,Description,Price,Quantity,Status)
     VALUES (3,4,'Dark Roast Sumatra','Nice Coffee','$3.99',300,'A');
INSERT INTO Product(Product_ID,Category_ID,Name,Description,Price,Quantity,Status)
     VALUES (4,2,'Ethiopian','Nice Coffee','$2.99',400,'B');
INSERT INTO Product(Product_ID,Category_ID,Name,Description,Price,Quantity,Status)
     VALUES (5,5,'Einstein Doughnuts','Nice Coffee','$.99',200,'C');


INSERT INTO Customer_Favorites(Person_ID,Product_ID,Cream,Sugar)
	VALUES(1,2,1,1);
INSERT INTO Customer_Favorites(Person_ID,Product_ID,Cream,Sugar)
	VALUES(2,1,1,1);
INSERT INTO Customer_Favorites(Person_ID,Product_ID,Cream,Sugar)
	VALUES(3,2,1,0);
INSERT INTO Customer_Favorites(Person_ID,Product_ID,Cream,Sugar)
	VALUES(4,2,0,1);

SELECT * 
	FROM Person, Addresses
	WHERE Person.Address_ID=Addresses.Address_ID;
GO

SELECT *
	FROM Barista,Store,Addresses
	WHERE Barista.Store_ID=Store.Store_ID
		AND	Store.Address_ID=Addresses.Address_ID;
GO

SELECT Person.Name, Product.Name, Customer_Favorites.Cream, Customer_Favorites.Sugar
	FROM Person,Product,Customer_Favorites
	WHERE Person.Person_ID=Customer_Favorites.Person_ID
		AND Customer_Favorites.Product_ID=Product.Product_ID
GO

