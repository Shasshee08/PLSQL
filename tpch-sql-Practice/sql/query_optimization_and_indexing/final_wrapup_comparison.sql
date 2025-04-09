-- Before Optimization: Full Table Scan
SELECT * FROM customer WHERE UPPER(c_name) = 'AUTOMOBILE COMPANY';

-- After Optimization: Using Function-Based Index
CREATE INDEX idx_upper_cname ON customer(UPPER(c_name));

SELECT * FROM customer WHERE UPPER(c_name) = 'AUTOMOBILE COMPANY';

-- Before: Full Table Scan on date
SELECT COUNT(*) FROM lineitem WHERE l_shipdate = DATE '1996-01-01';

-- After: Indexed Access
CREATE INDEX idx_lineitem_shipdate ON lineitem(l_shipdate);

SELECT COUNT(*) FROM lineitem WHERE l_shipdate = DATE '1996-01-01';
