CREATE DATABASE IF NOT EXISTS WalmartSalesData;

USE WalmartSalesData;

CREATE TABLE IF NOT EXISTS Sales(
	Invoice_ID VARCHAR (15) NOT NULL UNIQUE PRIMARY KEY,
    Branch VARCHAR (2) NOT NULL,
    City VARCHAR(10) NOT NULL,
    Customer VARCHAR(15) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Product_line VARCHAR(25) NOT NULL,
    Unit_price DECIMAL(5, 2) NOT NULL,
    Quantity INT NOT NULL,
    Tax FLOAT NOT NULL,
    Total_value DECIMAL (7, 5) NOT NULL,
	Purchase_date DATE NOT NULL,
    Purchase_time TIME NOT NULL,
    Payment_type VARCHAR(15) NOT NULL,
    COGS DECIMAL(5,2) NOT NULL,
    Gross_margin_percent FLOAT NOT NULL,
    Gross_income DECIMAL (5,5) NOT NULL,
    Rating FLOAT NOT NULL
);


SELECT *
FROM Sales;