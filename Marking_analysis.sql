-- Remove duplicates based on all columns
DELETE FROM marketing_data
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM marketing_data
    GROUP BY customer_id, age, income, marital_status, spending_score
);

-- Check for missing values
SELECT 
    COUNT(*) AS missing_age, 
    COUNT(*) AS missing_income, 
    COUNT(*) AS missing_spending_score
FROM marketing_data
WHERE age IS NULL OR income IS NULL OR spending_score IS NULL;

-- Replace missing income with the average income
UPDATE marketing_data
SET income = (SELECT AVG(income) FROM marketing_data)
WHERE income IS NULL;

-- Replace missing spending_score with the median score
UPDATE marketing_data
SET spending_score = (
    SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY spending_score)
    FROM marketing_data
)
WHERE spending_score IS NULL;

-- Find the age distribution
SELECT 
    age, 
    COUNT(*) AS customer_count
FROM marketing_data
GROUP BY age
ORDER BY customer_count DESC;

-- Analyze spending score by marital status
SELECT 
    marital_status,
    AVG(spending_score) AS avg_spending_score,
    COUNT(*) AS total_customers
FROM marketing_data
GROUP BY marital_status
ORDER BY avg_spending_score DESC;

-- Identify the top income brackets
SELECT 
    FLOOR(income / 10000) * 10000 AS income_bracket,
    COUNT(*) AS customer_count
FROM marketing_data
GROUP BY income_bracket
ORDER BY customer_count DESC;

-- Identify the most popular products
SELECT 
    product_category, 
    COUNT(*) AS purchases
FROM marketing_data
GROUP BY product_category
ORDER BY purchases DESC;

-- Find customers with high income and spending scores
SELECT 
    customer_id,
    age,
    income,
    spending_score
FROM marketing_data
WHERE income > (SELECT AVG(income) FROM marketing_data) 
  AND spending_score > (SELECT AVG(spending_score) FROM marketing_data)
ORDER BY spending_score DESC;

-- Target segments with high spending scores and moderate incomes
SELECT 
    marital_status, 
    FLOOR(income / 10000) * 10000 AS income_bracket,
    AVG(spending_score) AS avg_spending_score,
    COUNT(*) AS customer_count
FROM marketing_data
WHERE income BETWEEN 30000 AND 60000
GROUP BY marital_status, income_bracket
ORDER BY avg_spending_score DESC, customer_count DESC;