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
use love_you_a_latte;
DROP TABLE Preferences;
GO
CREATE TABLE Preferences (
    Preference_ID	int	NOT NULL,
    Name			varchar(255),
    Description		varchar(255)
);

GO
ALTER TABLE Preferences
ADD CONSTRAINT PK_Preferences_PreferenceID PRIMARY KEY (Preference_ID);

DROP TABLE CustomerProductPreferences;
GO
CREATE TABLE CustomerProductPreferences (
    Person_ID		int NOT NULL,
    Product_ID		int NOT NULL,
    Preference_ID	int NOT NULL
);

GO
ALTER TABLE CustomerProductPreferences
ADD CONSTRAINT PK_CustomerProductPreferences PRIMARY KEY (Person_ID,Product_ID,Preference_ID);
GO
ALTER TABLE CustomerProductPreferences
ADD CONSTRAINT FK_CustomerProductPreferences_Customer_ID FOREIGN KEY (Person_ID)
REFERENCES Person(Person_ID);
GO
ALTER TABLE CustomerProductPreferences
ADD CONSTRAINT FK_CustomerProductPreferences_Product_ID FOREIGN KEY (Product_ID)
REFERENCES Product(Product_ID);
GO
ALTER TABLE CustomerProductPreferences
ADD CONSTRAINT FK_CustomerProductPreferences_Preference_ID FOREIGN KEY (Preference_ID)
REFERENCES Preferences(Preference_ID);
