-- First, show each customer's tier
WITH CUSTOMER_TIERS AS (
    SELECT
        C.C_CUSTKEY,
        C.C_NAME,
        C.C_ACCTBAL,
        CASE
            WHEN C.C_ACCTBAL > 10000 THEN 'High'
            WHEN C.C_ACCTBAL BETWEEN 5000 AND 10000 THEN 'Medium'
            ELSE 'Low'
        END AS TIER
    FROM
        CUSTOMER C
)
-- Now, aggregate counts by tier
SELECT
    TIER,
    COUNT(*) AS TOTAL_CUSTOMERS,
    ROUND(AVG(C_ACCTBAL), 2) AS AVG_ACCTBAL
FROM
    CUSTOMER_TIERS
GROUP BY
    TIER
ORDER BY
    TOTAL_CUSTOMERS DESC;
