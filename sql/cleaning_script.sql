-- Step 1: Checking for missing values in the key columns using simple count
SELECT 
  COUNT(*) FILTER (WHERE tenure IS NULL OR tenure = '') AS missing_tenure,
  COUNT(*) FILTER (WHERE MonthlyCharges IS NULL OR MonthlyCharges = '') AS missing_monthly,
  COUNT(*) FILTER (WHERE TotalCharges IS NULL OR TotalCharges = '') AS missing_total
FROM telco_churn;

-- Step 2: Cast the TotalCharges from text to numeric after trimming
-- If needed, first inspect invalid data
SELECT * 
FROM telco_churn
WHERE TRIM(TotalCharges) = '' OR TotalCharges IS NULL;

-- Step 3: Updating invalid TotalCharges where it has null values to 0 where tenure is 0
UPDATE telco_churn
SET TotalCharges = '0'
WHERE (TotalCharges IS NULL OR TRIM(TotalCharges) = '') AND tenure = 0;

-- Step 4: Adding a new column to flag new customers based on the logic that the TotalCharges and tenure would be 0 for new customers 
ALTER TABLE telco_churn
ADD COLUMN new_customer BOOLEAN;

UPDATE telco_churn
SET new_customer = 
    CASE 
        WHEN (TotalCharges = 0 AND tenure = 0) THEN TRUE
        ELSE FALSE
    END;

-- Step 5: Adding a churn_flag column (1 for Yes, 0 for No)
ALTER TABLE telco_churn
ADD COLUMN churn_flag INTEGER;

UPDATE telco_churn
SET churn_flag = 
    CASE 
        WHEN Churn = 'Yes' THEN 1
        ELSE 0
    END;

-- Step 6: Creating a tenure group column
ALTER TABLE telco_churn
ADD COLUMN tenure_group TEXT;

UPDATE telco_churn
SET tenure_group = 
    CASE 
        WHEN tenure <= 12 THEN '0–12 months'
        WHEN tenure <= 24 THEN '13–24 months'
        WHEN tenure <= 48 THEN '25–48 months'
        ELSE '49+ months'
    END;

-- Step 7: Previewing Churn Rate by Contract Type
SELECT 
  Contract,
  COUNT(customerID) AS total_customers,
  SUM(churn_flag) AS total_churned,
  ROUND(SUM(churn_flag)::numeric / COUNT(customerID), 4) AS churn_rate
FROM telco_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

-- Step 8: Churning Rate by InternetService and Contract (for heatmap)
SELECT 
  InternetService,
  Contract,
  COUNT(customerID) AS total_customers,
  SUM(churn_flag) AS total_churned,
  ROUND(SUM(churn_flag)::numeric / COUNT(customerID), 4) AS churn_rate
FROM telco_churn
GROUP BY InternetService, Contract
ORDER BY churn_rate DESC;

-- Step 9: Churning Rate by Tenure Group
SELECT 
  tenure_group,
  COUNT(customerID) AS total_customers,
  SUM(churn_flag) AS total_churned,
  ROUND(SUM(churn_flag)::numeric / COUNT(customerID), 4) AS churn_rate
FROM telco_churn
GROUP BY tenure_group
ORDER BY churn_rate DESC;

