use db6_26
/*
Lab 4-1: Create Tables

In this assignment we will create a Customer table and a product tables loosely based on the 'Love You a Latte coffee shop' data model. As an exercise, we will create a production version using default schema .  

Instructions:

Create a customer table based on the Person table (PersonID, Name, Address, City, State, Zip, Phone, Email)
Create a product table using these fields (ProductID, CategoryID, Name, Description, Price, Quantity, Status) using the default schema.

Turn in a script file (.sql) that holds all the commands necessary to complete the task. 

*/
DROP TABLE Person;

CREATE TABLE Person (
	PersonID int identity not null, 
	Name varchar (50), 
	Address varchar(50), 
	City varchar (30), 
	State char (2), 
	Zip char(10), 
	Phone varchar(20), 
	Email varchar (50)
);

ALTER TABLE Person
add constraint person_personID_pk primary key (personid);

CREATE TABLE category (
categoryID INT not null identity, 
name varchar(50) not null, 
status char default 'A'
);

alter table category
add constraint category_categoryID_pk PRIMARY KEY (CATEGORYID);



DROP TABLE Product;
go
CREATE TABLE Product (
	ProductID int not null identity, 
	CategoryID int, 
	Name varchar (50), 
	Description varchar (500), 
	Price numeric(7,2), 
	Quantity int, 
	Status char
);

ALTER TABLE	product
add constraint product_productID_pk primary key (productid);

alter table product
add constraint product_categoryid_fk FOREIGN KEY (categoryID)
references category (categoryid);

select * from category
INSERT INTO category values ('Coffee', 'A');

INSERT INTO category (name) values ('Donut');

INSERT INTO PERSON ( NAME, CITY, STATE)
VALUES ( 'John', 'Columbus', 'OH');

INSERT INTO PERSON ( NAME, CITY, STATE)
VALUES ( 'Mary', 'Columbus', 'OH');


INSERT INTO PERSON ( NAME, CITY, STATE)
VALUES ( 'Sam', 'Columbus', 'OH');


ALTER TABLE PERSON
add constraint person_state_cc CHECK (state = 'OH');

INSERT INTO PERSON ( NAME, CITY, STATE)
VALUES ( 'Steve', 'Los Angeles', 'CA');

select * from person;
select * from product;
select * from category;

insert into product (name, categoryid, description, price) 
values ('Latte', 1, 'Latte', 4.00);

insert into product (name, categoryid, description, price) 
values ('Glazed donut', 2, 'Glazed donut', 1.25);

insert into product (name, categoryid, description, price) 
values ('Light Roast', 1, 'Light Roast', 2.00);

select * from person;
select * from product;
select * from category;

--SQL92 or ANSI92
select category.name, product.name, product.price
from product, category
WHERE product.categoryid = category.categoryid
order by category.name;

--SQL99 or ANSI99
select category.name, product.name, product.price
from product 
join category ON (product.categoryid = category.categoryid)
order by category.name;






select personid, name, state from person
where city = 'COLUMBUS'



select * from person



select * from category;



/*
Lab 5-1: Create Primary & Foreign keys

In this assignment you will create Primary and Foreign keys for the Customer and Product tables you created in the last unit.  You will also create a new Category table with a foreign key.

Instructions:

    Create a primary key on the Customer table
    Create a primary key on the Product table
    Create a new table called Category
    Create a foreign key linking Category - CategoryID with Product - CategoryID

Submit a script file (.sql) with all the commands necessary for doing the lab.
select * from person
--primary
alter table Person
add constraint person_personid_pk primary key (personid);
--foreign
alter table product
add constraint product_categoryid_fk FOREIGN KEY categoryid references category(categoryid);
*/


/*
Lab 5-2: Customer Preferences

In this assignment we want to create a junction table that will allow us to write a query to find out a customer's preferences. 
 For example, James Johnson likes coffee with nutmeg and honey.  Currently our schema does not allow for this scenario, however 
 by adding a junction table, we can easily create customer preferences.

Instructions:

    Create 2 new tables Preferences (id, name, description) and a junction table 
	CustomerProductPreferences (customerid, productid, preferenceid) - with 3 foreign keys and 1 composite key

Turn in a script (.sql) file that contains all the commands for this lab.

*/



/*
Lab 6-1: Inserting data

In this assignment you will insert data into the three tables you created

Instructions:

    Insert 10 records in the Product table
    Insert 10 records in the Customer table
    Insert 10 records in the CustomerProductPreferences table

Note: Be mindful of constraints you have added

Turn in a script (.sql) file of the data necessary to complete this lab.
*/




