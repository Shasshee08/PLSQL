----Create a procedure to fetch and display the salary of an employee given their EMPNO.

CREATE OR REPLACE PROCEDURE GET_EMP_SAL(
    EMP_ID IN NUMBER
    )
    IS
    EMP_SAL EMP_LARGE.SAL%TYPE;
    BEGIN
    SELECT SAL INTO EMP_SAL FROM EMP_LARGE WHERE EMPNO=EMP_ID;
    DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || EMP_SAL);
    END;
    
    --=============
    BEGIN
        GET_EMP_SAL(1235);
        END;
        
    