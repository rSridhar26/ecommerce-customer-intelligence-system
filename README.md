📊 E-Commerce Customer Intelligence System
📌 Project Overview

This project builds a complete end-to-end analytics pipeline to transform raw e-commerce transactional data into business intelligence insights and customer segmentation strategies.

The system integrates:

MySQL for data modeling and SQL analytics

Power BI for interactive business dashboards

Python (Scikit-Learn) for customer segmentation using K-Means

The objective is to move beyond descriptive reporting and enable data-driven strategic decision-making.

🏗 System Architecture

Raw Transaction Tables
→ SQL Cleaning & Aggregation
→ Analytical Table Creation
→ Power BI Dashboard
→ Customer-Level Feature Engineering
→ K-Means Clustering
→ Business Recommendations

This layered approach ensures analytical consistency across reporting and modeling.

🗂 Dataset Description

The system uses four core datasets:

1️⃣ customer_detail

Contains customer registration information.

2️⃣ order_detail

Fact table containing transactional records including pricing, discount, quantity, and payment references.

3️⃣ sku_detail

Product-level metadata including category, cost of goods sold (COGS), and SKU naming.

4️⃣ payment_detail

Mapping table for payment method types.

An analytical table (ecommerce_sales_data) was created by joining these tables to produce a denormalized dataset for BI and ML workflows.

🧠 SQL Analytics Layer

Stakeholder-driven business questions were answered using structured SQL queries.

Business Questions Addressed:

Which month recorded the highest revenue in 2021?

Which category generated the highest transaction value in 2022?

Year-over-year category comparison (2021 vs 2022)

Top 5 payment methods (2022)

Brand revenue ranking (Samsung, Apple, Huawei, Lenovo, Sony)

SQL Techniques Used:

CTEs for year comparison

CASE statements for brand normalization

Aggregation (SUM, COUNT DISTINCT)

Valid transaction filtering (is_valid = 1)

Grouped revenue segmentation

Ranking using ORDER BY + LIMIT

📊 Power BI – Executive Dashboard
Dashboard Objectives

The dashboard provides a high-level executive overview of:

Revenue trends

Category contribution

Brand performance

Payment behavior

Customer distribution

Key KPIs

Total Revenue (After Discount)

Revenue Before Discount

Total Units Sold

Total Customers

Net Profit

Average Order Value (AOV)

Analytical Views

Category revenue over time (2021–2022)

Payment distribution patterns

Brand-level transaction comparison

Interactive filter panel

Dashboard Preview

(Insert screenshot here)

🤖 Machine Learning – Customer Segmentation

Customer-level feature engineering was performed to understand purchasing behavior.

Features Engineered:

Registration-to-first-order delay

Customer lifespan (first to last order)

Total units purchased

Total revenue contribution

Preprocessing:

Removal of invalid transactions

Separation of registration anomaly group

StandardScaler normalization

Model Used:

K-Means Clustering (k=3)

Segments Identified:

Loyal High-Value Customers

Extreme High Volume Buyers

Normal Low Engagement Customers

📈 Key Insights

Revenue growth is event-driven rather than retention-driven.

Mobiles & Tablets dominate revenue contribution.

Digital payment adoption is strong alongside COD usage.

A small cluster contributes a disproportionate share of revenue.

Pre-registered customers show high potential but inconsistent engagement.

💼 Business Recommendations

Reduce dependency on anomaly-driven revenue spikes.

Improve pricing and cost structure to stabilize profit margins.

Implement segment-specific retention strategies.

Leverage high-performing brands for bundle and upsell strategies.

Strengthen loyalty engagement programs to sustain revenue.
