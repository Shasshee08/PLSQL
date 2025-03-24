WITH DEPT_AVG_SAL AS(
    SELECT DEPTNO,AVG(SAL) AS AVG_SAL 
    FROM EMP_LARGE
    GROUP BY DEPTNO
    )
    SELECT d.*, S.AVG_SAL
FROM DEPT_LARGE D
JOIN DEPT_AVG_SAL S ON D.DEPTNO=S.DEPTNO
WHERE S.AVG_SAL>5000;


SELECT * FROM GET_EMP_SAL;

SET SERVEROUTPUT ON;
======================================================
DECLARE 
    V_SAL NUMBER;  -- Declare variable to store output
BEGIN
    GET_EMP_SAL(V_SAL);  -- Call the procedure
    DBMS_OUTPUT.PUT_LINE('Final Salary: ' || V_SAL);
END;
/

=======================
BEGIN
    GET_EMP_DETAILS(100);
    END;
    
--    =================
 DECLARE
    V_SALARY NUMBER;
BEGIN   
    V_SALARY:=GET_SAL(1001);
    DBMS_OUTPUT.PUT_LINE('SALARY : '|| V_SALARY);
END;
/

select * from emp_large;
==================
SELECT GET_SAL(1001) FROM DUAL;

SELECT GET_ENAME(1001) FROM DUAL;

SELECT GET_JOB(1001) FROM DUAL;

SELECT HIGH_PAID(20) FROM DUAL;

SELECT EMP_COUNT(30) FROM DUAL;