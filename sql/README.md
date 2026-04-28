# 🛒 E-Commerce Data Analysis & Customer Segmentation (SQL)

## 📝 Project Overview
This project performs an end-to-end data analysis on an Online Retail dataset using SQL. The primary objective is to transform raw transactional data into actionable business intelligence by analyzing sales performance, understanding customer purchasing behavior, and evaluating long-term retention. 

**Tech Stack:** SQL (PostgreSQL/MySQL), Data Cleansing, Exploratory Data Analysis (EDA), Business Intelligence.

---


## Main Features

| Column | Description |
|---|---|
| InvoiceNo | Unique transaction ID |
| StockCode | Product code |
| Description | Product description |
| Quantity | Quantity purchased |
| InvoiceDate | Transaction date and time |
| UnitPrice | Product price |
| CustomerID | Unique customer ID |
| Country | Customer country |
| Revenue | Total revenue per row |
| Year | Transaction year |
| Month | Transaction month |
| MonthName | Month name |
| Day | Transaction day |
| Weekday | Day of week |
| Hour | Transaction hour |
| YearMonth | Monthly transaction period |

---

## 🎯 Business Problems Addressed
This project answers critical business questions across three main analytical phases:

### Phase 1: Exploratory Data Analysis (EDA) & Sales Performance
**File:** `01_exploratory_analysis.sql`
* Extracted fundamental business metrics including total revenue, transaction volume, and unique customer counts.
* Analyzed time-series revenue trends to identify seasonal fluctuations and peak purchasing hours.
* Identified top-performing products and high-value geographical markets (countries) to guide inventory and marketing strategies.

### Phase 2: Customer Segmentation (RFM Model)
**File:** `02_customer_segmentation_rfm.sql`
* Implemented the **Recency, Frequency, Monetary (RFM)** framework entirely in SQL.
* Calculated individual customer scores based on their last purchase date, transaction frequency, and total lifetime value.
* Segmented the customer base into actionable tiers (e.g., "Loyal Customers", "At-Risk", "High-Spenders") to enable targeted retention campaigns.

### Phase 3: Cohort & Retention Analysis
**File:** `03_cohort_retention_analysis.sql`
* Grouped customers into cohorts based on their acquisition month.
* Built a **Cohort Retention Matrix** using complex SQL joins and aggregations to track the percentage of returning customers over time.
* Evaluated customer churn trends and first-month retention rates to assess the long-term health of the business.

---

## 📊 Dataset Information
The dataset contains transactional data from a UK-based online retail company.
* **Source:** UCI Machine Learning Repository
* **Key Features:** `InvoiceNo`, `StockCode`, `Quantity`, `InvoiceDate`, `UnitPrice`, `CustomerID`, `Country`.
* *Note: Data was pre-processed to handle missing CustomerIDs, filter out canceled orders (negative quantities), and standardize date/time formats.*

---

## 🚀 How to Run
1. Clone this repository.
2. Import the raw dataset into your SQL database environment.
3. Execute the scripts in numerical order (`01` -> `02` -> `03`) to reproduce the analysis.