-- DATABASE CREATION --
CREATE DATABASE Shopkart;
USE Shopkart;

-- CUSTOMERS TABLE --
CREATE TABLE Customers(
Customer_ID VARCHAR(20) PRIMARY KEY,
Customer_Name TEXT,
Gender TEXT,
Date_of_Birth DATE,
Age INT,
Phone VARCHAR(200),
Email VARCHAR(200),
City TEXT,
State TEXT,
Registration_Date DATE
);

-- CATEGORY TABLE --
CREATE TABLE Category(
Category_ID VARCHAR(20) PRIMARY KEY,
Category_Name VARCHAR(200),
Description VARCHAR(255)
);

-- PRODUCTS TABLE --
CREATE TABLE Products(
Product_ID VARCHAR(20) PRIMARY KEY,
Category_ID VARCHAR(20),
Product_Name VARCHAR(255),
Manufacture_Date DATE,
Expiry_Date DATE,
Price DECIMAL(20,2),
GST INT,
Stock INT,
Rating DECIMAL(2,1),
FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

-- ORDERS TABLE --
CREATE TABLE Orders(
Order_ID VARCHAR(20) PRIMARY KEY,
Customer_ID VARCHAR(20),
Order_Date DATE,
Order_Total DECIMAL(20,2),
Order_Status TEXT,
FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

-- ORDER_ITEMS TABLE --
CREATE TABLE Order_Items(
Order_Item_ID VARCHAR(30) PRIMARY KEY,
Order_ID VARCHAR(20),
Product_ID VARCHAR(20),
Quantity INT,
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- PAYMENTS TABLE --
CREATE TABLE Payments(
Payment_ID VARCHAR(20) PRIMARY KEY,
Order_ID VARCHAR(20),
Payment_Code VARCHAR(200),
Payment_Method TEXT,
Total_Amount DECIMAL(20,2),
Payment_Status TEXT,
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);