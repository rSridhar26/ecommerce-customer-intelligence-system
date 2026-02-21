# 🤖 Customer Segmentation – Machine Learning Layer

## 📌 Objective

The goal of this module is to segment customers based on purchasing behavior using K-Means clustering.

The segmentation enables:

- Identification of high-value customers
- Detection of low-engagement customers
- Recognition of high-volume purchasing patterns
- Targeted marketing strategy design

---

## 🗂 Data Source

The input dataset (`customer_segmentation_data`) was engineered in MySQL using aggregated transactional data.

Features were calculated at the customer level using only valid transactions (`is_valid = 1`).

The dataset was then imported into Python (Jupyter Notebook) for machine learning processing.

---

## 🧠 Features Engineered

Each customer record contains:

- **register_to_order** → Days between registration and first purchase  
- **first_to_last_order** → Customer lifespan in days  
- **total_unit** → Total quantity purchased  
- **total_spent** → Total revenue contribution  

These features represent behavioral and monetary characteristics.

---

## ⚙️ Data Preprocessing

### 1️⃣ Data Import

- MySQL connection established using `mysql-connector`
- Data loaded into pandas DataFrame

### 2️⃣ Data Cleaning

- Customers with negative onboarding delay were identified (registration anomaly)
- Dataset split into:
  - Normal customers
  - Pre-registration anomaly group

### 3️⃣ Feature Scaling

StandardScaler was applied to normalize:

- Mean = 0
- Standard deviation = 1

Scaling prevents high-magnitude features (e.g., total_spent) from dominating clustering.

---

## 🤖 Clustering Model

Algorithm Used: **K-Means Clustering**

Parameters:

- n_clusters = 3
- random_state = 42

Separate clustering was applied to:

- Normal customers
- Pre-registration group

---

## 🎯 Customer Segments Identified

### 1️⃣ Loyal High-Value Customers
- High total_spent
- Longer lifespan
- Consistent engagement

### 2️⃣ Extreme High Volume Buyers
- High quantity purchases
- Potential bulk or event-driven buying behavior

### 3️⃣ Normal Low Engagement Customers
- Low units
- Short lifespan
- Low revenue contribution

---

## 📊 Visualization

Scatter plots were generated using:

- X-axis → total_spent
- Y-axis → total_unit
- Hue → customer segment

This visually demonstrates behavioral separation between clusters.

---

## 📁 Output

The final segmented dataset was exported as: ecommerce-customer-intelligence-system/data/processed_data/customer_segmentation_output.xlsx


This file can be used for:

- CRM targeting
- Marketing automation
- Business strategy planning
- Further predictive modeling

---

## 🛠 Libraries Used

- pandas
- numpy
- matplotlib
- seaborn
- scikit-learn
- mysql-connector

---

## 🎯 Business Impact

This segmentation transforms descriptive analytics into predictive customer strategy.

It enables:

- Personalized engagement
- High-value customer retention
- Campaign optimization
- Revenue concentration risk management

---

## 📌 Conclusion

The machine learning layer completes the analytics lifecycle by translating SQL-driven business metrics into behavioral customer intelligence.

It demonstrates:

- Feature engineering from transactional data
- Statistical normalization
- Clustering model implementation
- Business interpretation of ML results

