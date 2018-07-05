/*
Lab 5-1: Create Primary & Foreign keys
 
In this assignment you will create Primary and Foreign keys for the Customer and Product tables you created in the last unit.  You will also create a new Category table with a foreign key.

Instructions:

Create a primary key on the Customer table (Person)
Create a primary key on the Product table
Create a new table called Category
Create a foreign key linking Category - CategoryID with Product - CategoryID
Submit a script file (.sql) with all the commands necessary for doing the lab.

*/
use love_you_a_latte;
DROP TABLE Person;
GO
CREATE TABLE Person (
    PersonID int NOT NULL,
    Name varchar(255),
    Address varchar(255),
    City varchar(50),
	State varchar(30),
    Zip varchar(10),
    Phone varchar(10),
    Email varchar(50) 
);

GO
ALTER TABLE Person
ADD CONSTRAINT PK_Person_PersonID PRIMARY KEY (PersonID);

DROP TABLE Product;
GO
CREATE TABLE Product (
    ProductID int NOT NULL,
    CategoryID int NOT NULL,
    Name varchar(255),
    Description varchar(50),
	Price varchar (30),
    Quantity int,
    Status char 
);

GO
ALTER TABLE Product
ADD CONSTRAINT PK_Product_ProductID PRIMARY KEY (ProductID);

DROP TABLE Category;
GO
CREATE TABLE Category (
	CategoryID int NOT NULL,
	CategoryName varchar(255),
	Description varchar(255)
);

GO
ALTER TABLE Category
ADD CONSTRAINT PK_Category_CategoryID PRIMARY KEY (CategoryID);

GO
ALTER TABLE product
ADD CONSTRAINT FK_Product_CategoryID FOREIGN KEY (CategoryID)
references Category (Categoryid);



