# 📘 TPC-H Query Optimization & Indexing in Oracle SQL

This repository showcases practical indexing and query optimization techniques using the TPC-H benchmark schema on Oracle SQL. It includes real-world performance tuning examples using `EXPLAIN PLAN`, `AUTOTRACE`, index types, and Oracle features like virtual columns and invisible indexes.


---

## ✅ Covered Scenarios

### 1. SQL Trace, TKPROF, and AUTOTRACE
Trace execution with `EXPLAIN PLAN`, `DBMS_XPLAN`, and `AUTOTRACE` to identify access paths and costs.
📄 trace_explain_plan_autotrace.sql`

---

### 2. Basic Indexing on Orders
Test performance differences by creating a basic index on `o_orderdate` and comparing query behavior.
📄 `indexing_basics_orders.sql`

---

### 3. Index vs No Index Comparison
Use `EXPLAIN PLAN` to show optimizer behavior when indexes are present vs absent.
📄 `index_vs_no_index_analysis.sql`

---

### 4. Bitmap vs B-tree Index
Compare performance of bitmap and b-tree indexes on a low-cardinality column (`c_mktsegment`).
📄 `bitmap_vs_btree_index.sql`

---

### 5. Function-Based Index
Improve performance on case-insensitive queries using `UPPER(c_name)` with a function-based index.
📄 `function_based_index.sql`

---

### 6. Invisible Index
Create an invisible index to test optimization without affecting other queries in the system.
📄 `invisible_index_test.sql`

---

### 7. Virtual Column with Index
Create a virtual column on `orders.o_orderdate` and index it for filtering on extracted year.
📄 `virtual_column_index.sql`

---

### 8. Composite Index (Join + Filter)
Use a composite index on `o_orderstatus, o_orderdate` to optimize multi-column filtering with grouping.
📄 `composite_index_join_filter.sql`

---

### 9. Detect and Fix Full Table Scans
Use `AUTOTRACE` to find full table scans and create the right indexes to fix them.
📄 `detect_full_table_scan_autotrace.sql`

---

### 🔚 10. Final Wrap-Up (Before vs After Optimization)

```sql
-- Without Index
SELECT * FROM customer WHERE UPPER(c_name) = 'AUTOMOBILE COMPANY';

-- With Function-Based Index
CREATE INDEX idx_upper_cname ON customer(UPPER(c_name));
SELECT * FROM customer WHERE UPPER(c_name) = 'AUTOMOBILE COMPANY';

-- Without Index
SELECT COUNT(*) FROM lineitem WHERE l_shipdate = DATE '1996-01-01';

-- With Index
CREATE INDEX idx_lineitem_shipdate ON lineitem(l_shipdate);
SELECT COUNT(*) FROM lineitem WHERE l_shipdate = DATE '1996-01-01';
