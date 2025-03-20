---Create a procedure to count the number of employees in a specific department.

CREATE OR REPLACE PROCEDURE EMP_COUNT_BY_DEPT(
    P_DEPTNO IN EMP_LARGE.DEPTNO%TYPE,
    P_COUNT OUT NUMBER
)
IS
    BEGIN
        SELECT COUNT(*) INTO P_COUNT FROM EMP_LARGE WHERE EMPNO=P_DEPTNO;
        END;
        
        
        --=============
   DECLARE
    P_COUNT NUMBER;
    BEGIN
        EMP_COUNT_BY_DEPT(11,P_COUNT);
        DBMS_OUTPUT.PUT_LINE('TOTAL EMPLOYEES: '|| P_COUNT);
        END;