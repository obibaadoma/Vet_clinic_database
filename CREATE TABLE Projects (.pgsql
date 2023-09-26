CREATE TABLE Projects (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Value DECIMAL(5, 2),
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE Employees (
    ID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HourlyWage DECIMAL(5, 2),
    HireDate DATE
);

CREATE TABLE ProjectEmployees (
    ID SERIAL PRIMARY KEY,
    ProjectID INT,
    EmployeeID INT,
    Hours DECIMAL(5, 2),
    CONSTRAINT FK_ProjectEmployees_Projects FOREIGN KEY (ProjectID) REFERENCES Projects (ID),
    CONSTRAINT FK_ProjectEmployees_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees (ID)
);

CREATE TABLE JobOrders (
    ID SERIAL PRIMARY KEY,
    EmployeeID INT,
    ProjectID INT,
    Description VARCHAR(255),
    OrderDateTime TIMESTAMP,  -- Use TIMESTAMP for date and time
    Quantity INT,
    Price DECIMAL(5, 2),
    CONSTRAINT FK_JobOrders_Projects FOREIGN KEY (ProjectID) REFERENCES Projects (ID),
    CONSTRAINT FK_JobOrders_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees (ID)
);

CREATE TABLE Customers (
    Name VARCHAR(100),
    Industry VARCHAR(100),
    Project1_ID INT,
    Project1_Feedback VARCHAR(255),
    Project2_ID INT,
    Project2_Feedback VARCHAR(255),
    ContactPersonID INT,
    ContactPersonAndRole VARCHAR(255),
    PhoneNumber VARCHAR(12),
    Address VARCHAR(255),
    City VARCHAR(255),
    Zip VARCHAR(5)
);
SELECT * FROM customers;
ALTER TABLE Customers
ADD COLUMN id SERIAL PRIMARY KEY;

-- Rename the column using ALTER TABLE
ALTER TABLE Customers 
RENAME COLUMN 
"contactpersonandrole" TO "ContactPerson";

-- Add a new column
ALTER TABLE Customers 
ADD COLUMN 
"ContactPersonRole" VARCHAR(20);


When the script below is executed, it will remove the above-mentioned columns from the Customers table and create a new table ProjectFeedbacks with Foreign Key references to the Customers and Projects table


ALTER TABLE Customers
DROP COLUMN project2_id,
DROP COLUMN project2_feedback;


CREATE TABLE ProjectFeedback (
    ID SERIAL PRIMARY KEY,
    ProjectID INT,
    CustomerID INT,
    Feedback TEXT,
    CONSTRAINT FK_ProjectFeedbacks_Projects FOREIGN KEY (ProjectID) REFERENCES Projects (ID),
    CONSTRAINT FK_ProjectFeedbacks_Customers FOREIGN KEY (CustomerID) REFERENCES Customers (ID)
);

CREATE TABLE ProjectFeedback(
ID SERIAL PRIMARY KEY,
ProjectID INT,
CustomerID INT,
Feedback TEXT,
CONSTRAINT FK_ProjectFeedbacks_Projects FOREIGN KEY (ProjectID)
 REFERENCES  Projects (ID),
CONSTRAINT FK_ProjectFeedbacks_Customers FOREIGN KEY (CustomerID)
 REFERENCES  Customers (ID)
)


select * from customers;

CREATE TABLE ContactPersons(
ID SERIAL PRIMARY KEY,
ContactPerson VARCHAR(100),
ContactPersonRole VARCHAR(20),
PhoneNumber VARCHAR(12)
);

ALTER TABLE Customers
ADD CONSTRAINT FK_Customers_ContactPersons FOREIGN KEY (ContactPersonID)
REFERENCES ContactPersons(ID);

ALTER TABLE Customers
DROP COLUMN City;
GO
CREATE TABLE ZipCodes(
ZipID VARCHAR(5) PRIMARY KEY,
City VARCHAR(255)
);
GO
ALTER TABLE Customers
ADD CONSTRAINT FK_Customers_ZipCodes FOREIGN KEY (Zip)
REFERENCES ZipCodes(ZipID)

SELECT * FROM animals;