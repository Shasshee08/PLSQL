LOAD DATA
INFILE 'C:\tpch-dbgen\customer.tbl'
INTO TABLE customer
FIELDS TERMINATED BY '|' TRAILING NULLCOLS
(
    c_custkey,
    c_name,
    c_address,
    c_nationkey,
    c_phone,
    c_acctbal,
    c_mktsegment,
    c_comment
)
