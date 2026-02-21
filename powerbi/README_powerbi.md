# 📊 Power BI Dashboard – E-Commerce Customer Intelligence

## 📌 Purpose of This Dashboard

This Power BI dashboard transforms structured SQL analysis into an interactive executive-level reporting tool.

It provides decision-makers with:

- Revenue performance tracking
- Category and brand contribution analysis
- Payment method behavior insights
- Customer distribution overview
- KPI-driven business monitoring

The dashboard is built on a denormalized analytical table (`ecommerce_sales_data`) created in MySQL.

---

## 🏗 Data Source & Modeling

### Primary Data Source

- MySQL Analytical Table: `ecommerce_sales_data`

This table was created by joining:

- `order_detail` (Fact)
- `customer_detail` (Dimension)
- `sku_detail` (Dimension)
- `payment_detail` (Dimension)

The denormalized structure improves performance and reduces transformation complexity inside Power BI.

---

## 🧠 Data Model Design

The Power BI model follows a simplified single-fact architecture:

- `ecommerce_sales_data` acts as the primary reporting table.
- Time-based filtering is handled using `order_date`.
- All slicing and grouping (brand, category, payment method) are directly derived from the analytical table.

This approach ensures:

- Simpler model structure
- Faster dashboard performance
- Reduced DAX complexity

---

## 📈 Key DAX Measures

### 1️⃣ Total Revenue

```DAX
Total Revenue = SUM(ecommerce_sales_data[after_discount])
