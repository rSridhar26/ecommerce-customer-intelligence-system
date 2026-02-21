/*
=============================================================
Layer: Analytical Data Preparation (Denormalized Layer)
=============================================================

Script Name:
    04_create_analytical_table.sql

Script Purpose:
    This script creates a denormalized analytical table
    (ecommerce_sales_data) by joining transactional
    fact and dimension tables.

    The resulting dataset is used for:
        - Power BI Dashboard Reporting
        - Machine Learning Feature Engineering

Data Flow:
    Transactional Tables
        → Joined Analytical Table
            → BI & ML Consumption

Design Rationale:
    Denormalization simplifies downstream analysis by
    reducing repeated joins in reporting tools.

=============================================================
*/


-- =========================================================
-- DROP EXISTING ANALYTICAL TABLE (IF EXISTS)
-- =========================================================

DROP TABLE IF EXISTS ecommerce_sales_data;


-- =========================================================
-- CREATE DENORMALIZED ANALYTICAL TABLE
-- =========================================================

CREATE TABLE ecommerce_sales_data AS
SELECT 
    od.id,
    od.customer_id,
    od.order_date,
    od.price,
    sd.cogs,
    pd.payment_method,
    sd.sku_name,
    sd.category,
    od.qty_ordered,
    od.before_discount,
    od.discount_amount,
    od.after_discount,
    od.is_gross,
    od.is_valid,
    od.is_net,
    CASE
        WHEN LOWER(sd.sku_name) LIKE '%samsung%' THEN 'Samsung'
        WHEN LOWER(sd.sku_name) LIKE '%apple%' 
             OR LOWER(sd.sku_name) LIKE '%iphone%' 
             OR LOWER(sd.sku_name) LIKE '%macbook%' THEN 'Apple'
        WHEN LOWER(sd.sku_name) LIKE '%sony%' THEN 'Sony'
        WHEN LOWER(sd.sku_name) LIKE '%huawei%' THEN 'Huawei'
        WHEN LOWER(sd.sku_name) LIKE '%lenovo%' THEN 'Lenovo'
        ELSE 'Others'
    END AS brand
FROM order_detail od
LEFT JOIN payment_detail pd
    ON od.payment_id = pd.id
LEFT JOIN sku_detail sd
    ON od.sku_id = sd.id;


-- =========================================================
-- DATA CONSISTENCY CHECK
-- =========================================================

-- Ensure analytical table row count matches fact table

SELECT COUNT(*) AS analytical_table_rows
FROM ecommerce_sales_data;

SELECT COUNT(*) AS fact_table_rows
FROM order_detail;


-- =========================================================
-- END OF SCRIPT
-- =========================================================
