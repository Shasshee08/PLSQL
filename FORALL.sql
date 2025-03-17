DECLARE
    TYPE EMP_TABLE IS TABLE OF EMP_LARGE.EMPNO%TYPE;
    EMP_DATA EMP_TABLE;
    BEGIN
    SELECT EMPNO BULK COLLECT INTO EMP_DATA FROM EMP_LARGE;
    
    FORALL I IN EMP_DATA.FIRST .. EMP_DATA.LAST
    UPDATE EMP_LARGE 
    SET SAL=SAL*1.10 
    WHERE EMPNO=EMP_DATA(I);
    
    DBMS_OUTPUT.PUT_LINE('SALARIES UPDATED SUCCESSFULLY');
    END;
    
    ---=====================
    DECLARE
     TYPE emp_table_type IS TABLE OF EMP_LARGE%ROWTYPE;
    emp_data emp_table_type;

BEGIN
    -- Collect all employee records into collection
    SELECT * BULK COLLECT INTO emp_data FROM EMP_LARGE;

    -- Insert all records into employees_backup using FORALL
    FORALL i IN emp_data.FIRST .. emp_data.LAST
        INSERT INTO employees_backup VALUES emp_data(i);

    DBMS_OUTPUT.PUT_LINE('Employees copied to backup table successfully.');
END;
    

SELECT * FROM employees_backup;