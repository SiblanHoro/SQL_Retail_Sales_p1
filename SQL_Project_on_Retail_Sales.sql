CREATE Database RetailSales

Use RetailSales


SELECT * FROM Retail__Sales

---Data Cleaning

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


-- My Analysis & Findings

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'

SELECT * 
FROM Retail__Sales
WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022

SELECT * 
FROM Retail__Sales 
WHERE
     Category = 'Clothing' 
	 AND 
	 sale_date IN ('2022-11-01', '2022-11-30') 
	 AND 
	 quantity >=3;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT category,
     SUM(total_sale) AS Total_sales,
	 COUNT(*) AS Total_orders
FROM Retail__Sales
GROUP BY category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT
     ROUND(AVG(age), 0) AS Avg_Age
FROM Retail__Sales
WHERE category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT * 
FROM Retail__Sales
WHERE total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
     category,
	 gender,
     COUNT(*) AS Total_transaction
FROM Retail__Sales
GROUP BY gender, category
ORDER BY Total_transaction;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

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

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT TOP 5 
       customer_id,
       SUM(total_sale) AS Highest_sale             
FROM Retail__Sales
GROUP BY  customer_id
ORDER BY Highest_sale DESC;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
     category,
	 COUNT(DISTINCT customer_id) AS count_unique_customers
FROM Retail__Sales
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

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
	   

