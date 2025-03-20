CREATE OR REPLACE PROCEDURE GET_EMPLOYEE_DETAILS(
    EMP_ID IN NUMBER
)IS
    EMP_ENAME VARCHAR2(10);
    EMP_SAL NUMBER;
BEGIN
    SELECT ENAME,SAL INTO EMP_ENAME,EMP_SAL FROM 
    EMP_LARGE WHERE EMPNO=EMP_ID;
    
     DBMS_OUTPUT.PUT_LINE('Employee Name: ' || EMP_ENAME);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || EMP_SAL);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee Not Found!');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

--===========
BEGIN
    GET_EMPLOYEE_DETAILS(1218446464);
    END;