use love_you_a_latte;

/*
Lab 4-1: Create Tables
In this assignment we will create a Customer table and a product tables loosely based on the 'Love You a Latte coffee shop' data model. As an exercise, we will create a production version using default schema .  
Instructions:
Create a customer table based on the Person table (PersonID, Name, Address, City, State, Zip, Phone, Email)
Create a product table using these fields (ProductID, CategoryID, Name, Description, Price, Quantity, Status) using the default schema.
Turn in a script file (.sql) that holds all the commands necessary to complete the task. 
*/

--DROP TABLE Person;
go
CREATE TABLE Person (
    PersonID int not null primary key,
    Name varchar(255),
    Address varchar(255),
    City varchar(50),
	State varchar(30),
    Zip varchar(10),
    Phone varchar(20),
    Email varchar(50) 
);

--Create a product table using these fields (ProductID, CategoryID, Name, Description, Price, Quantity, Status) using the default schema.
CREATE TABLE Product (
    ProductID int not null primary key,
    CategoryID int not null,
    Name varchar(255),
    Description varchar(50),
	Price varchar (30),
    Quantity int,
    Status char 
);
