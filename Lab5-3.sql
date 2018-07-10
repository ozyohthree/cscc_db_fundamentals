/*
In this assignment we want to create the primary and foreign keys on the Coffee House data schema.

Instructions:

Create the following Primary Keys, Foreign Keys, and Check Constraints identified below:

Primary key constraints:

Store - Store_ID
Barista - ID
Addresses - ID
Person - ID
Customer_favorites - Person_ID, Product_ID (composite key)
Transaction_Master - Trans_ID
Transaction_Product - Trans_ID, Product_ID (composite key)
Transaction_Reward - Trans_ID, Person_ID (composite key)
Product - ID
Product_Supplier - Product_ID, Supplier_ID (composite key)
Supplier - ID

Foreign key constraints:

Store - AddressID (Address)
Barista - Store_ID (Store)
Person - Address_ID (Address)
Rewards_account - ID (Person)
Customer_Favorites - Person_ID (Person),Product_ID (Product)
Transaction_Master - Person_ID (Person), Store_ID (Store), Clerk (Person)
Transaction_Product - Product_ID (Product)
Transaction_Reward - Person_ID (Person)
Product_supplier - Prod_ID (Product), Supp_ID (Supplier)
Supplier - Add_ID (Address)

Check constraints:

Transaction_Master - dateTime > now
					PayType - payType - only (Cash, Credit, Rewards) - change type to varchar
Product_Supplier - days < 180
Product - reorder_qty - < 1000

Default constraints:

Addresses - State - 'OH'

Not Null constraints:

Store - name
Barista - firstName, lastName
Person - name
Product - description

*/


use love_you_a_latte;

DROP TABLE Store;
GO
CREATE TABLE Store (
    Store_ID INT not null primary key,
    Name varchar(50) not null,
    Phone varchar(10),
	Email varchar (50),
	Address_ID int,
    Manager varchar (50),
	CONSTRAINT Store_Address_ID FOREIGN KEY (Address_ID) REFERENCES Addresses(Address_ID)
);
GO

DROP TABLE Barista;
GO
CREATE TABLE Barista (
	Barista_ID int not null primary key,
	FirstName varchar(255) not null,
	LastName varchar(255) not null,
	Badge varchar(50),
	Store_ID int not null,
	CONSTRAINT Store_ID FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID)
);
GO

DROP TABLE Addresses;
GO
CREATE TABLE Addresses (
	Address_ID int not null primary key,
	Address varchar(50),
	City varchar(50),
	State varchar(2) DEFAULT 'OH',
	Zip varchar(10)
);
GO


DROP TABLE Person;
GO
CREATE TABLE Person (
    Person_ID int not null primary key,
    Name varchar(50) not null,
    Address_ID int not null,
    City varchar(50),
	State varchar(2),
    Zip varchar(10),
    Phone varchar(10),
    Email varchar(50),
	CONSTRAINT Person_Address_ID FOREIGN KEY (Address_ID) REFERENCES Addresses(Address_ID)
);
GO

DROP TABLE Product;
GO
CREATE TABLE Product (
    Product_ID int not null primary key,
    Category_ID int not null,
    Name varchar(255),
    Description varchar(50) not null,
	Price varchar (30),
    Quantity int,
    Status char 
);
GO
ALTER TABLE Product
	ADD 
		CONSTRAINT Product_Supplier_Reorder_Quantity_Check 
			CHECK (Quantity < 1000);


DROP TABLE Supplier;
GO
CREATE TABLE Supplier (
	Supplier_ID int not null primary key,
	Address_ID int,
	Phone varchar(10),
	Email varchar(30),
);
GO
ALTER TABLE Supplier
	ADD 
		CONSTRAINT FK_Supplier_Address_ID 
			FOREIGN KEY (Address_ID) 
			REFERENCES Addresses(Address_ID);

