
	--Preformance analysis by region, state, category
	SELECT region, state, category, sum(sales) as total_sales
	FROM super_store
	Group by region, state,category
	Order by total_sales DESC;

	SELECT region, state, category, sum(profit) as total_profit
	FROM super_store
	Group by region, state, category
	Order by total_profit DESC;


	--The top 10 customers in total spending
	SELECT top 10
	customer_id,customer_name, sum(sales) as total_spending
	FROM super_store
	GROUP BY customer_name, customer_id
	ORDER BY "total_spending" desc; 

	
	-- number of visits per customer
	SELECT Customer_Name, customer_id, COUNT(DISTINCT Order_ID) AS number_of_vists
	FROM super_store
	GROUP BY Customer_Name, customer_id
	ORDER BY Customer_Name;

	--Monthly sales for each year
	SELECT year, month, month_number,
	SUM (daily_sales) AS monthly_sales
	FROM (
			select FORMAT(order_date, 'yyyy') AS year, 
	               FORMAT(order_date, 'MMMM') AS month,
				   DATEPART(MONTH, order_date) AS month_number,
				   sales AS daily_sales
	        from super_store) AS sub 
	GROUP BY year, month, month_number 
    ORDER BY year, month_number;

	--Total orders for every year
	SELECT year,
	count (distinct orders_number) AS orders
	FROM (
			select FORMAT(order_date, 'yyyy') AS year, 
	          
				   Order_ID AS orders_number
	        from super_store) AS sub 
	GROUP BY year
    ORDER BY year

    --orders number per month
	SELECT year, month, month_number,

	count (distinct orders) AS monthly_sales
	FROM (
			select FORMAT(order_date, 'yyyy') AS year, 
	               FORMAT(order_date, 'MMMM') AS month,
				   DATEPART(MONTH, order_date) AS month_number,
				   order_id AS orders
	        from super_store) AS sub 
	GROUP BY year, month, month_number 
    ORDER BY year, month_number;
	

	-- The Quanitty sold per year
	SELECT year,
	sum (yearly_quantity) AS quantity_sold
	FROM (
			select FORMAT(order_date, 'yyyy') AS year, 
	        Quantity AS yearly_quantity
	        from super_store) AS sub 
	GROUP BY year
    ORDER BY year;

	
	-- THE products with negative profit 
	SELECT product_name,category,sub_category, SUM(profit) as the_negative_profit
	FROM super_store
	GROUP BY  product_name,category,sub_category
	HAVING SUM(profit) < '0'
	ORDER BY "the_negative_profit" ASC;

	--Most profitable categories
	SELECT category, sum(profit) AS highst_profit
	FROM super_store
	GROUP BY category
	ORDER BY highst_profit DESC;

	-- The effect of the discount on profit, if discounts are causing negative profit 
	SELECT product_id, product_name, AVG(discount) AS avg_discount, 
	SUM(sales) AS total_sales, SUM(profit) AS total_profit
	FROM super_store
	GROUP BY product_id, product_name
	HAVING SUM(profit) < '0'
	ORDER BY total_profit;


	-- Descriptive statistics to understand the data scale 
	SELECT region, 
	AVG(discount) AS avg_discount, 
	AVG(profit) AS avg_profit, 
	SUM(profit) AS sum_profit
	FROM super_store
	GROUP BY region;
	
	-- High discount and low profit 
	SELECT region,
	AVG(discount) AS avg_discount, 
	AVG(profit) AS avg_profit,
	SUM(profit) AS sum_profit
	FROM super_store
	GROUP BY region
	HAVING AVG(discount) > 0.20 AND AVG(profit) < 20 AND SUM(profit) < 50000;

	--last order date 
	SELECT MAX(order_date) AS last_order
	FROM super_store;

	--Customer retention opportunity 
	Select customer_id, customer_name,
	MAX(order_date) AS last_order, 
	DATEDIFF(DAY, MAX(Order_Date), '2014-12-31') AS Days_Since_Last_Purchase
	FROM super_store
	GROUP BY customer_id, customer_name
	ORDER BY Days_Since_Last_Purchase DESC