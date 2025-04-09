---Find all orders placed in the year 1995, along with customer name and order total.
SELECT * FROM ORDERS;

SELECT * FROM CUSTOMER;

SELECT * FROM LINEITEM;

--===
SELECT
    O.O_ORDERKEY,
    C.C_NAME,
    O.O_ORDERDATE,
    SUM(l.l_extendedprice * (1 - l.l_discount)) AS order_total
FROM 
    ORDERS O
JOIN
    CUSTOMER C ON O.O_CUSTKEY=C.C_CUSTKEY
JOIN
    lineitem l ON o.o_orderkey = l.l_orderkey
WHERE
    EXTRACT(YEAR FROM o.o_orderdate) = 1995
GROUP BY
    o.o_orderkey, c.c_name, o.o_orderdate
ORDER BY
    order_total DESC
FETCH FIRST 10 ROWS ONLY;