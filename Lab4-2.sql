/*
Lab 4-2: Create the Coffee Shop database table structure
In this assignment we will create the entire  'Love You a Latte coffee shop'  database schema using the normalization document we reviewed in the last assignment.  
Instructions:
Create the entire set of tables used in the  'Love You a Latte coffee shop' example using the default schema.
Turn in a script file (.sql) that holds all the commands necessary to complete the task. Expecting to see 12 tables created.
Reference:  Table Schema
NOTE:  Do not worry about primary keys and foreign keys, this exercise is to get you familiar with using SQL Server to create the foundational tables needed for the coffee schema.
*/

use love_you_a_latte;

/*Person
ID PK-ID
name char
address_ ID FK-char
phone char
email char */
DROP TABLE Person;
GO
CREATE TABLE Person (
    PersonID int not null primary key,
    Name varchar(255),
    Address varchar(255),
    City varchar(50),
	State varchar(30),
    Zip varchar(10),
    Phone varchar(10),
    Email varchar(50) 
);

/*Product
ID PK-char
description char
current_price amount
reward_ factor Int
Onhand Int
reorder_pt Int
reorder_qty Int
uomeasure Int*/
DROP TABLE Product;
GO
CREATE TABLE Product (
    Product_ID int not null primary key,
    Category_ID int not null,
    Name varchar(255),
    Description varchar(50),
	Price varchar (30),
    Quantity int,
    Status char 
);

/*
Store
store_ID PK-ID
name char
phone char
email char
addressID FK-char
manager char*/
DROP TABLE Store;
GO
CREATE TABLE Store (
    StoreID int not null primary key,
    Name varchar(255),
    Phone varchar(10),
	Email varchar (50),
	AddressID int,
    Manager varchar (255)
);

/*Barista
ID PK-char
firstName char
lastName char
badge char
store_ID FK-char*/
DROP TABLE Barista;
GO
CREATE TABLE Barista (
	BaristaID int not null primary key,
	FirstName varchar(255),
	LastName varchar(255),
	Badge varchar(50),
	StoreID int not null
);

/*Addresses
ID PK-ID
address char
city char
state char
zip char*/
DROP TABLE Addresses;
GO
CREATE TABLE Addresses (
	AddressID int not null primary key,
	Address varchar(255),
	City varchar(255)
);

/*Rewards_account
ID FK-char
balance Int*/
DROP TABLE Rewards_account;
GO
CREATE TABLE Rewards_account (
	RewardsAccountID int not null,
	Balance int
);

/*Customer_favorites
person_ID FK-char
product_ID FK-char
cream boolean
sugar boolean*/
DROP TABLE Customer_favorites;
GO
CREATE TABLE Customer_favorites (
	PersonID int not null,
	ProductID int,
	Cream bit,
	Sugar bit

);

/*Transaction_master
trans_ID PK-ID
person_ID FK-char
dateTime datetime
store_ID FK-char
register INT
clerk FK-char
payType char*/
DROP TABLE Transaction_master;
GO
CREATE TABLE Transaction_master (
	Transaction_ID int not null,
	Person_ID int,
	DateTime datetime,
	StoreID int,
	Register int,
	Clerk varchar(255),
	PayType varchar(30)
);

/*Transaction_product
trans_ID PK-ID
product_ID FK-char
quantity Int
price amount*/
DROP TABLE Transaction_product;
GO
CREATE TABLE Transaction_product (
	TransactionID int,
	ProductID int,
	Quantity int,
	Price money
);

/*Transaction_reward
trans_ID PK-cha
person_ID FK-char
reward Int*/
DROP TABLE Transaction_reward;
GO
CREATE TABLE Transaction_reward (
	TransactionID int,
	PersonID int,
	Reward int
);

/*Product_supplier
Prod_ID FK-char
Supp_ID FK-char
cost amount
days Int*/
DROP TABLE Product_supplier;
GO
CREATE TABLE Product_supplier (
	ProductID int not null,
	SupplierID int,
	Cost money,
	Days int
);

/*Supplier
ID PK-ID
Add_ID FK-char
phone char
email char
*/
DROP TABLE Supplier;
GO
CREATE TABLE Supplier (
	SupplierID int not null,
	AddressID int,
	Phone varchar(10),
	Email varchar(30)
);