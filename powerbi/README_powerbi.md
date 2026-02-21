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
```

### 2️⃣ Revenue Before Discount

```DAX
Revenue Before Discount = SUM(ecommerce_sales_data[before_discount])
```

### 3️⃣ Total Units Sold
```DAX
Total Units = SUM(ecommerce_sales_data[qty_ordered])
```

### 4️⃣ Total Customers
```DAX
Total Customers = DISTINCTCOUNT(ecommerce_sales_data[customer_id])
```

### 5️⃣ Total Orders
```DAX
Total Orders = DISTINCTCOUNT(ecommerce_sales_data[id])
```

### 6️⃣ Net Profit
```DAX
Net Profit = SUMX(
    ecommerce_sales_data,
    ecommerce_sales_data[after_discount] -
    (ecommerce_sales_data[cogs] * ecommerce_sales_data[qty_ordered])
)
```

### 7️⃣ Average Order Value (AOV)
```DAX
AOV = DIVIDE(
    [Total Revenue],
    [Total Orders]
)
```


---

# 📊 Dashboard Structure

The dashboard is organized into structured analytical sections to support executive-level decision-making and detailed operational analysis.

---

## 🔹 1. Executive KPI Strip

**Top-Level Metrics Displayed:**
- Total Revenue  
- Revenue Before Discount  
- Total Units  
- Total Customers  
- Total Orders  
- Net Profit  
- AOV  
- Profit Margin %

**Purpose:**  
Provides immediate high-level performance visibility for decision-makers.

---

## 🔹 2. Revenue Trend Analysis

- Monthly Revenue Trend (2021–2022)  
- Year-over-Year (YoY) Performance Comparison  
- Peak and Anomaly Month Identification  

**Purpose:**  
Detect seasonality, revenue spikes, and volatility patterns.

---

## 🔹 3. Category Performance

- Revenue by Category  
- Unit Distribution by Category  
- Contribution Comparison  

**Purpose:**  
Identify dominant product categories and assess revenue concentration risks.

---

## 🔹 4. Brand Performance Analysis

**Focus Brands:**
- Samsung  
- Apple  
- Sony  
- Huawei  
- Lenovo  

**Visualizations:**
- Brand Revenue Comparison  
- Contribution to Total Revenue  
- AOV Comparison by Brand  

**Purpose:**  
Understand brand dependency, market positioning, and performance strength.

---

## 🔹 5. Payment Method Analysis

- Payment Method Distribution  
- Unique Order Count per Payment Type  
- COD vs Digital Payment Trends  

**Purpose:**  
Analyze transaction behavior and customer payment preference patterns.

---

## 🔹 6. Interactive Filter Panel

Users can dynamically filter by:

- Brand  
- SKU  
- Category  
- Payment Method  
- Order Date  
- Transaction Status  
- Customer ID  

**Purpose:**  
Enable exploratory, self-service analytics.

---

# 🎨 Design Philosophy

The dashboard follows a structured executive design approach:

- Clean executive layout  
- High-contrast KPI visibility  
- Logical grouping of visuals  
- Minimal visual clutter  
- Consistent color hierarchy  
- Business-focused interpretation  

The emphasis is on clarity and decision-making effectiveness rather than decorative visuals.

---

# 📈 Analytical Capabilities

This dashboard enables:

- Revenue anomaly detection  
- Year-over-year comparison  
- Profitability analysis  
- Customer concentration evaluation  
- Product dominance identification  
- Payment behavior insights  

---

# 📷 Dashboard Preview

See `dashboard_preview.png` inside this repository folder.

---

# 🎯 Business Impact

This Power BI layer transforms structured SQL analytics into a practical decision-support system by:

- Bridging raw data with executive reporting  
- Simplifying revenue and profitability monitoring  
- Supporting category and brand strategy refinement  
- Enhancing financial performance visibility  

This project demonstrates applied expertise in:

- Data modeling  
- DAX calculation logic  
- KPI system design  
- Business storytelling through analytics  

---

# 🚀 Why This Version Stands Out

- Complete DAX measure documentation  
- Clearly defined dashboard structure  
- Strong business interpretation  
- Clean logical hierarchy  
- Recruiter-friendly presentation  
- Focus on decision intelligence over decoration  

---
