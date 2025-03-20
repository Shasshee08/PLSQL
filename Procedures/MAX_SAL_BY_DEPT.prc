----Create a procedure to return the maximum salary in a given department.

CREATE OR REPLACE PROCEDURE MAX_SAL_BY_DEPT(
    P_DEPTNO IN EMP_LARGE.DEPTNO%TYPE,
    P_MAXSAL OUT EMP_LARGE.SAL%TYPE
)
IS
    BEGIN
    SELECT MAX(SAL) INTO P_MAXSAL FROM EMP_LARGE WHERE DEPTNO=P_DEPTNO;
    END;
    
    
   --======
   DECLARE
   V_MAXSAL NUMBER;
   BEGIN
        MAX_SAL_BY_DEPT(20,V_MAXSAL);
         DBMS_OUTPUT.PUT_LINE('Max Salary in Department: ' || V_MAXSAL);
END;