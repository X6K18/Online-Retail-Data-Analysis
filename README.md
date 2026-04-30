# Online Retail Data Analysis & Customer Segmentation

## Project Overview
This project analyzes transactional data from an online retail company to uncover customer purchasing behavior, sales trends, and business insights using Data Analysis, SQL, and Machine Learning techniques.

The project includes:

- Data Cleaning & Preprocessing
- Exploratory Data Analysis (EDA)
- SQL Business Analysis
- Customer Segmentation using RFM Analysis
- Data Visualization
- Feature Engineering
- Machine Learning Preparation

The goal of this project is to build a complete end-to-end retail analytics workflow suitable for a Data Analyst / Junior Data Scientist portfolio.

---

# Dataset

## Source
Online Retail Dataset from UCI Machine Learning Repository:

- Dataset: Online Retail
- Source: https://archive.ics.uci.edu/dataset/352/online+retail

## Dataset Description
The dataset contains transactional data for a UK-based online retail company between 2010 and 2011.

### Features

| Column | Description |
|---|---|
| InvoiceNo | Invoice number |
| StockCode | Product/item code |
| Description | Product description |
| Quantity | Quantity purchased |
| InvoiceDate | Date and time of transaction |
| UnitPrice | Product price per unit |
| CustomerID | Unique customer identifier |
| Country | Customer country |

---

# Project Structure

```bash
online-retail-analysis/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_exploratory_data_analysis.ipynb
│   ├── 03_rfm_customer_segmentation.ipynb
│   └── 04_machine_learning.ipynb
│
├── sql/
│   ├── 01_exploratory_analysis.sql
│   ├── 02_customer_segmentation_rfm.sql
│   └── 03_cohort_analysis.sql
│
├── models/
│   └── README.md
│
├── visualizations/
│
├── documents/
|-- dashboard /
│
├── requirements.txt
├── README.md
└── .gitignore
```

---

# Technologies Used

## Programming & Query Languages
- Python
- SQL

## Python Libraries
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn

## Tools
- Jupyter Notebook
- Visual Studio Code
- Git & GitHub
- SQL Server
- Power BI

---

# Data Cleaning Process

The following preprocessing steps were performed:

- Removed missing values
- Removed duplicate transactions
- Removed canceled orders
- Converted data types
- Filtered invalid quantities and prices
- Created new business features

## Feature Engineering

Additional features created:

| Feature | Description |
|---|---|
| Revenue | Quantity × UnitPrice |
| Year | Transaction year |
| Month | Transaction month |
| MonthName | Name of month |

---

# Exploratory Data Analysis (EDA)

EDA was performed to analyze:

- Sales distribution
- Top-selling products
- Revenue trends
- Customer purchasing behavior
- Country-based sales analysis
- Quantity distribution
- Monthly sales performance

## Visualizations
The project includes:

- Bar Charts
- Line Charts
- Scatter Plots
- Histograms
- Heatmaps
- Correlation Analysis

---

# SQL Analysis

SQL queries were used to perform business analysis and customer analytics.

## SQL Files

### 1. Exploratory Analysis
File: `01_exploratory_analysis.sql`

Analysis includes:
- Total revenue
- Monthly sales
- Top products
- Best customers
- Country performance

### 2. Customer Segmentation (RFM)
File: `02_customer_segmentation_rfm.sql`

RFM metrics:
- Recency
- Frequency
- Monetary

### 3. Cohort Analysis
File: `03_cohort_analysis.sql`

Analysis includes:
- Customer retention
- Repeat purchase behavior
- Cohort performance over time

---

# Customer Segmentation

RFM Analysis was used to segment customers based on purchasing behavior.

## RFM Metrics

| Metric | Description |
|---|---|
| Recency | Days since last purchase |
| Frequency | Number of purchases |
| Monetary | Total spending amount |

## Segmentation Goals

- Identify loyal customers
- Detect high-value customers
- Analyze inactive customers
- Improve marketing strategy

---

# Machine Learning Preparation

The project also includes preprocessing steps for future machine learning models.

## ML Workflow

- Feature scaling
- Data normalization
- Customer clustering preparation
- Data transformation
- Train/test preparation

Potential future models:
- K-Means Clustering
- Customer Lifetime Value Prediction
- Sales Forecasting
- Recommendation Systems

---

# Key Insights

Some important business insights discovered:

- A small percentage of customers generate most revenue
- Sales show seasonal purchasing behavior
- Several products dominate total sales
- Customer retention varies significantly across cohorts
- RFM analysis effectively identifies loyal and high-value customers

---

# How to Run the Project

## Clone Repository

```bash
git clone git@github.com:X6K18/Online-Retail-Data-Analysis.git
```

## Install Dependencies

```bash
pip install -r requirements.txt
```

## Open Jupyter Notebook

```bash
jupyter notebook
```

---

# Future Improvements

Future development ideas:

- Build recommendation systems
- Deploy dashboards with Power BI
- Create interactive Streamlit dashboard
- Apply advanced machine learning models
- Add real-time analytics pipeline

---

# Project Purpose

This project was built to:

- Practice real-world retail data analysis
- Improve SQL and Python skills
- Develop machine learning workflows
- Build a professional data analytics portfolio

---

# Author

Phan Trong Nguyen

## Contact
- GitHub: https://github.com/X6K18

