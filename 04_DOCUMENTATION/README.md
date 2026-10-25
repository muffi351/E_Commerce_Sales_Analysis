# E-Commerce Sales Analysis Using SQL



## Project Overview



This project analyzes e-commerce sales data using Microsoft SQL Server. It explores sales performance, customer purchasing behavior, product performance, order trends, and customer reviews using SQL queries.


The goal is to demonstrate practical SQL skills relevant to Data Analyst role.



## Tools & Technologies


* Microsoft SQL Server 2025
* SQL Server Management Studio (SSMS)
* SQL
* CSV files for datasets
* GitHub for project documentation and version control



## Database Information


Database Name: ''E_Commerce_Sales_Data''


The database contains six tables:


| Table Name  | Number of Rows |
| ----------------| ----------------------|
| Customers     |            950          |
| Products        |            250          |
| Orders           |          1,000         |
| Order Details |          2,500        |
| Reviews         |            500         |
| Inventory       |            250         |
| TOTAL         |          5,450       |



## SQL Concepts Demonstrated


*SELECT, WHERE, ORDER BY, and DISTINCT
*Aggregate functions
*GROUP BY and HAVING
*INNER JOIN and LEFT JOIN
*Subqueries and Common Table Expressions (CTEs)
*CASE expressions
*Date functions and monthly analysis
*Window functions
*ROW_NUMBER and LAG
*Running totals
*Ranking and filtering
*EXISTS and NOT EXISTS
*Anti-join techniques
*Revenue calculations and percentage analysis



## Business Questions and SQL Analysis

The project includes SQL queries designed to answer the following business questions.

### Sales Performance


1. Overall Business Metrics: What are the total revenue, total number of orders, and average order value?
2. Monthly Sales Performance: What are the monthly revenue and order counts?
3. Top Revenue-Generating Months: Which months generated the highest revenue?
4. Category Performance: Which product categories generate the most revenue, and how many units were sold in each category?
5. Monthly Revenue Running Total: How does cumulative revenue change over time?
6. Month-over-Month Revenue Growth: How does revenue change compared with the previous month?
7. Revenue by Payment Method: How much revenue does each payment method generate per month?
8. Revenue by Order Status: How is revenue distributed across different order statuses?
9. Consecutive Monthly Revenue Growth: Which customers experienced increasing revenue across consecutive months?



### Customer Analysis


10. Top 10 Customers by Spending: Which customers have spent the most?
11. Customers Spending Above Average: Which customers have spending above the average customer spending?
12. Latest Order per Customer: What is the latest order placed by each customer?
13. Second-Most-Recent Order: What is the second-most-recent order for each customer?
14. Repeat Monthly Purchasing: Which customers placed orders in at least three different calendar months?
15. Customers Who Ordered but Never Reviewed: Which customers placed orders but have not submitted any product reviews?
16. Multiple Orders on the Same Date: Which customers placed multiple orders on the same date?
17. Customers with No Orders: Which customers have never placed an order?
18. Customers Purchasing from Multiple Categories: Which customers purchased products from at least three different categories?
19. Customers Whose Latest Order Was Cancelled: Which customers have a cancelled latest order?


### Product and Review Analysis


20. Top-Selling Product by Category: Which product ranks first in sales within each category?
21. Products with Below-Average Sales Quantity: Which products have a quantity sold below the average product quantity sold?
22. Products Never Reviewed: Which products have not received any reviews?
23. Top 5 Products by Average Rating: Which five products have the highest average review ratings?
24. Largest Order per Customer: What is the highest-value order placed by each customer?
25. Product Revenue Contribution: What percentage of total revenue does each product contribute?
26. Products Never Ordered: Which products have never appeared in an order?



## Key SQL Techniques Used

CTEs: Simplify complex queries into readable steps.
Window Functions: Rank records, compare periods, and calculate running totals.
Joins: Combine customer, order, product, and review data.
Subqueries: Compare customer and product metrics with calculated averages.
EXISTS / NOT EXISTS: Identify records with or without related records.
Aggregate Functions: Calculate revenue, order counts, quantities, and average ratings.
Date Functions: Analyze monthly sales and customer ordering patterns.



## Project Folder Structure

E-Commerce-Sales-Analysis/

│
├── 01_Database/
│   └── bulkinsert.sql
│
├── 02_Data/
│   ├── Customers.csv
│   ├── Products.csv
│   ├── Orders.csv
│   ├── OrderDetails.csv
│   ├── Reviews.csv
│   └── Inventory.csv
│
├── 03_Analysis\_SQL/
│   ├── ECommerce\_Sales\_Analysis.sql
│   └── Individual SQL query files
│
├── 04_Documentation/
│   └── README.md
│
└── 05_Screenshots/

```
\## Project Outcome

This project demonstrates how SQL can be used to analyze e-commerce data and answer practical business questions about revenue, customer behavior, product sales, and reviews.

It showcases SQL skills useful for Data Analyst roles, including joins, aggregations, CTEs, subqueries, and window functions.

\## Author

Mufees C