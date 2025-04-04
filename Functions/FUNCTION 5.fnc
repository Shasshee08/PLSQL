---Function to Fetch Department Name

CREATE OR REPLACE FUNCTION GET_DEPT_NAME(F_EMPNO NUMBER)
RETURN  VARCHAR2
IS
    DEPT_NAME VARCHAR2(20);
BEGIN
    SELECT DNAME INTO DEPT_NAME FROM DEPT_LARGE 
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP_LARGE WHERE EMPNO=F_EMPNO);
    RETURN DEPT_NAME;
    END;
    
    SELECT GET_DEPT_NAME(1234) FROM DUAL;