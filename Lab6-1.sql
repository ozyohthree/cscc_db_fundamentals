/*
In this assignment you will insert data into the three tables you created

Instructions:

Insert 10 records in the Product table
Insert 10 records in the Customer table
Insert 10 records in the CustomerProductPreferences table
Note: Be mindful of constraints you have added
*/

USE [love_you_a_latte]
GO

INSERT INTO Category (Category_ID, CategoryName, Description)
	VALUES (1,'Kenyan Coffee','Best coffee in the world');
INSERT INTO Category (Category_ID, CategoryName, Description)
	VALUES (2,'Ethiopian Coffee','Other Best coffee in the world');
INSERT INTO Category (Category_ID, CategoryName, Description)
	VALUES (3,'Colombian Coffee','Colombian Best coffee in the world');
INSERT INTO Category (Category_ID, CategoryName, Description)
	VALUES (4,'Sumatra Coffee','Indonesia Best coffee in the world');
INSERT INTO Category (Category_ID, CategoryName, Description)
	VALUES (5,'Doughnuts','Needed to go with Best coffee in the world');

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
INSERT INTO Product(Product_ID,Category_ID,Name,Description,Price,Quantity,Status)
     VALUES (6,3,'Colombian Latte Coffee','Nice Coffee','$2.99',800,'A');
INSERT INTO Product(Product_ID,Category_ID,Name,Description,Price,Quantity,Status)
     VALUES (7,3,'Colombian Medium Coffee','Nice Coffee','$3.99',900,'E');
INSERT INTO Product(Product_ID,Category_ID,Name,Description,Price,Quantity,Status)
     VALUES (8,2,'Ethiopian Blend Coffee','Nice Coffee','$3.99',100,'A');
INSERT INTO Product(Product_ID,Category_ID,Name,Description,Price,Quantity,Status)
     VALUES (9,2,'Regular Coffee','Nice Coffee','$1.99',200,'B');
INSERT INTO Product(Product_ID,Category_ID,Name,Description,Price,Quantity,Status)
     VALUES (10,2,'Gourmet Coffee','Nice Coffee','$5.99',500,'T');

INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(1,'1234 Main St','Columbus','OH','43229');
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(2,'1234 Broad St','Columbus','OH','43215');
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(3,'1234 High St','Columbus','OH','43001');
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(4,'1234 Spring St','Columbus','OH','43215');	
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(5,'1234 Front St','Columbus','OH','43312');
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(6,'4321 Main St','Columbus','OH','43120');
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(7,'1234 Nice St','Columbus','OH','43219');
INSERT INTO Addresses (Address_ID,Address,City,State,Zip)
	VALUES(8,'1234 Easton St','Lewis Center','OH','43033');	

INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(1,'Tony Anthony',1,'7234567890','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(2,'Customer Joe',2,'8234567892','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(3,'John Doe',3,'9234567893','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(4,'Dow Jones',1,'8234567894','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(5,'Phoenix Arizona',5,'7234567895','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(6,'Patel Smith',6,'6234567896','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(7,'Smith Desmond',8,'5234567897','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(8,'John Smith',4,'4234567898','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(9,'Sue Smith',4,'3234567899','email@email.com');
INSERT INTO Person(Person_ID,Name,Address_ID,Phone,Email)
	VALUES(10,'Tony Smith',4,'2234567890','email@email.com');


INSERT INTO Preferences(Preference_ID,Name,Description)
	VALUES(1,'Preference 1','Nice preference');
INSERT INTO Preferences(Preference_ID,Name,Description)
	VALUES(2,'Preference 2','Nice preference');
INSERT INTO Preferences(Preference_ID,Name,Description)
	VALUES(3,'Preference 3','Nice preference');
INSERT INTO Preferences(Preference_ID,Name,Description)
	VALUES(4,'Preference 4','Nice preference');
INSERT INTO Preferences(Preference_ID,Name,Description)
	VALUES(5,'Preference 5','Nice preference');
INSERT INTO Preferences(Preference_ID,Name,Description)
	VALUES(6,'Preference 6','Nice preference');
INSERT INTO Preferences(Preference_ID,Name,Description)
	VALUES(7,'Preference 7','Nice preference');
INSERT INTO Preferences(Preference_ID,Name,Description)
	VALUES(8,'Preference 8','Nice preference');

INSERT INTO CustomerProductPreferences(Person_ID,Product_ID,Preference_ID)
	VALUES(1,2,3);
INSERT INTO CustomerProductPreferences(Person_ID,Product_ID,Preference_ID)
	VALUES(2,2,3);
INSERT INTO CustomerProductPreferences(Person_ID,Product_ID,Preference_ID)
	VALUES(3,3,4);
INSERT INTO CustomerProductPreferences(Person_ID,Product_ID,Preference_ID)
	VALUES(4,2,3);
INSERT INTO CustomerProductPreferences(Person_ID,Product_ID,Preference_ID)
	VALUES(5,1,3);
INSERT INTO CustomerProductPreferences(Person_ID,Product_ID,Preference_ID)
	VALUES(6,2,1);
INSERT INTO CustomerProductPreferences(Person_ID,Product_ID,Preference_ID)
	VALUES(7,4,3);
INSERT INTO CustomerProductPreferences(Person_ID,Product_ID,Preference_ID)
	VALUES(8,1,3);
INSERT INTO CustomerProductPreferences(Person_ID,Product_ID,Preference_ID)
	VALUES(9,2,4);
INSERT INTO CustomerProductPreferences(Person_ID,Product_ID,Preference_ID)
	VALUES(10,1,1);
 
 GO