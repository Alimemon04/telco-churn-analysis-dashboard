# SQL Scripts for Telco Churn Analysis

This folder contains all SQL queries used during the data cleaning, transformation, and preliminary analysis stages of the **Telco Customer Churn** project.

## 📁 File: `cleaning_script.sql`

This SQL script performs the following operations:

### 🔍 Data Exploration & Validation
- Identifies the missing values in the key columns (`tenure`, `MonthlyCharges`, `TotalCharges`)
- Inspects rows with missing or blank `TotalCharges`

### 🧹 Data Cleaning
- Replaces the missing `TotalCharges` values with `0` if `tenure` is 0
- Casts `TotalCharges` from text to numeric for calculations

### 🛠️ Feature Engineering
- Adds `new_customer` column to flag customers with zero tenure and charges
- Adds `churn_flag` column (1 for "Yes", 0 for "No")
- Adds `tenure_group` column with grouped buckets:
  - `0–12 months`
  - `13–24 months`
  - `25–48 months`
  - `49+ months`

### 📊 Exploratory Queries
- Churn Rate by `Contract`
- Churn Rate by `InternetService` and `Contract` (for heatmap)
- Churn Rate by `tenure_group` (used for bubble chart)

## 🧪 How to Use
1. Run the script in a PostgreSQL environment where the `telco_churn` table is already created and populated.
2. Use the output tables and transformed columns to build dashboards in Looker Studio or generate `.csv` reports for visualization.

## 📝 Notes
- The dataset was originally cleaned and verified using Google Sheets alongside PostgreSQL for validation.
- Visualizations created from these queries are available in the `/dashboard` and `/screenshots` folders.
