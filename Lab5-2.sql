/*
Lab 5-2: Customer Preferences

In this assignment we want to create a junction table that will allow us to write a query to find out a customer's preferences.  
For example, James Johnson likes coffee with nutmeg and honey.  Currently our schema does not allow for this scenario, 
however by adding a junction table, we can easily create customer preferences.

Instructions:

Create 2 new tables Preferences (id, name, description) and a junction table 
CustomerProductPreferences (customerid, productid, preferenceid) - with 3 foreign keys and 1 composite key
Turn in a script (.sql) file that contains all the commands for this lab

*/

DROP TABLE Preferences;
GO
CREATE TABLE Person (
    PreferenceID int NOT NULL,
    Name varchar(255),
    Description varchar(255)
);

GO
ALTER TABLE Preferences
ADD CONSTRAINT PK_Preferences_PreferencesID PRIMARY KEY (PreferencesID);

DROP TABLE CustomerProductPreferences;
GO
CREATE TABLE CustomerProductPreferences (
    CustomerID int NOT NULL,
    ProductID int NOT NULL,
    PreferenceID int NOT NULL
);

