---List all customers from 'GERMANY', along with their phone number and account balance.
SELECT * FROM CUSTOMER;

SELECT * FROM NATION;

--=========

SELECT
    C.C_CUSTKEY,
    C.C_NAME,
    C.C_PHONE,
    C.C_ACCTBAL
FROM 
    CUSTOMER C
JOIN 
    NATION N ON C.C_NATIONKEY=N.N_NATIONKEY
WHERE
    N.N_NAME='GERMANY'
ORDER BY
    C.C_CUSTKEY;