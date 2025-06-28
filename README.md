# telco-churn-analysis-dashboard
Churn Analysis using Telco Dataset with SQL, Google Sheets &amp; Looker Studio

This project explores and analyzes customer churn behavior using a publicly available **Telco Customer Churn** dataset. The goal is to identify factors that influence churn and visualize actionable insights using **SQL**, **Excel**, and **Looker Studio**.

---

##  Objectives

- Clean and preprocess the dataset using **PostgreSQL** and **Google Sheets**
- Perform churn rate analysis across various dimensions (contract type, internet service, tenure)
- Visualize insights with interactive dashboards and visual tools
- Practice end-to-end analysis using real-world data for business storytelling

---

##  Project Structure

├── dashboard/ # Final dashboard PDFs and reports

├── data/ # Processed CSV exports for visualizations

├── excel/ # Excel (Google Sheet) file used for cleaning and pivot creation

├── screenshots/ # Dashboard and chart snapshots

├── sql/ # SQL scripts used for cleaning and transformation

├── README.md # This file


---

##  Tools Used

| Tool | Purpose |
|------|---------|
| **Google Sheets** | Cleaning, pivot tables, churn flags, and grouping |
| **PostgreSQL (pgAdmin)** | Validation, transformation, feature engineering |
| **Looker Studio** | Dashboards, heatmaps, pie charts, bubble chart |
| **GitHub** | Version control and showcasing work |

---

## Key Insights

- **Month-to-month customers** account for 55% of the customer base but contribute to nearly **89% of the churn**.
- **Fiber optic internet users** on short-term contracts have the highest churn rate (~55%).
- Customers in the **0–12 months** tenure group show the highest churn.
- Longer contracts (1 or 2 years) significantly reduce churn.

---

## Dashboard Preview

![Heatmap + Pie Charts + Bubble Chart](screenshots/full_dashboard.png)

*See the `/dashboard` folder or PDF file for a complete view.*

---

## SQL Scripts

Find the full SQL workflow in [`/sql/cleaning_script.sql`](sql/cleaning_script.sql), including:
- Missing value detection
- Churn flagging
- Tenure grouping
- Churn rate aggregation

---

## Data Sources

- Original dataset: [`WA_Fn-UseC_-Telco-Customer-Churn.csv`](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)

---

## How to Use This Repo

1. Clone the repo or download as ZIP
2. Load the Excel file (`excel/telco_churn.xlsx`) to review sheet-based cleaning
3. Explore the CSVs inside `/data` for grouped churn rates
4. Run SQL scripts from `/sql` in PostgreSQL
5. View insights and visuals from `/dashboard` or `/screenshots`

---

## Author

**Mohammad Ali Memon**  
🔗 [GitHub](https://github.com/Alimemon04)  
💼 Business & Data Analyst | SQL • Excel • Looker Studio  
📍 Raipur, India

---

## License

This project is for educational and portfolio use only. Dataset credit to [IBM Sample Data on Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn).
