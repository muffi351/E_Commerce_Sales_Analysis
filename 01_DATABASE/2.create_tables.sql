 
IF DB_ID(N'E_Commerce_Sales_Data') IS NULL
    CREATE DATABASE ECommerceSalesDB;
GO
USE  E_Commerce_Sales_Data;
GO

-- Drop child tables first if re-running this script.
DROP TABLE IF EXISTS dbo.Reviews;
DROP TABLE IF EXISTS dbo.OrderDetails;
DROP TABLE IF EXISTS dbo.Inventory;
DROP TABLE IF EXISTS dbo.Orders;
DROP TABLE IF EXISTS dbo.Products;
DROP TABLE IF EXISTS dbo.Customers;
GO

CREATE TABLE dbo.Customers (
    CustomerID INT NOT NULL PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email VARCHAR(120) NOT NULL UNIQUE,
    Gender NVARCHAR(30) NOT NULL,
    City NVARCHAR(60) NOT NULL,
    State NVARCHAR(60) NOT NULL,
    SignupDate DATE NOT NULL
);

 CREATE TABLE dbo.Products (
    ProductID INT NOT NULL PRIMARY KEY,
    ProductName NVARCHAR(120) NOT NULL,
    Category NVARCHAR(60) NOT NULL,
    Brand NVARCHAR(60) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    CostPrice DECIMAL(10,2) NOT NULL CHECK (CostPrice > 0),
    Supplier NVARCHAR(100) NOT NULL,
    CONSTRAINT CK_Products_CostPrice CHECK (CostPrice < Price)

);

CREATE TABLE dbo.Orders (
    OrderID INT NOT NULL PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    PaymentMethod NVARCHAR(40) NOT NULL,
    OrderStatus NVARCHAR(30) NOT NULL CHECK (OrderStatus IN ('Delivered','Shipped','Processing','Cancelled')),
    ShippingCity NVARCHAR(60) NOT NULL,
    ShippingCost DECIMAL(10,2) NOT NULL CHECK (ShippingCost >= 0),
    OrderTotal DECIMAL(12,2) NOT NULL CHECK (OrderTotal >= 0),
    DeliveryDate DATE NULL,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID)
);

CREATE TABLE dbo.OrderDetails (
    OrderDetailID INT NOT NULL PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice > 0),
    Discount DECIMAL(4,2) NOT NULL CHECK (Discount >= 0 AND Discount <= 0.25),
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES dbo.Orders(OrderID),
    CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID)
);

CREATE TABLE dbo.Reviews (
    ReviewID INT NOT NULL PRIMARY KEY,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    Rating TINYINT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    ReviewDate DATE NOT NULL,
    ReviewText NVARCHAR(200) NOT NULL,
    CONSTRAINT FK_Reviews_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID),
    CONSTRAINT FK_Reviews_Products FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID)
);

CREATE TABLE dbo.Inventory (
    ProductID INT NOT NULL PRIMARY KEY,
    StockQuantity INT NOT NULL CHECK (StockQuantity >= 0),
    ReorderLevel INT NOT NULL CHECK (ReorderLevel >= 0),
    LastRestockDate DATE NOT NULL,
    CONSTRAINT FK_Inventory_Products FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID)
);
GO
