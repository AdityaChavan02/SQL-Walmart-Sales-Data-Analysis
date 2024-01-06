CREATE DATABASE IF NOT EXISTS WalmartSalesData;

-- Initialize Database
USE WalmartSalesData;

-- Create Sales Table with Necessary Columns 
CREATE TABLE IF NOT EXISTS Sales(
	Invoice_ID VARCHAR (30) NOT NULL UNIQUE PRIMARY KEY,
    Branch VARCHAR (5) NOT NULL,
    City VARCHAR(30) NOT NULL,
    Customer VARCHAR(30) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Product_line VARCHAR(100) NOT NULL,
    Unit_price DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    Tax FLOAT NOT NULL,
    Total_value DECIMAL (10, 5) NOT NULL,
	Purchase_date DATE NOT NULL,
    Purchase_time TIME NOT NULL,
    Payment_type VARCHAR(15) NOT NULL,
    COGS DECIMAL(10,2) NOT NULL,
    Gross_margin_percent FLOAT NOT NULL,
    Gross_income DECIMAL (10,2) NOT NULL,
    Rating FLOAT NOT NULL
);

DROP TABLE sales;
SELECT *
FROM Sales;

-- How many unique product lines does the data have?

-- What product category is the best seller defined by largest  revenue?

-- What is the most common product line by gender?

-- What was the most common method of payment across different product lines?

-- Which customer type brings the most revenue?

-- Does being a Member/Non-Member affect the rating given to the Purchase?

-- What is the ratio of Member/Non-Member for each branch?

-- In what time frame(months) was the COGS highest?

-- Which method of payment is more oftenly used across the branches?

