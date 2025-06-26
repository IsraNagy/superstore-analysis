SELECT *
	FROM super_store;

	--cheking missing values
	SELECT *
	FROM super_store
	WHERE
	order_date is null
	OR ship_date is null
	OR ship_mode is null
	OR customer_id is null
	OR customer_name is null
	OR segment is null
	OR country is null
	OR city is null
	OR state is null
	OR region is null
	OR product_id is null
	OR category is null
	OR sub_category is null
	OR product_name is null
	OR order_id is null
	OR sales is null
	OR profit is null
	OR discount is null;

	--Count total rows
	SELECT COUNT(*) AS total_rows
	FROM super_store;
	
	--Check for empty strings or unusual values
	SELECT *
	FROM super_store
	WHERE TRIM(order_id) = '';
	
	--check on duplicates
	SELECT *, count(*) as duplicate_count
	FROM super_store
	GROUP BY row_id,order_id, order_date, ship_date, order_processing_time, ship_mode, customer_id, customer_name, segment,
	country, city, state, postal_code, region, product_id, category, sub_category, product_name,
	sales, quantity, discount, profit, net_profit_margin
	HAVING count(*) >1;

	--check outliers in profit
	SELECT *
	FROM super_store
	WHERE Profit > (SELECT AVG(Profit) + 3 * stdev(Profit) FROM super_store)
	ORDER BY Profit DESC;

	--Count of each category
	SELECT category, COUNT(*) AS count
	FROM super_store
	GROUP BY category
	ORDER BY count DESC;


	--Basic statistics for profit
	SELECT
	MIN(profit) AS min_value,
	MAX(profit) AS max_value,
	AVG(profit) AS average_value,
	SUM(profit) AS total_value,
	COUNT(profit) AS count_non_null
	FROM super_store;
	