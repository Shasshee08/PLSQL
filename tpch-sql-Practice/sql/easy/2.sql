--For each customer, list how many orders they have placed and their first and last order dates.

SELECT * FROM CUSTOMER;

SELECT * FROM ORDERS;

SELECT 
    C.C_CUSTKEY,
    C.C_NAME,
    COUNT(O.O_ORDERKEY) AS ORDER_COUNT,
    MIN(O.O_ORDERDATE) AS FIRST_ORDER_DATE,
    MAX(O.O_ORDERDATE) AS LAST_ORDER_DATE
FROM
    CUSTOMER C
JOIN
    ORDERS O ON C.C_CUSTKEY=O.O_CUSTKEY
GROUP BY
    C.C_CUSTKEY,C.C_NAME
    ORDER BY 
        ORDER_COUNT DESC;
        
