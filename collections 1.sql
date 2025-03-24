DECLARE
    TYPE EMP_SAL_TABLE IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    EMP_SAL EMP_SAL_TABLE;
    BEGIN
    EMP_SAL(101) :=5000;
    EMP_SAL(102) :=5500;
    EMP_SAL(103) :=5600;
    DBMS_OUTPUT.PUT_LINE('SALARY OF EMPLOYEE 102: ' ||EMP_SAL(103));
    END;
    /
    
    ---=====================
    
    DECLARE
        TYPE EMP_SAL_TABLE IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
        EMP_SAL EMP_SAL_TABLE;
        EMP_ID PLS_INTEGER;
    BEGIN
        EMP_SAL(101) :=5000;
        EMP_SAL(102) :=4000;
        EMP_SAL(103) :=4200;
        EMP_ID:=EMP_SAL.FIRST;
        WHILE EMP_ID IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_id || 
                             ' New Salary with Bonus: ' || (EMP_SAL(emp_id) * 1.10));
        emp_id := EMP_SAL.NEXT(emp_id);
    END LOOP;
END;
/

----==================

        DECLARE
            TYPE EMP_TABLE IS TABLE OF NUMBER INDEX BY VARCHAR2(50);
            EMP_SAL EMP_TABLE;
        BEGIN
                EMP_SAL('JOHN'):=5500;
                EMP_SAL('JACK'):=5600;
        DBMS_OUTPUT.PUT_LINE('JACK SALARY: '||EMP_SAL('JACK'));
        END;
        /