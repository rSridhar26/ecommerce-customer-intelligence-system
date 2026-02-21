/*
=============================================================
Layer: Feature Engineering for Machine Learning
=============================================================

Script Name:
    05_customer_segmentation_features.sql

Script Purpose:
    This script creates a customer-level aggregated dataset
    for segmentation analysis using K-Means clustering.

Features Engineered:
    - register_to_order (Onboarding delay)
    - first_to_last_order (Customer lifespan)
    - total_unit (Total quantity purchased)
    - total_spent (Total revenue contribution)

Business Rule:
    - Only valid transactions (is_valid = 1) are included.
    - Aggregation performed at customer level.

Output:
    customer_segmentation_data
    → Used for Machine Learning in Python.

=============================================================
*/


-- =========================================================
-- DROP EXISTING TABLE (IF EXISTS)
-- =========================================================

DROP TABLE IF EXISTS customer_segmentation_data;


-- =========================================================
-- CREATE CUSTOMER-LEVEL SEGMENTATION DATASET
-- =========================================================

CREATE TABLE customer_segmentation_data AS
WITH selected_data AS (
    SELECT 
        esd.customer_id,
        cd.registered_date,
        esd.order_date,
        esd.qty_ordered,
        esd.after_discount
    FROM ecommerce_sales_data esd
    LEFT JOIN customer_detail cd
        ON esd.customer_id = cd.id
    WHERE esd.is_valid = 1
)

SELECT 
    customer_id,
    DATEDIFF(MIN(order_date), MIN(registered_date)) AS register_to_order,
    DATEDIFF(MAX(order_date), MIN(order_date)) AS first_to_last_order,
    SUM(qty_ordered) AS total_unit,
    SUM(after_discount) AS total_spent
FROM selected_data
GROUP BY customer_id;


-- =========================================================
-- VALIDATION CHECKS
-- =========================================================

-- Total Customers Generated

SELECT COUNT(*) AS total_customers
FROM customer_segmentation_data;


-- Identify Registration Anomalies (Negative Onboarding Delay)

SELECT *
FROM customer_segmentation_data
WHERE register_to_order < 0;


-- =========================================================
-- END OF SCRIPT
-- =========================================================
