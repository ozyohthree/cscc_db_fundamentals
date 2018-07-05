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
go
CREATE TABLE Person (
    person_ID int not null primary key,
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
go
CREATE TABLE Product (
    product_ID int not null primary key,
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
go
CREATE TABLE Store (
    store_ID int not null primary key,
    Name varchar(255),
    phone varchar(10),
	email varchar (50),
	addressID int,
    manager varchar (255)
);

/*Barista
ID PK-char
firstName char
lastName char
badge char
store_ID FK-char*/
DROP TABLE Barista;
go
CREATE TABLE Barista (
	barista_ID int not null primary key,
	firstName varchar(255),
	lastName varchar(255),
	badge varchar(50),
	store_ID int not null
);

/*Addresses
ID PK-ID
address char
city char
state char
zip char*/
DROP TABLE Addresses;
go
CREATE TABLE Addresses (
	address_ID int not null primary key,
	address varchar(255),
	city varchar(255)
);

/*Rewards_account
ID FK-char
balance Int*/
DROP TABLE Rewards_account;
go
CREATE TABLE Rewards_account (
	rewards_account_ID int not null,
	balance int
);

/*Customer_favorites
person_ID FK-char
product_ID FK-char
cream boolean
sugar boolean*/
DROP TABLE Customer_favorites;
go
CREATE TABLE Customer_favorites (
	person_ID int not null,
	product_ID int,
	cream bit,
	sugar bit

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
go
CREATE TABLE Transaction_master (
	transaction_ID int not null,
	person_ID int,
	dateTime datetime,
	store_ID int,
	register int,
	clerk varchar(255),
	payType varchar(30)
);

/*Transaction_product
trans_ID PK-ID
product_ID FK-char
quantity Int
price amount*/
DROP TABLE Transaction_product;
go
CREATE TABLE Transaction_product (
	transaction_ID int,
	product_ID int,
	quantity int,
	price money
);

/*Transaction_reward
trans_ID PK-cha
person_ID FK-char
reward Int*/
DROP TABLE Transaction_reward;
go
CREATE TABLE Transaction_reward (
	transaction_ID int,
	person_ID int,
	reward int
);

/*Product_supplier
Prod_ID FK-char
Supp_ID FK-char
cost amount
days Int*/
DROP TABLE Product_supplier;
go
CREATE TABLE Product_supplier (
	product_ID int not null,
	supplier_ID int,
	cost money,
	days int
);

/*Supplier
ID PK-ID
Add_ID FK-char
phone char
email char
*/
DROP TABLE Supplier;
go
CREATE TABLE Supplier (
	supplier_ID int not null,
	address_ID int,
	phone varchar(10),
	email varchar(30)
);