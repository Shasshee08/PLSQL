----Create a procedure to delete an employee based on their EMPNO.
    
CREATE OR REPLACE PROCEDURE DELETE_EMP(
    P_EMPNO IN EMP_LARGE.EMPNO%TYPE
)IS
    BEGIN
    DELETE FROM EMP_LARGE WHERE EMPNO=P_EMPNO;
    COMMIT;
     DBMS_OUTPUT.PUT_LINE('Employee Deleted Successfully');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee Not Found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

--========
BEGIN
    DELETE_EMP(105);
    END;