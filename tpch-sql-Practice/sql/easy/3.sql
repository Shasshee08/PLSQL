--Find customers who haven’t placed any orders.

SELECT 
    c.c_custkey,
    c.c_name,
    n.n_name AS nation_name,
    r.r_name AS region_name
FROM 
    customer c
LEFT JOIN 
    orders o ON c.c_custkey = o.o_custkey
JOIN 
    nation n ON c.c_nationkey = n.n_nationkey
JOIN 
    region r ON n.n_regionkey = r.r_regionkey
WHERE 
    o.o_orderkey IS NULL
ORDER BY 
    c.c_custkey
FETCH FIRST 10 ROWS ONLY;
