--Windows Functions Implementation
--Ranking Functions
--Use case: Top customers by revenue
--Row_number
SELECT 
    transaction_id,
    customer_id,
    product_id,
    amount,
    ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_num
FROM transactions
ORDER BY amount DESC;

--Windows Functions Implementation
--Ranking Functions
--Rank()
SELECT 
    transaction_id,
    customer_id,
    product_id,
    amount,
    RANK() OVER (ORDER BY amount DESC) AS rank_position
FROM transactions
ORDER BY amount DESC;
--If two transactions have the same amount, they share the same rank, but the next rank number is skipped.

--Dense Rank()
SELECT 
    transaction_id,
    customer_id,
    product_id,
    amount,
    DENSE_RANK() OVER (ORDER BY amount DESC) AS dense_rank_position
FROM transactions
ORDER BY amount DESC;

--Percent Rank()
SELECT 
    transaction_id,
    customer_id,
    product_id,
    amount,
    PERCENT_RANK() OVER (ORDER BY amount DESC) AS percent_rank_position
FROM transactions
ORDER BY amount DESC;
--Percent Rank shows each transaction's relative position where 0 is top and 1 is bottom.

--Aggregate
--Use case: running totals and trends
--SUM running Total
WITH monthly AS (
    SELECT 
        DATE_TRUNC('month', sale_date) AS month_start,
        SUM(amount) AS monthly_sales
    FROM transactions
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT 
    TO_CHAR(month_start, 'YYYY-MM') AS month,
    monthly_sales,
    
    -- ROWS: running total by row position
    SUM(monthly_sales) OVER (
        ORDER BY month_start
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_rows,
    
    -- RANGE: running total by calendar months
    SUM(monthly_sales) OVER (
        ORDER BY month_start
        RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_range

FROM monthly
ORDER BY month_start;

--AVG moving average
WITH monthly AS (
    SELECT 
        DATE_TRUNC('month', sale_date) AS month_start,
        SUM(amount) AS monthly_sales
    FROM transactions
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT 
    TO_CHAR(month_start, 'YYYY-MM') AS month,
    monthly_sales,
    
    -- ROWS: 3-month moving average by row count
    AVG(monthly_sales) OVER (
        ORDER BY month_start
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_rows,
    
    -- RANGE: 3-month moving average by actual calendar interval
    AVG(monthly_sales) OVER (
        ORDER BY month_start
        RANGE BETWEEN INTERVAL '2 month' PRECEDING AND CURRENT ROW
    ) AS moving_avg_range

FROM monthly
ORDER BY month_start;

--MIN
WITH monthly AS (
    SELECT 
        DATE_TRUNC('month', sale_date) AS month_start,
        SUM(amount) AS monthly_sales
    FROM transactions
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT 
    TO_CHAR(month_start, 'YYYY-MM') AS month,
    monthly_sales,
    
    -- ROWS: min across last 3 rows
    MIN(monthly_sales) OVER (
        ORDER BY month_start
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS min_sales_rows,
    
    -- RANGE: min across last 2 calendar months + current
    MIN(monthly_sales) OVER (
        ORDER BY month_start
        RANGE BETWEEN INTERVAL '2 month' PRECEDING AND CURRENT ROW
    ) AS min_sales_range

FROM monthly
ORDER BY month_start;

--MAX
WITH monthly AS (
    SELECT 
        DATE_TRUNC('month', sale_date) AS month_start,
        SUM(amount) AS monthly_sales
    FROM transactions
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT 
    TO_CHAR(month_start, 'YYYY-MM') AS month,
    monthly_sales,
    
    -- ROWS: max across last 3 rows
    MAX(monthly_sales) OVER (
        ORDER BY month_start
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS max_sales_rows,
    
    -- RANGE: max across last 2 calendar months + current
    MAX(monthly_sales) OVER (
        ORDER BY month_start
        RANGE BETWEEN INTERVAL '2 month' PRECEDING AND CURRENT ROW
    ) AS max_sales_range

FROM monthly
ORDER BY month_start;

--Navigation Functions
--Period-to-Period Analysis
--LAG
--Compares to Previous Period
WITH monthly AS (
    SELECT 
        DATE_TRUNC('month', sale_date) AS month_start,
        SUM(amount) AS monthly_sales
    FROM transactions
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT 
    TO_CHAR(month_start, 'YYYY-MM') AS month,
    monthly_sales,
    LAG(monthly_sales) OVER (ORDER BY month_start) AS prev_month,
    ROUND(
        (monthly_sales - LAG(monthly_sales) OVER (ORDER BY month_start)) 
        / NULLIF(LAG(monthly_sales) OVER (ORDER BY month_start), 0) * 100,
        2
    ) AS growth_percent
FROM monthly
ORDER BY month_start;

--LEAD
--Compares to next period
WITH monthly AS (
    SELECT 
        DATE_TRUNC('month', sale_date) AS month_start,
        SUM(amount) AS monthly_sales
    FROM transactions
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT 
    TO_CHAR(month_start, 'YYYY-MM') AS month,
    monthly_sales,
    LEAD(monthly_sales) OVER (ORDER BY month_start) AS next_month,
    ROUND(
        (LEAD(monthly_sales) OVER (ORDER BY month_start) - monthly_sales) 
        / NULLIF(monthly_sales, 0) * 100,
        2
    ) AS growth_to_next_percent
FROM monthly
ORDER BY month_start;

--DISTRIBUTION FUNCTIONS
--USE CASE: CUSTOMER SEGMENTATION
--NTILE(4)
--Used to divide customers into quartiles where quartile 1 is the highest spender and quartile 4 is lowest spender
SELECT 
    c.customer_id,
    c.c_name,
    c.region,
    SUM(t.amount) AS total_spent,
    NTILE(4) OVER (ORDER BY SUM(t.amount) DESC) AS spending_quartile
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.c_name, c.region
ORDER BY total_spent DESC;

--CUME_DIST()
--For percentile ranking
--CUME_DIST() gives a cumulative distribution between 0 and 1
SELECT 
    c.customer_id,
    c.c_name,
    c.region,
    SUM(t.amount) AS total_spent,
    ROUND(CUME_DIST() OVER (ORDER BY SUM(t.amount) DESC)::numeric, 2) AS percentile_rank
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.c_name, c.region
ORDER BY total_spent DESC;






