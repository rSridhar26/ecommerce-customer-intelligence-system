/*
=============================================================
Layer: SQL Analytics Layer
=============================================================

Script Name:
    03_stakeholder_analysis.sql

Script Purpose:
    This script answers key stakeholder-driven business
    questions using structured SQL analysis.

    Focus Areas:
        - Revenue trends
        - Category performance
        - Year-over-year comparison
        - Payment behavior
        - Brand performance

Business Rule:
    Only valid transactions (is_valid = 1) are included
    to ensure financial accuracy.

Output:
    Aggregated results to support executive-level insights.

=============================================================
*/


-- =========================================================
-- Q1: Highest Revenue Month in 2021
-- =========================================================

SELECT 
    MONTH(order_date) AS order_month,
    SUM(after_discount) AS total_transaction
FROM order_detail
WHERE YEAR(order_date) = 2021
  AND is_valid = 1
GROUP BY order_month
ORDER BY total_transaction DESC;



-- =========================================================
-- Q2: Highest Revenue Category in 2022
-- =========================================================

SELECT 
    sd.category,
    SUM(od.after_discount) AS total_transaction
FROM order_detail AS od
LEFT JOIN sku_detail AS sd
    ON od.sku_id = sd.id
WHERE YEAR(od.order_date) = 2022
  AND od.is_valid = 1
GROUP BY sd.category
ORDER BY total_transaction DESC;



-- =========================================================
-- Q3: Year-over-Year Category Comparison (2021 vs 2022)
-- =========================================================

WITH transaction_2021 AS (
    SELECT 
        sd.category,
        SUM(od.after_discount) AS total_transaction_2021
    FROM order_detail AS od
    LEFT JOIN sku_detail AS sd
        ON od.sku_id = sd.id
    WHERE YEAR(od.order_date) = 2021
      AND od.is_valid = 1
    GROUP BY sd.category
),
transaction_2022 AS (
    SELECT 
        sd.category,
        SUM(od.after_discount) AS total_transaction_2022
    FROM order_detail AS od
    LEFT JOIN sku_detail AS sd
        ON od.sku_id = sd.id
    WHERE YEAR(od.order_date) = 2022
      AND od.is_valid = 1
    GROUP BY sd.category
)

SELECT 
    t1.category,
    t1.total_transaction_2021,
    t2.total_transaction_2022,
    (t2.total_transaction_2022 - t1.total_transaction_2021) AS difference_value,
    CASE 
        WHEN (t2.total_transaction_2022 - t1.total_transaction_2021) > 0 
            THEN 'Increased'
        ELSE 'Decreased'
    END AS growth_status
FROM transaction_2021 t1
LEFT JOIN transaction_2022 t2
    ON t1.category = t2.category;



-- =========================================================
-- Q4: Top 5 Payment Methods in 2022 (Unique Orders)
-- =========================================================

SELECT 
    pd.payment_method,
    COUNT(DISTINCT od.id) AS total_unique_orders
FROM order_detail AS od
LEFT JOIN payment_detail AS pd
    ON od.payment_id = pd.id
WHERE od.is_valid = 1
  AND YEAR(od.order_date) = 2022
GROUP BY pd.payment_method
ORDER BY total_unique_orders DESC
LIMIT 5;



-- =========================================================
-- Q5: Brand Revenue Ranking
-- =========================================================

WITH product_sales AS (
    SELECT 
        CASE 
            WHEN LOWER(sd.sku_name) LIKE '%samsung%' THEN 'Samsung'
            WHEN LOWER(sd.sku_name) LIKE '%apple%' 
                 OR LOWER(sd.sku_name) LIKE '%iphone%' 
                 OR LOWER(sd.sku_name) LIKE '%macbook%' THEN 'Apple'
            WHEN LOWER(sd.sku_name) LIKE '%sony%' THEN 'Sony'
            WHEN LOWER(sd.sku_name) LIKE '%huawei%' THEN 'Huawei'
            WHEN LOWER(sd.sku_name) LIKE '%lenovo%' THEN 'Lenovo'
            ELSE 'Others'
        END AS brand_name,
        SUM(od.after_discount) AS transaction_value
    FROM order_detail AS od
    LEFT JOIN sku_detail AS sd
        ON od.sku_id = sd.id
    WHERE od.is_valid = 1
    GROUP BY brand_name
)

SELECT *
FROM product_sales
WHERE brand_name <> 'Others'
ORDER BY transaction_value DESC;


-- =========================================================
-- END OF SCRIPT
-- =========================================================
