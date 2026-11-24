CREATE DATABASE EraaSoftTask;
GO
USE EraaSoftTask;
GO

-- 1. Create Employees table
CREATE TABLE Employees (
    ID INT,
    Name VARCHAR(100),
    Salary DECIMAL(10, 2)
);

-- 2. Add Department column
ALTER TABLE Employees
ADD Department VARCHAR(50);

-- 3. Remove Salary column
ALTER TABLE Employees
DROP COLUMN Salary;

-- 4. Rename Department column to DeptName
EXEC sp_rename 'Employees.Department', 'DeptName', 'COLUMN';

-- 5. Create Projects table
CREATE TABLE Projects (
    ProjectID INT,
    ProjectName VARCHAR(100)
);

-- 6. Add Primary Key to Employees(ID)
ALTER TABLE Employees
ALTER COLUMN ID INT NOT NULL;

ALTER TABLE Employees
ADD CONSTRAINT PK_Employees_ID PRIMARY KEY (ID);

-- 7. Create Foreign Key relationship between Employees and Projects
ALTER TABLE Projects
ALTER COLUMN ProjectID INT NOT NULL;

ALTER TABLE Projects
ADD CONSTRAINT PK_Projects_ProjectID PRIMARY KEY (ProjectID);

ALTER TABLE Employees
ADD ProjectID INT;

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Projects
FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID);

-- 8. Remove Foreign Key relationship
ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Projects;

-- 9. Add Unique constraint to Employees(Name)
ALTER TABLE Employees
ADD CONSTRAINT UQ_Employees_Name UNIQUE (Name);

-- 10. Create Customers table
CREATE TABLE Customers (
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Status VARCHAR(20)
);

-- 11. Add Unique constraint on (FirstName, LastName)
ALTER TABLE Customers
ADD CONSTRAINT UQ_Customers_FullName UNIQUE (FirstName, LastName);

-- 12. Add Default 'Active' to Status
ALTER TABLE Customers
ADD CONSTRAINT DF_Customers_Status DEFAULT 'Active' FOR Status;

-- 13. Create Orders table
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2)
);

-- 14. Add Check constraint on TotalAmount > 0
ALTER TABLE Orders
ADD CONSTRAINT CHK_Orders_TotalAmount CHECK (TotalAmount > 0);

-- 15. Create Sales schema and move Orders into it
CREATE SCHEMA Sales;
GO

ALTER SCHEMA Sales TRANSFER dbo.Orders;
GO