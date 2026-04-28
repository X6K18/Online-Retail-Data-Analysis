# Online Retail Dataset  
(https://archive.ics.uci.edu/dataset/352/online+retail)

This document provides a detailed description of the variables contained in the online retail transaction dataset.

## Dataset Overview
The dataset contains information about cross-border transactions of an online retail company. Each row represents a specific product item within a particular invoice.

## Data Structure

| Variable | Role | Data Type | Description | Units | Missing Values |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **InvoiceNo** | ID | Categorical | A 6-digit number uniquely assigned to each transaction. If the code starts with the letter **'C'**, it indicates a canceled invoice. | - | No |
| **StockCode** | ID | Categorical | A 5-digit number uniquely assigned to each distinct product. | - | No |
| **Description** | Feature | Categorical | Product name or item description. | - | No |
| **Quantity** | Feature | Integer | The quantity of each product item in a transaction. | - | No |
| **InvoiceDate** | Feature | Date | The date and time when the transaction was generated. | - | No |
| **UnitPrice** | Feature | Continuous | Unit price of the product per item. | Sterling (GBP) | No |
| **CustomerID** | Feature | Categorical | A 5-digit number uniquely assigned to each customer. | - | No |
| **Country** | Feature | Categorical | The country where the customer resides. | - | No |

## Important Notes for Data Processing

1. **Canceled Invoices:**  
   The `InvoiceNo` column should be carefully checked. Values beginning with the prefix **'C'** represent canceled transactions and should be processed separately (commonly removed or offset during calculations).

2. **Quantity:**  
   For canceled invoices, the `Quantity` values are typically negative. This should be considered when calculating total revenue or sales metrics.

3. **UnitPrice:**  
   The official currency unit is **Sterling (GBP)**. For international market analysis, exchange rates may need to be considered if comparisons across regions are required.

4. **Missing Values:**  
   According to the dataset documentation, there are no missing values. However, in practical analysis, the `CustomerID` column should be examined carefully because guest customers may not have an assigned ID.

---

*This document was prepared to support data preprocessing and analysis tasks.*