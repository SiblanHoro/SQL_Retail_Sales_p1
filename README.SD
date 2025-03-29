Retail Sales Analysis SQL Project

Project Overview

Project Title: Retail Sales Analysis

Level: Beginner

Database: RetailSales

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

Objectives

Set up a retail sales database: Create and populate a retail sales database with the provided sales data.
Data Cleaning: Identify and remove any records with missing or null values.
Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.
Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.
Project Structure

1. Database Setup

Database Creation: The project starts by creating a database named RetailSales.
Table Creation: A table named retail_sales is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

CREATE DATABASE RetailSales;

CREATE TABLE retail__sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);

2. Data Exploration & Cleaning
   
Record Count: Determine the total number of records in the dataset.
Customer Count: Find out how many unique customers are in the dataset.
Category Count: Identify all unique product categories in the dataset.
Null Value Check: Check for any null values in the dataset and delete records with missing data.

SELECT COUNT(*) FROM retail__sales;
SELECT COUNT(DISTINCT customer_id) FROM retail__sales;
SELECT DISTINCT category FROM retail__sales;

SELECT * FROM Retail__Sales
WHERE sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL

DELETE FROM Retail__Sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL

3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

Q.1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

Q.2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022:

SELECT * 
FROM Retail__Sales 
WHERE
     Category = 'Clothing' 
	 AND 
	 sale_date BETWEEN '2022-11-01' AND '2022-11-30' 
	 AND 
	 quantity >= 3;

Q. 3. Write a SQL query to calculate the total sales (total_sale) for each category.:

SELECT category,
     SUM(total_sale) AS Total_sales,
	 COUNT(*) AS Total_orders
FROM Retail__Sales
GROUP BY category;

Q.4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail_sales
WHERE category = 'Beauty'

Q.5. Write a SQL query to find all transactions where the total_sale is greater than 1000.:

SELECT * FROM retail_sales
WHERE total_sale > 1000

Q. 6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

SELECT 
     category,
	 gender,
     COUNT(*) AS Total_transaction
FROM Retail__Sales
GROUP BY gender, category
ORDER BY Total_transaction;

Q.7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

SELECT 
     Sale_year,
	 sale_month,
	 Avg_monthly_sales
FROM (
      SELECT YEAR(sale_date) AS Sale_year,
             MONTH(sale_date) AS sale_month,
	         AVG(total_sale) AS Avg_monthly_sales,
	         RANK() OVER(PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS RANKS
      FROM Retail__Sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS Best_selling_Month
WHERE RANKS = 1;

Q. 8. Write a SQL query to find the top 5 customers based on the highest total sales :

SELECT TOP 5 
       customer_id,
       SUM(total_sale) AS Highest_sale             
FROM Retail__Sales
GROUP BY  customer_id
ORDER BY Highest_sale DESC;

Q.9. Write a SQL query to find the number of unique customers who purchased items from each category.:

SELECT 
     category,
	 COUNT(DISTINCT customer_id) AS count_unique_customers
FROM Retail__Sales
GROUP BY category;

Q.10. Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

SELECT 
      CASE
           WHEN CAST(sale_time AS TIME) < '12:00:00' THEN 'Morning'
		   WHEN CAST(sale_time AS TIME) BETWEEN '12:00:00' AND '17:00:00' THEN 'Afternoon'
		   ELSE 'Evening'
      END AS Shifts,
		   COUNT(*) AS Orders_count
FROM Retail__Sales
GROUP BY 
      CASE
          WHEN CAST(sale_time AS TIME) < '12:00:00' THEN 'Morning'
		  WHEN CAST(sale_time AS TIME) BETWEEN '12:00:00' AND '17:00:00' THEN 'Afternoon'
		  ELSE 'Evening'
	 END;

Findings
Customer Demographics: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
High-Value Transactions: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
Sales Trends: Monthly analysis shows variations in sales, helping identify peak seasons.
Customer Insights: The analysis identifies the top-spending customers and the most popular product categories.
Reports
Sales Summary: A detailed report summarizing total sales, customer demographics, and category performance.
Trend Analysis: Insights into sales trends across different months and shifts.
Customer Insights: Reports on top customers and unique customer counts per category.
Conclusion
This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

How to Use
Clone the Repository: Clone this project repository from GitHub.
Set Up the Database: Run the SQL scripts provided in the database_setup.sql file to create and populate the database.
Run the Queries: Use the SQL queries provided in the analysis_queries.sql file to perform your analysis.
Explore and Modify: Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.
Author - Zero Analyst
This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!

Stay Updated and Join the Community
For more content on SQL, data analysis, and other data-related topics, make sure to follow me on social media and join our community:

YouTube: Subscribe to my channel for tutorials and insights
Instagram: Follow me for daily tips and updates
LinkedIn: Connect with me professionally
Discord: Join our community to learn and grow together
Thank you for your support, and I look forward to connecting with you!

Retail-Sales-Analysis-SQL-Project--P1/README.md at main · najirh/Retail-Sales-Analysis-SQL-Project--P1 # SQL_Retail_Sales_p1
