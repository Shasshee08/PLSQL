LOAD DATA
INFILE 'C:\tpch-dbgen\orders.tbl'
INTO TABLE ORDERS
FIELDS TERMINATED BY '|'
(
  O_ORDERKEY,
  O_CUSTKEY,
  O_ORDERSTATUS,
  O_TOTALPRICE,
  O_ORDERDATE DATE "YYYY-MM-DD",
  O_ORDERPRIORITY,
  O_CLERK,
  O_SHIPPRIORITY,
  O_COMMENT
)
