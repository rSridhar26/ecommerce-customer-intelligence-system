/*
=============================================================
Layer: Data Validation & Quality Checks
=============================================================

Script Name:
    02_data_validation.sql

Script Purpose:
    This script performs data quality validation on all
    transactional and dimension tables.

    Validation Includes:
        - NULL value checks
        - Duplicate row checks

Objective:
    Ensure dataset integrity before analytical processing,
    dashboard development, and machine learning workflows.

=============================================================
*/


-- =========================================================
-- NULL VALUE CHECKS
-- =========================================================


-- 1️⃣ Order Detail Table

SELECT 
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_null,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_null,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS order_date_null,
    SUM(CASE WHEN sku_id IS NULL THEN 1 ELSE 0 END) AS sku_id_null,
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS price_null,
    SUM(CASE WHEN qty_ordered IS NULL THEN 1 ELSE 0 END) AS qty_ordered_null,
    SUM(CASE WHEN before_discount IS NULL THEN 1 ELSE 0 END) AS before_discount_null,
    SUM(CASE WHEN discount_amount IS NULL THEN 1 ELSE 0 END) AS discount_amount_null,
    SUM(CASE WHEN after_discount IS NULL THEN 1 ELSE 0 END) AS after_discount_null,
    SUM(CASE WHEN is_gross IS NULL THEN 1 ELSE 0 END) AS is_gross_null,
    SUM(CASE WHEN is_valid IS NULL THEN 1 ELSE 0 END) AS is_valid_null,
    SUM(CASE WHEN is_net IS NULL THEN 1 ELSE 0 END) AS is_net_null,
    SUM(CASE WHEN payment_id IS NULL THEN 1 ELSE 0 END) AS payment_id_null
FROM order_detail;



-- 2️⃣ Customer Detail Table

SELECT 
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_null,
    SUM(CASE WHEN registered_date IS NULL THEN 1 ELSE 0 END) AS registered_date_null
FROM customer_detail;



-- 3️⃣ Payment Detail Table

SELECT 
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_null,
    SUM(CASE WHEN payment_method IS NULL THEN 1 ELSE 0 END) AS payment_method_null
FROM payment_detail;



-- 4️⃣ SKU Detail Table

SELECT 
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_null,
    SUM(CASE WHEN sku_name IS NULL THEN 1 ELSE 0 END) AS sku_name_null,
    SUM(CASE WHEN base_price IS NULL THEN 1 ELSE 0 END) AS base_price_null,
    SUM(CASE WHEN cogs IS NULL THEN 1 ELSE 0 END) AS cogs_null,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS category_null
FROM sku_detail;



-- =========================================================
-- DUPLICATE ROW CHECKS
-- =========================================================


-- 1️⃣ Order Detail Duplicates

SELECT 
    id,
    customer_id,
    order_date,
    sku_id,
    price,
    qty_ordered,
    before_discount,
    discount_amount,
    after_discount,
    is_gross,
    is_valid,
    is_net,
    payment_id,
    COUNT(*) AS duplicate_count
FROM order_detail
GROUP BY 
    id,
    customer_id,
    order_date,
    sku_id,
    price,
    qty_ordered,
    before_discount,
    discount_amount,
    after_discount,
    is_gross,
    is_valid,
    is_net,
    payment_id
HAVING COUNT(*) > 1;



-- 2️⃣ Customer Detail Duplicates

SELECT 
    id,
    registered_date,
    COUNT(*) AS duplicate_count
FROM customer_detail
GROUP BY 
    id,
    registered_date
HAVING COUNT(*) > 1;



-- 3️⃣ Payment Detail Duplicates

SELECT 
    id,
    payment_method,
    COUNT(*) AS duplicate_count
FROM payment_detail
GROUP BY 
    id,
    payment_method
HAVING COUNT(*) > 1;



-- 4️⃣ SKU Detail Duplicates

SELECT 
    id,
    sku_name,
    base_price,
    cogs,
    category,
    COUNT(*) AS duplicate_count
FROM sku_detail
GROUP BY 
    id,
    sku_name,
    base_price,
    cogs,
    category
HAVING COUNT(*) > 1;



-- =========================================================
-- END OF SCRIPT
-- =========================================================
