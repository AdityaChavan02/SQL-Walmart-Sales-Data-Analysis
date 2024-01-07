WALMART SALES DATA ANALYSIS
Author: @Aditya Chavan
GitHub Repository: https://github.com/AdityaChavan02/SQL-Walmart-Sales-Data-Analysis.git

ABOUT:
1)The Project aims to analyse the Walmart Sales data to understand the performance of products and the sales trends at specific Walmart stores
2)The Project aims to understand and get an overview of Consumer Payment Behaviour.
3)Finally the study aims to know how different strategies can be optimized during Holiday and Non-Holiday weeks at different stores for different products to optimize the markdowns and increase sales.

DATASET DESCRIPTION:
The Dataset was obtained from https://github.com/Princekrampah/WalmartSalesAnalysis.git
The Dataset contains transactions from 3 different branches namely, Yangon, Naypyitaw and Mandalay
The Dataset contains 17 columns and 1000 rows.

COLUMN DESCRIPTION:
Check the Image Table for a description of the columns.

ANALYSIS QUESTIONS:
SET 1:
1) How many unique product lines does the data have?
2) What product category is the best seller defined by largest revenue?
3) What is the most common product line by gender?

SET 2:
1)What was the most common method of payment across different product lines?
2)Which Customer type brings the most revenue?
3)Does being a Member/Non-Member affect the rating given to the Purchase?

SET 3:
1) What is the ratio of Member/Non-Member for each branch?
2) In what time frame(months) was the COGS highest?
3) Which method of payment is more often used across the branches? 

DATA ANALYSIS:

Data Pre-processing
Upon Inspection of the dataset, these are the results and the related actions to be taken:

1) No NULL values exist in any columns of the Dataset for all records, so there is no need to drop any columns.
   Further, we have added the NOT NULL Constraint to the column names to ensure no null values exist while creating of table in MySQL.

2) The Purchase_date and Purchase_time columns are not sorted due to which the records are listed randomly.
   For this, we will sort the records based on both the above columns(Date first then time) to ensure that records are consistent.

3) We also move the Purchase_date, Purchase_time columns to after the Product_line column for better understandibility.
