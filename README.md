# 📊 E-Commerce Customer Intelligence System

An end-to-end data analytics project integrating **MySQL, Power BI, and Machine Learning (K-Means Clustering)** to transform raw e-commerce transactional data into business intelligence insights and customer segmentation strategies.

---

## 🚀 Project Overview

This project builds a complete analytics pipeline that moves from raw transactional data to strategic business recommendations.

The workflow:

Raw Data → SQL Modeling & Analysis → Power BI Dashboard → Customer Segmentation (ML) → Business Insights

The objective is to analyze revenue performance, category trends, payment behavior, brand dominance, and customer purchasing patterns across 2021–2022.

---

## 🛠 Tech Stack

- **Database:** MySQL  
- **Business Intelligence:** Power BI (DAX, Data Modeling)  
- **Programming:** Python (Pandas, Scikit-Learn)  
- **Machine Learning:** K-Means Clustering  
- **Data Processing:** Feature Engineering, StandardScaler  

---

## 🏗 System Architecture

1. Transactional tables created in MySQL  
2. Data cleaning and validation performed using SQL  
3. Analytical table (`ecommerce_sales_data`) built for reporting  
4. Power BI dashboard developed for executive insights  
5. Customer-level dataset engineered for ML  
6. K-Means clustering applied for segmentation  

This layered architecture ensures analytical consistency across reporting and modeling.

---

## 🗂 Dataset Description

The project uses four primary datasets:

### 1️⃣ customer_detail
- Customer ID  
- Registration date  

### 2️⃣ order_detail (Fact Table)
- Order ID  
- Customer ID  
- SKU ID  
- Order date  
- Quantity ordered  
- Pricing & discount information  
- Transaction validity flag  
- Payment ID  

### 3️⃣ sku_detail
- SKU name  
- Category  
- Base price  
- Cost of Goods Sold (COGS)  

### 4️⃣ payment_detail
- Payment method type  

An analytical table was created by joining these datasets to enable BI and ML workflows.

---

## 🧠 SQL Analytics Layer

Stakeholder-driven business questions were answered using structured SQL queries.

### Key Business Questions

- Which month recorded the highest revenue in 2021?
- Which category generated the highest transaction value in 2022?
- Year-over-year category comparison (2021 vs 2022)
- Top 5 payment methods in 2022
- Brand revenue ranking (Samsung, Apple, Sony, Huawei, Lenovo)

### SQL Techniques Used

- Common Table Expressions (CTEs)
- Aggregations (SUM, COUNT DISTINCT)
- CASE-based brand normalization
- Conditional filtering (`is_valid = 1`)
- Year-over-year comparison logic
- Ranking using ORDER BY + LIMIT

---

## 📊 Power BI Dashboard

### 🎯 Dashboard Objective

Provide an executive-level overview of:

- Revenue trends  
- Category performance  
- Brand contribution  
- Payment behavior  
- Customer distribution  

### 📌 KPI Strip

- Total Revenue (After Discount)
- Revenue Before Discount
- Total Units Sold
- Total Customers
- Net Profit
- Average Order Value (AOV)

### 📈 Analytical Views

- Category revenue over time (2021–2022)
- Payment method distribution
- Brand-level analysis
- Interactive filtering (Brand, SKU, Category, Status, Date, Customer)

---

## 📷 Dashboard Preview

*(Insert dashboard screenshot here)*

---

## 🤖 Machine Learning – Customer Segmentation

Customer-level feature engineering was performed to understand purchasing behavior.

### Features Engineered

- Registration-to-first-order delay
- Customer lifespan (first to last order)
- Total units purchased
- Total revenue contribution

### Preprocessing

- Removal of invalid transactions
- Separation of registration anomaly group
- StandardScaler normalization

### Model Applied

- K-Means Clustering (k = 3)

### Segments Identified

- Loyal High-Value Customers
- Extreme High Volume Buyers
- Normal Low Engagement Customers

---

## 📈 Key Insights

- Revenue growth is largely event-driven rather than retention-driven.
- Mobiles & Tablets dominate overall revenue contribution.
- Both digital payments and COD show strong usage.
- A small customer segment contributes disproportionately high revenue.
- Pre-registered customers show high upside but inconsistent engagement.

---

## 💼 Business Recommendations

1. Reduce reliance on anomaly-driven revenue spikes.
2. Improve pricing and cost efficiency to stabilize profit margins.
3. Implement segment-specific retention strategies.
4. Activate high-potential but low-engagement customers.
5. Leverage high-performing brands for bundles and upselling.

---

## 📁 Repository Structure


Leverage high-performing brands for bundle and upsell strategies.

Strengthen loyalty engagement programs to sustain revenue.
