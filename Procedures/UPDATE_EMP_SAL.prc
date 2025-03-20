----Create a procedure to update an employee’s salary using EMPNO and a new salary value.

CREATE OR REPLACE PROCEDURE UPDATE_EMP_SAL(
   P_EMPNO IN EMP_LARGE.EMPNO%TYPE,
   P_NEW_SAL IN EMP.SAL%TYPE
)IS
BEGIN
    UPDATE EMP_LARGE SET SAL =P_NEW_SAL WHERE EMPNO=P_EMPNO;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Salary Updated Successfully');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee Not Found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;


---===============
BEGIN
    UPDATE_EMP_SAL(1234,5000);
    END;
    
    SELECT * FROM EMP_LARGE WHERE EMPNO=1234;