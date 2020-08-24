--1. creating a database called Umuzi
CREATE DATABASE umuzi;

--2. creating a table called customer
CREATE TABLE Customer(
   CustomerID SERIAL PRIMARY KEY,
   FirstName VARCHAR(50),
   LastName VARCHAR(50),
   Gender VARCHAR,
   Address VARCHAR(200),
   Phone VARCHAR,
   Email VARCHAR(100),
   City VARCHAR(20),
   Country VARCHAR(50)
);
-- creating a table called employees
CREATE TABLE Employees(
   EmployeeID SERIAL PRIMARY KEY,
   FirstName VARCHAR(50),
   LastName VARCHAR(50),
   Email VARCHAR(100),
   JobTitle VARCHAR(20)
);

-- creating a table called orders
CREATE TABLE Orders(
   OrderID INT,
   ProductID INT,
   PaymentID INT,
   FullfilledByEmployeeID INT,
   DateRequired DATE,
   DateShipped DATE,
   Status VARCHAR
   
);

-- creating a table called payments
CREATE TABLE Payments(
   CustomerID INT,
   PaymentID INT,
   PaymentDate DATE,
   Amount DECIMAL
   
);
-- creating a table called products
CREATE TABLE Products(
   ProductID INT,
   ProductName VARCHAR(100),
   Description VARCHAR(300),
   BuyPrice DECIMAL
   
);

-- inserting recods in the table
INSERT INTO Customer(FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES ('JOHN', 'HIBERT', 'MALE', '284 CHAUCER ST', '084789657', 'JOHN@GMAIL.COM', 'JOHANNESBURG', 'SOUTH AFRICA'),
  ('THANDO', 'SITHOLE', 'FEMALE', '240 SECT 1', '0794445584', 'THANO@GMAIL.COM', 'CAPE TOWN', 'SOUTH AFRICA'),
  ('LEON', 'GLEN', 'MALE', '81 EVERTON RD GILLITS', '0820832830', 'LEON@GMAIL.COM', 'DURBAN', 'SOUTH AFRICA'),
  ('CHARL', 'MULLER', 'MALE', '290A DORSET ECKE', '+44856872553', 'CARL.MULLER@YAHOO.COM', 'BERLIN', 'GERMANY'),
  ('JULIA', 'STEIN', 'FEMALE', '2 WERNERRING', '+448672445058', 'JS234@YAHOO.COM', 'FRANKFURT', 'GERMANY');

-- inserting recods in the table
INSERT INTO Employees(FirstName, LastName, Email, JobTitle)
VALUES ('KANI', 'MATTHEW', 'MAT@GMAIL.COM', 'MANAGER'),
   ('LESLY', 'CRONJE', 'LESC@GMAIL.COM', 'CLERK'),
   ('GIDEON', 'MADUKU', 'M@GMAIL.COM', 'ACCOUNTANT');

-- inserting recods in the table
INSERT INTO Orders(OrderID, ProductID, PaymentID, FullfilledByEmployeeID, DateRequired, DateShipped, Status)
VALUES ('1', '1', '1', '2', '05/09/2018',NULL, 'Not Shipped'),
  ('2', '1', '2', '2', '04/09/2018','04/09/2018', 'Shipped'),
  ('3', '3', '3', '3', '06/09/2018',NULL, 'Not Shipped');

-- inserting recods in the table
INSERT INTO Payments(CustomerId, PaymentID, PaymentDate, Amount)
VALUES (1, 1, '01-09-2018', '150.75'),
   (5, 2,'03-09-2018', '150.75'),
   (4, 3, '03-09-2018', '700.60');

-- inserting recods in the table
INSERT INTO Products(ProductId, ProductName, Description, BuyPrice)
VALUES ('1', 'Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', '150.75'),
     ('2', 'Classic Car', 'Turnable front wheels, steering function', '550.75'),
     ('3', ' Sport car', 'Turnable front wheels, steering function','700.60');

-- selecting all records from table customers
SELECT * from Customer

-- selecting records only from the name column in the Customers table
SELECT Firstname FROM Customer;

--Showing the name of the Customer whose CustomerID is 1
SELECT * FROM Customer WHERE CustomerID = 1;

--updating the record for CustomerID = 1 on the Customer table so that the name is “Lerato Mabitso
UPDATE Customer 
SET Firstname = 'Lerato', 
Lastname = 'Mabitso' 
WHERE CustomerId = 1;

-- deleting the record from the Customers table for customer 2 (CustomerID = 2).
DELETE from Customer WHERE CustomerId = 2;

--Selecting all unique statuses from the Orders table and get a count of the number of orders for each unique status
SELECT count(status)
FROM orders;

-- Returning the MAXIMUM payment made on the PAYMENTS table.
SELECT max(Amount) FROM Payments;

-- Selecting all customers from the “Customers” table, sorted by the “Country” column
SELECT * FROM Customer ORDER BY Country;

-- Selecting all products with a price BETWEEN R100 and R600.
SELECT Buyprice FROM Products 
WHERE Buyprice >= 100 and
Buyprice <= 600;

-- Selecting all fields from “Customers” where country is “Germany” AND city is “Berlin”.
SELECT * from Customer 
WHERE Country = 'Germany' 
and City = 'Berlin';

-- Selecting all fields from “Customers” where city is “Cape Town” OR “Durban”.
SELECT * from Customer 
WHERE City = 'Cape Town' 
or City = 'Durban';

--Selecting all records from Products where the Price is GREATER than R500.
SELECT * FROM Products
WHERE Buyprice > 500;

-- Returning the sum of the Amounts on the Payments table.
SELECT SUM(amount)
FROM payments;

-- Counting the number of shipped orders in the Orders table.
SELECT COUNT(distinct status)
FROM Orders
WHERE status = 'Shipped';

-- Returning the average price of all Products, in Rands and in Dollars (assume the exchange rate is R12 to the Dollar).
SELECT AVG(buyprice)/12
FROM products

--Using INNER JOIN create a query that selects all Payments with Customer information.
SELECT
Customer.customerid,
Firstname,
Lastname,
email,
Amount,
Paymentdate
FROM
Customer
INNER JOIN payments ON payments.customerid = customer.customerid;

-- Selecting all products that have turnable front wheels
SELECT COUNT(description)
FROM products
WHERE description like  '%Turnable front wheels%';
