/*
=============================================================
Layer: Data Modeling Layer (Transactional Schema)
=============================================================

Script Name:
    01_database_setup.sql

Script Purpose:
    This script initializes the database and creates the
    foundational transactional schema for the
    E-Commerce Customer Intelligence System.

    It defines the core fact and dimension tables required
    for downstream analytics, business intelligence,
    and machine learning workflows.

Tables Created:
    - customer_detail (Dimension)
    - payment_detail (Dimension)
    - sku_detail (Dimension)
    - order_detail (Fact)

Data Architecture:
    Raw Data (CSV)
        → MySQL Transactional Tables
            → Analytical Table (Denormalized Layer)
                → Power BI
                → Machine Learning

Design Considerations:
    - VARCHAR used for ID fields (supports alphanumeric values)
    - DECIMAL used for financial fields (precision-safe)
    - Foreign keys enforce referential integrity
=============================================================
*/

-- =========================================================
-- DATABASE INITIALIZATION
-- =========================================================

CREATE DATABASE IF NOT EXISTS db_e_commerce;
USE db_e_commerce;


-- =========================================================
-- DIMENSION TABLES
-- =========================================================

-- Customer Dimension
CREATE TABLE IF NOT EXISTS customer_detail (
    id VARCHAR(50) PRIMARY KEY,
    registered_date DATE
);

-- Payment Dimension
CREATE TABLE IF NOT EXISTS payment_detail (
    id VARCHAR(50) PRIMARY KEY,
    payment_method VARCHAR(100)
);

-- SKU / Product Dimension
CREATE TABLE IF NOT EXISTS sku_detail (
    id VARCHAR(50) PRIMARY KEY,
    sku_name VARCHAR(255),
    base_price DECIMAL(10,2),
    cogs DECIMAL(10,2),
    category VARCHAR(100)
);


-- =========================================================
-- FACT TABLE
-- =========================================================

CREATE TABLE IF NOT EXISTS order_detail (
    id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_date DATE,
    sku_id VARCHAR(50),
    price DECIMAL(10,2),
    qty_ordered INT,
    before_discount DECIMAL(10,2),
    discount_amount DECIMAL(10,2),
    after_discount DECIMAL(10,2),
    is_gross BOOLEAN,
    is_valid BOOLEAN,
    is_net BOOLEAN,
    payment_id VARCHAR(50),

    FOREIGN KEY (customer_id) REFERENCES customer_detail(id),
    FOREIGN KEY (sku_id) REFERENCES sku_detail(id),
    FOREIGN KEY (payment_id) REFERENCES payment_detail(id)
);

-- =========================================================
-- END OF SCRIPT
-- =========================================================
