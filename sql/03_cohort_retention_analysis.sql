USE OnlineRetailDB;

-- Question 1: What is the first purchase month (acquisition month) for each customer?
SELECT
    CustomerID,
    MIN(YearMonth) AS FirstPurchaseMonth
FROM OnlineRetail
GROUP BY CustomerID;

-- Question 2: How many new customers are acquired each month?
WITH FirstPurchase AS (
    SELECT
        CustomerID,
        MIN(YearMonth) AS FirstMonth
    FROM OnlineRetail
    GROUP BY CustomerID
)

SELECT
    FirstMonth,
    COUNT(CustomerID) AS NewCustomers
FROM FirstPurchase
GROUP BY FirstMonth
ORDER BY FirstMonth;

-- Question 3: Which cohort has the largest number of customers?
WITH FirstPurchase AS (
    SELECT
        CustomerID,
        MIN(YearMonth) AS CohortMonth
    FROM OnlineRetail
    GROUP BY CustomerID
)

SELECT TOP 1
    CohortMonth,
    COUNT(CustomerID) AS TotalCustomers
FROM FirstPurchase
GROUP BY CohortMonth
ORDER BY TotalCustomers DESC;

-- Question 4: How many customers return to make a purchase in the following month?
WITH Cohort AS (
    SELECT
        CustomerID,
        MIN(YearMonth) AS CohortMonth
    FROM OnlineRetail
    GROUP BY CustomerID
)

SELECT
    c.CohortMonth,
    COUNT(DISTINCT o.CustomerID) AS ReturningCustomers
FROM Cohort c
JOIN OnlineRetail o
    ON c.CustomerID = o.CustomerID
WHERE DATEDIFF(MONTH, c.CohortMonth, o.YearMonth) = 1
GROUP BY c.CohortMonth;

-- Question 5: What is the first-month retention rate?
WITH Cohort AS (
    SELECT
        CustomerID,
        MIN(YearMonth) AS CohortMonth
    FROM OnlineRetail
    GROUP BY CustomerID
),

Retention AS (
    SELECT
        c.CohortMonth,
        COUNT(DISTINCT c.CustomerID) AS CohortSize,
        COUNT(DISTINCT o.CustomerID) AS RetainedCustomers
    FROM Cohort c
    LEFT JOIN OnlineRetail o
        ON c.CustomerID = o.CustomerID
        AND DATEDIFF(MONTH, c.CohortMonth, o.YearMonth) = 1
    GROUP BY c.CohortMonth
)

SELECT
    CohortMonth,
    CohortSize,
    RetainedCustomers,
    ROUND(
        100.0 * RetainedCustomers / CohortSize,
        2
    ) AS RetentionRate
FROM Retention;

-- Question 6: How does the retention rate vary across different cohorts?
WITH Cohort AS (
    SELECT
        CustomerID,
        MIN(YearMonth) AS CohortMonth
    FROM OnlineRetail
    GROUP BY CustomerID
)

SELECT
    c.CohortMonth,

    DATEDIFF(
        MONTH,
        c.CohortMonth,
        o.YearMonth
    ) AS CohortIndex,

    COUNT(DISTINCT o.CustomerID) AS ActiveCustomers

FROM Cohort c
JOIN OnlineRetail o
    ON c.CustomerID = o.CustomerID

GROUP BY
    c.CohortMonth,
    DATEDIFF(MONTH, c.CohortMonth, o.YearMonth)

ORDER BY c.CohortMonth, CohortIndex;

-- Question 7: Which cohort has the best customer retention rate?
WITH Cohort AS (
    SELECT
        CustomerID,
        MIN(YearMonth) AS CohortMonth
    FROM OnlineRetail
    GROUP BY CustomerID
),

Retention AS (
    SELECT
        c.CohortMonth,
        COUNT(DISTINCT c.CustomerID) AS CohortSize,
        COUNT(DISTINCT o.CustomerID) AS RetainedCustomers
    FROM Cohort c
    LEFT JOIN OnlineRetail o
        ON c.CustomerID = o.CustomerID
        AND DATEDIFF(MONTH, c.CohortMonth, o.YearMonth) = 1
    GROUP BY c.CohortMonth
)

SELECT TOP 1
    CohortMonth,
    ROUND(
        100.0 * RetainedCustomers / CohortSize,
        2
    ) AS RetentionRate
FROM Retention
ORDER BY RetentionRate DESC;

-- Question 8: What percentage of customers continue to make purchases after 3 months?
WITH Cohort AS (
    SELECT
        CustomerID,
        MIN(YearMonth) AS CohortMonth
    FROM OnlineRetail
    GROUP BY CustomerID
),

Retention AS (
    SELECT
        c.CohortMonth,
        COUNT(DISTINCT c.CustomerID) AS CohortSize,
        COUNT(DISTINCT o.CustomerID) AS RetainedCustomers
    FROM Cohort c
    LEFT JOIN OnlineRetail o
        ON c.CustomerID = o.CustomerID
        AND DATEDIFF(MONTH, c.CohortMonth, o.YearMonth) = 3
    GROUP BY c.CohortMonth
)

SELECT
    CohortMonth,
    ROUND(
        100.0 * RetainedCustomers / CohortSize,
        2
    ) AS RetentionAfter3Months
FROM Retention;

-- Question 9: What is the customer churn trend over time?
WITH Cohort AS (
    SELECT
        CustomerID,
        MIN(YearMonth) AS CohortMonth
    FROM OnlineRetail
    GROUP BY CustomerID
),

Retention AS (
    SELECT
        c.CohortMonth,

        DATEDIFF(
            MONTH,
            c.CohortMonth,
            o.YearMonth
        ) AS CohortIndex,

        COUNT(DISTINCT o.CustomerID) AS ActiveCustomers

    FROM Cohort c
    JOIN OnlineRetail o
        ON c.CustomerID = o.CustomerID

    GROUP BY
        c.CohortMonth,
        DATEDIFF(MONTH, c.CohortMonth, o.YearMonth)
)

SELECT *
FROM Retention
ORDER BY CohortMonth, CohortIndex;

-- Question 10: What insights does the cohort retention matrix reveal about customer behavior?
WITH Cohort AS (
    SELECT
        CustomerID,
        MIN(YearMonth) AS CohortMonth
    FROM OnlineRetail
    GROUP BY CustomerID
),

CohortData AS (
    SELECT
        c.CustomerID,
        c.CohortMonth,

        DATEDIFF(
            MONTH,
            c.CohortMonth,
            o.YearMonth
        ) AS CohortIndex

    FROM Cohort c
    JOIN OnlineRetail o
        ON c.CustomerID = o.CustomerID
)

SELECT
    CohortMonth,
    CohortIndex,
    COUNT(DISTINCT CustomerID) AS ActiveCustomers
FROM CohortData
GROUP BY CohortMonth, CohortIndex
ORDER BY CohortMonth, CohortIndex;