SELECT
*
FROM
bright.coffee.bright_learn
LIMIT
10;

-------------------------------------------------------------------------------------------------------
-- Checking number of coffee shop
SELECT DISTINCT store_location
FROM
bright.coffee.bright_learn
--------------------------------------------------------------------------------------------------------- Checking number of products
SELECT DISTINCT product_category
FROM
bright.coffee.bright_learn
--------------------------------------------------------------------------------------------------------- CHecking the number of product type
SELECT DISTINCT product_type
FROM
bright.coffee.bright_learn
--------------------------------------------------------------------------------------------------------- Checking the earlist transcation date
SELECT MIN(transaction_date) AS First_operating_date
FROM
bright.coffee.bright_learn;
-------------------------------------------------------------------------------------------------------
-- Checking the latest transcation date
SELECT MAX(transaction_date) AS Last_operating_date
FROM
bright.coffee.bright_learn;
--------------------------------------------------------------------------------------------------------- Checking the earlist time
SELECT MIN(transaction_time) AS Earliest_time
FROM
bright.coffee.bright_learn;
--------------------------------------------------------------------------------------------------------- Checking the latest time
SELECT MAX(transaction_time) AS Latest_time
FROM
bright.coffee.bright_learn;
--------------------------------------------------------------------------------------------------------

SELECT transaction_date,
        DAYNAME(transaction_date) AS Day_name,
        CASE
            WHEN DAYNAME(transaction_date) IN ('Sat', 'Sun') THEN 'Weekend'
            ELSE 'Weekday'
        END AS Day_classification,
        MONTHNAME(transaction_date) AS Month_name,
        CASE 
            WHEN transaction_time BETWEEN '06:00:00' AND '11:59:00' THEN 'Morning'
            WHEN transaction_time BETWEEN '12:00:00' AND '16:59:00' THEN 'Afternoon'
            WHEN transaction_time >= '17:00:00' THEN 'Evening'
        END AS Time_bucket,
        HOUR(transaction_time) AS Hour_of_day,
        store_location,
        product_category,
        product_detail,
        product_type,
        unit_price,
        transaction_qty,
        COUNT (DISTINCT transaction_id) AS Number_of_Sales,
        SUM (transaction_qty*unit_price) AS Revenue
FROM
bright.coffee.bright_learn
GROUP BY ALL;
