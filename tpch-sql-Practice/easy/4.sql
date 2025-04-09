---Find total revenue from all lineitems grouped by region.
SELECT * FROM lineitem

SELECT * FROM orders

SELECT * FROM customer

SELECT * FROM nation

SELECT * FROM region

---=============
SELECT 
    R.R_NAME AS REGION_NAME,
    SUM(l.l_extendedprice * (1 - l.l_discount)) AS TOTAL_REVENUE
FROM
    LINEITEM L
JOIN
    ORDERS O ON L.L_ORDERKEY=O.O_ORDERKEY
JOIN
    CUSTOMER C ON O.O_ORDERKEY=C.C_CUSTKEY
JOIN
    NATION N ON C.C_NATIONKEY=N.N_NATIONKEY
JOIN 
    REGION R ON N.N_REGIONKEY=R.R_REGIONKEY
GROUP BY
    R.R_NAME
ORDER BY
    TOTAL_REVENUE DESC;
    