--Customer_Favorites - Person_ID, Product_ID (composite key)
DROP TABLE Customer_Favorites;
GO
CREATE TABLE Customer_Favorites (
	Person_ID int not null,
	Product_ID int not null,
	Cream bit,
	Sugar bit,
	CONSTRAINT PK_Customer_Favorites PRIMARY KEY (Person_ID,Product_ID),
	CONSTRAINT FK_Person_ID FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
	CONSTRAINT FK_Product_ID FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)

);
GO

--Transaction_Product - Transaction_ID, Product_ID (composite key)
DROP TABLE Transaction_master;
GO
CREATE TABLE Transaction_Master (
	Transaction_ID int not null primary key,
	Person_ID int,
	DateTime datetime,
	Store_ID int,
	Register int,
	Clerk int,
	PayType varchar(30),
	CONSTRAINT FK_Transaction_Master_Person_ID FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
	CONSTRAINT FK_Transaction_Master_Store_ID FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID),
	CONSTRAINT FK_Transaction_Master_Clerk FOREIGN KEY (Clerk) REFERENCES Person(Person_ID)
);
GO
ALTER TABLE Transaction_Master
	ADD 
		CONSTRAINT Transaction_Master_DateCheck 
			CHECK (DateTime > CURRENT_TIMESTAMP),
		CONSTRAINT Transaction_Master_PayTypeCheck 
			CHECK (PayType='Cash' OR PayType='Credit' OR PayType='Rewards');


DROP TABLE Transaction_product;
GO
CREATE TABLE Transaction_Product (
	Transaction_ID int not null,
	Product_ID int not null,
	Quantity int,
	Price money,
	CONSTRAINT PK_Transaction_Product PRIMARY KEY (Transaction_ID,Product_ID),
	CONSTRAINT FK_Transaction_Product_Product_ID FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);
GO

--Transaction_Reward - Trans_ID, Person_ID (composite key)
DROP TABLE Transaction_reward;
GO
CREATE TABLE Transaction_Reward (
	Transaction_ID int not null,
	Person_ID int not null,
	Reward int,
	CONSTRAINT PK_Transaction_Reward PRIMARY KEY (Transaction_ID,Person_ID),
	CONSTRAINT FK_Transaction_Reward_Person_ID FOREIGN KEY (Person_ID) REFERENCES Person(Person_ID),
);
GO

--Product_Supplier - Product_ID, Supplier_ID (composite key)
DROP TABLE Product_supplier;
GO
CREATE TABLE Product_Supplier (
	Product_ID int not null,
	Supplier_ID int not null,
	Cost money,
	Days int,
	CONSTRAINT PK_Product_Supplier PRIMARY KEY (Product_ID,Supplier_ID),
	CONSTRAINT FK_Product_Supplier_Product_ID FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
	CONSTRAINT FK_Product_Supplier_Supplier_ID FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);
GO
--Product_Supplier - days < 180Product - reorder_qty - < 1000
GO
ALTER TABLE Product_Supplier
	ADD 
		CONSTRAINT Product_Supplier_DaysCheck 
			CHECK (Days < 180);

DROP TABLE CustomerProductPreferences;
GO
CREATE TABLE CustomerProductPreferences (
    Person_ID		int NOT NULL,
    Product_ID		int NOT NULL,
    Preference_ID	int NOT NULL
);

GO
ALTER TABLE CustomerProductPreferences
	ADD 
		CONSTRAINT PK_CustomerProductPreferences 
			PRIMARY KEY (Person_ID,Product_ID,Preference_ID);
GO
ALTER TABLE CustomerProductPreferences
	ADD 
		CONSTRAINT FK_CustomerProductPreferences_Customer_ID 
			FOREIGN KEY (Person_ID)
			REFERENCES Person(Person_ID);
GO
ALTER TABLE CustomerProductPreferences
	ADD 
		CONSTRAINT FK_CustomerProductPreferences_Product_ID 
			FOREIGN KEY (Product_ID)
			REFERENCES Product(Product_ID);
GO
ALTER TABLE CustomerProductPreferences
	ADD 
		CONSTRAINT FK_CustomerProductPreferences_Preference_ID 
			FOREIGN KEY (Preference_ID)
			REFERENCES Preferences(Preference_ID);


