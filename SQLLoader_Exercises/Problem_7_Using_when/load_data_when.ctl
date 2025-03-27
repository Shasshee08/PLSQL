LOAD DATA
INFILE 'employees_when.csv'
INTO TABLE EMP_WHEN
WHEN SALARY = '4500'  -- WHEN should be here, and quotes should be used for CHAR fields
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
    EMPNO      INTEGER EXTERNAL,
    FIRST_NAME CHAR,
    LAST_NAME  CHAR,
    SALARY     CHAR(10)  -- Change SALARY to CHAR if it's in CSV as text
)
