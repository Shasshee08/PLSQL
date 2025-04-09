---Detecting Full Table Scans with AUTOTRACE

SET AUTOTRACE ON EXPLAIN

SELECT COUNT(*) FROM lineitem 
WHERE l_shipdate = DATE '1996-01-01';

--================

EXPLAIN PLAN FOR 
SELECT COUNT(*) FROM lineitem 
WHERE l_shipdate = DATE '1996-01-01';

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);