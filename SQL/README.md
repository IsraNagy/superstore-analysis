**SQL Queries for Sales Data Analysis**

📌 **Overview**
This folder contains SQL scripts used for exploring and analyzing the Super Store dataset.
The queries focus on data cleaning, descriptive statistics, performance analysis, and business insights.

📂 **Files in This Folder**
1. data_exploration.sql
Contains SQL queries for initial data checks and exploration, including:

Viewing all data from the dataset

Checking for missing values

Counting total rows

Detecting empty strings or unusual values

Identifying duplicates

Finding outliers in profit

Counting occurrences of each category

Calculating basic profit statistics (min, max, avg, sum, count)

2. **analysis_queries.sql**
Contains SQL queries for in-depth business analysis, such as:

Performance analysis by region, state, and category (sales & profit)

Top 10 customers by spending

Number of visits per customer

Monthly and yearly sales trends

Total orders per year and per month

Quantity sold per year

Identifying products with negative profit

Most profitable categories

Effect of discount on profit

Regions with high discount rates but low profit

Last order date in the dataset

Customer retention opportunities (days since last purchase)

Descriptive statistics to understand data scale

⚙️ **Requirements****
These queries were written for SQL Server syntax (T-SQL).
If you are using MySQL or PostgreSQL, some functions (e.g., FORMAT, DATEPART) may need adjustments.

📈 **How to Use****
Import the super_store dataset into your SQL Server environment.

Run data_exploration.sql first to check for data quality issues.

Use analysis_queries.sql to perform business insights analysis.

Use the query results in Excel or Tableau for visualization and dashboard creation.

📝 Notes
Dates in retention queries are set to '2014-12-31' because the dataset ends in 2014.

Profit thresholds and discount rate cutoffs were determined based on descriptive statistics from the dataset.

This SQL analysis complements the Excel cleaning and Tableau dashboard parts of the project.

