CREATE DATABASE umuzi;

CREATE TABLE Customer(
   CustomerID SERIAL PRIMARY KEY,
   FirstName VARCHAR(50),
   LastName VARCHAR(50),
   Gender VARCHAR,
   Address VARCHAR(200),
   Phone INT,
   Email VARCHAR(100),
   City VARCHAR(20),
   Country VARCHAR(50)
);

CREATE TABLE Employees(
   EmployeeID SERIAL PRIMARY KEY,
   FirstName VARCHAR(50),
   LastName VARCHAR(50),
   Email VARCHAR(100),
   JobTitle VARCHAR(20)
);

CREATE TABLE Orders(
   OrderID INT,
   ProductID INT,
   PaymentID INT,
   FullfilledByEmployeeID INT,
   DateRequired DATE,
   DateShipped DATE,
   Status VARCHAR
   
);

CREATE TABLE Payments(
   CustomerID INT,
   PaymentID INT,
   PaymentDate DATE,
   Amount DECIMAL
   
);

CREATE TABLE Products(
   ProductID INT,
   ProductName VARCHAR(100),
   Description VARCHAR(300),
   BuyPrice DECIMAL
   
);

INSERT INTO Customer(FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES ('JOHN', 'HIBERT', 'MALE', '284 CHAUCER ST', '084789657', 'JOHN@GMAIL.COM', 'JOHANNESBURG', 'SOUTH AFRICA'),
  ('THANDO', 'SITHOLE', 'FEMALE', '240 SECT 1', '0794445584', 'THANO@GMAIL.COM', 'CAPE TOWN', 'SOUTH AFRICA'),
  ('LEON', 'GLEN', 'MALE', '81 EVERTON RD GILLITS', '0820832830', 'LEON@GMAIL.COM', 'DURBAN', 'SOUTH AFRICA'),
  ('CHARL', 'MULLER', 'MALE', '290A DORSET ECKE', '+44856872553', 'CARL.MULLER@YAHOO.COM', 'BERLIN', 'GERMANY'),
  ('JULIA', 'STEIN', 'FEMALE', '2 WERNERRING', '+448672445058', 'JS234@YAHOO.COM', 'FRANKFURT', 'GERMANY');

INSERT INTO Employees(FirstName, LastName, Email, JobTitle)
VALUES ('KANI', 'MATTHEW', 'MAT@GMAIL.COM', 'MANAGER'),
   ('LESLY', 'CRONJE', 'LESC@GMAIL.COM', 'CLERK'),
   ('GIDEON', 'MADUKU', 'M@GMAIL.COM', 'ACCOUNTANT');

INSERT INTO Orders(OrderID, ProductID, PaymentID, FullfilledByEmployeeID, DateRequired, DateShipped, Status)
VALUES ('1', '1', '1', '2', '05/09/2018',NULL, 'Not Shipped'),
  ('2', '1', '2', '2', '04/09/2018','04/09/2018', 'Shipped'),
  ('3', '3', '3', '3', '06/09/2018',NULL, 'Not Shipped');

INSERT INTO Payments(CustomerId, PaymentID, PaymentDate, Amount)
VALUES (1, 1, '01-09-2018', '150.75'),
   (5, 2,'03-09-2018', '150.75'),
   (4, 3, '03-09-2018', '700.60');

INSERT INTO Products(ProductId, ProductName, Description, BuyPrice)
VALUES ('1', 'Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', '150.75'),
     ('2', 'Classic Car', 'Turnable front wheels, steering function', '550.75'),
     ('3', ' Sport car', 'Turnable front wheels, steering function','700.60');

(1) SELECT * from Customer

(2) SELECT Firstname FROM Customer;

(3) SELECT * FROM Customer WHERE CustomerID = 1;

(4)   UPDATE Customer 
      SET Firstname = 'Lerato', 
      Lastname = 'Mabitso' 
      WHERE CustomerId = 1;

(5)   DELETE from Customer WHERE CustomerId = 2;

(6)   

(7) SELECT max(Amount) FROM Payments;

(8) SELECT * FROM Customer ORDER BY Country;

(9)   SELECT Buyprice FROM Products 
      WHERE Buyprice >= 100 and
      Buyprice <= 600;

(10)  SELECT * from Customer 
      WHERE Country = 'Germany' 
      and City = 'Berlin';

(11)  SELECT * from Customer 
      WHERE City = 'Cape Town' 
      or City = 'Durban';

(12)  SELECT * FROM Products
      WHERE Buyprice > 500;

(13)  

(14)  SELECT COUNT(distinct status)
      FROM Orders
      WHERE status = 'Shipped';

(15)  

(16)  SELECT * FROM payments
      INNER JOIN customer
      ON customer.customerid = payments.paymentid;

(17)  