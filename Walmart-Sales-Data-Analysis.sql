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

SELECT *
FROM Sales;

-- How many unique product lines does the data have?
SELECT DISTINCT Product_line, COUNT(Product_line)
FROM sales
GROUP BY Product_line;

-- What product line is the best seller defined by largest revenue(indicated by total value)?
SELECT Product_line, SUM(Total_value) AS Totalvalue
FROM sales
GROUP BY Product_line
ORDER BY Totalvalue DESC;

-- What is the most common product line by gender?
SELECT Product_line, SUM(CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END) AS MALE,
		SUM(CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END) AS FEMALE
FROM sales
GROUP BY Product_line
ORDER BY MALE DESC, FEMALE DESC,Product_line;

-- What was the most common method of payment across different product lines?
SELECT Product_line, SUM(CASE WHEN Payment_type = 'Credit card' THEN 1 ELSE 0 END) AS CREDIT_CARD,
		SUM(CASE WHEN Payment_type = 'Ewallet' THEN 1 ELSE 0 END) AS EWALLET,
        SUM(CASE WHEN Payment_type = 'Cash' THEN 1 ELSE 0 END) AS CASH
FROM sales
GROUP BY Product_line
ORDER BY CREDIT_CARD DESC, EWALLET DESC, CASH DESC;
	
-- Which customer type brings the most revenue across the three branches?
SELECT Branch,City,Customer, SUM(Total_value) AS Totalvalue
FROM sales
GROUP BY Branch, City, Customer
ORDER BY Branch,City,Totalvalue DESC;

-- Does being a Member/Non-Member affect the rating given to the Purchase across different branches?
SELECT Branch, City,Customer, AVG(Rating) AS AVG_Rating
FROM sales
GROUP BY Branch, City, Customer
ORDER BY Branch,City,Customer DESC;

-- What is the ratio of Member/Non-Member for each branch?
SELECT Branch, City, Customer, COUNT(*) AS COUNT, 
		COUNT(*)/SUM(COUNT(*)) OVER (PARTITION BY Branch) AS Ratio
FROM sales
GROUP BY Branch,City,Customer
ORDER BY Branch,Customer;

-- In what time frame(months) was the COGS highest?
SELECT 
	EXTRACT(YEAR_MONTH FROM Purchase_date) AS YearMonth,
	SUM(COGS) AS TotalCOGS
FROM sales
GROUP BY YearMonth
ORDER BY TotalCOGS DESC
LIMIT 1;

-- Which method of payment is more oftenly used across the branches?
SELECT Branch, City, SUM(CASE WHEN Payment_type = 'Credit card' THEN 1 ELSE 0 END) AS CREDIT_CARD,
		SUM(CASE WHEN Payment_type = 'Ewallet' THEN 1 ELSE 0 END) AS EWALLET,
        SUM(CASE WHEN Payment_type = 'Cash' THEN 1 ELSE 0 END) AS CASH
FROM sales
GROUP BY Branch, City
ORDER BY CREDIT_CARD DESC, EWALLET DESC, CASH DESC;
