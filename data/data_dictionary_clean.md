# Online Retail Dataset - Cleaned Data Overview

## Dataset Summary

After data cleaning and preprocessing, the dataset contains **392,732 transaction records** and **16 columns**.
The cleaned dataset is prepared for:

* Exploratory Data Analysis (EDA)
* Business Intelligence (BI)
* Customer Analytics
* Machine Learning applications

---

# Data Cleaning Process

The following preprocessing steps were applied:

* Removed duplicate records
* Removed missing values in `CustomerID`
* Removed canceled transactions
* Removed negative quantities (returns)
* Standardized datetime format
* Created revenue feature
* Extracted time-based features

---

# Dataset Structure

| Column      | Data Type      | Description                                      |
| ----------- | -------------- | ------------------------------------------------ |
| InvoiceNo   | object         | Unique invoice/transaction identifier            |
| StockCode   | object         | Unique product/item code                         |
| Description | object         | Product description or product name              |
| Quantity    | int64          | Number of units purchased                        |
| InvoiceDate | datetime64[us] | Date and time of the transaction                 |
| UnitPrice   | float64        | Price per product unit                           |
| CustomerID  | str            | Unique customer identifier                       |
| Country     | str            | Country where the customer is located            |
| Revenue     | float64        | Total transaction value (`Quantity × UnitPrice`) |
| Year        | int32          | Transaction year extracted from InvoiceDate      |
| Month       | int32          | Transaction month number                         |
| MonthName   | str            | Transaction month name                           |
| Day         | int32          | Day of the month                                 |
| Weekday     | str            | Day name of the transaction                      |
| Hour        | int32          | Transaction hour                                 |
| YearMonth   | datetime64[us] | Monthly time aggregation for trend analysis      |

---

# Feature Engineering

## Revenue Feature

A new business metric named `Revenue` was created:

```python
Revenue = Quantity * UnitPrice
```

This feature is essential for:

* Sales analysis
* Customer spending analysis
* Revenue trend analysis
* Product performance evaluation

---

# Time-Based Features

Additional temporal features were extracted from `InvoiceDate`:

* Year
* Month
* MonthName
* Day
* Weekday
* Hour
* YearMonth

These features support:

* Seasonal analysis
* Monthly sales trends
* Peak shopping hour analysis
* Weekly purchasing behavior

---

# Final Dataset Information

| Metric            | Value   |
| ----------------- | ------- |
| Total Rows        | 392,732 |
| Total Columns     | 16      |
| Missing Values    | 0       |
| Duplicate Records | 0       |

---

# Business Use Cases

This cleaned dataset can be used for:

## Exploratory Data Analysis (EDA)

* Sales trends
* Product popularity
* Country-level analysis
* Time-series analysis

## Business Intelligence (BI)

* Revenue dashboards
* KPI monitoring
* Sales performance tracking
* Customer insights

## Machine Learning

* Customer segmentation
* RFM analysis
* Sales forecasting
* Recommendation systems

---

# Notes

Retail datasets naturally contain large-value transactions and bulk purchases.
Potential outliers in `Quantity`, `UnitPrice`, and `Revenue` were retained during EDA because they may represent meaningful business behavior rather than data errors.
