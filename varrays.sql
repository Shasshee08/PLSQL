DECLARE
    TYPE EMP_TABLE IS TABLE OF VARCHAR2(50);
    EMP_NAMES EMP_TABLE:=EMP_TABLE();
    BEGIN
    EMP_NAMES.EXTEND(3);
    EMP_NAMES(1):='JOHN';
    EMP_NAMES(2):='SHASHI';
    EMP_NAMES(3):='KIRAN';
    DBMS_OUTPUT.PUT_LINE('FIRST EMPLOYEE NAME: '||EMP_NAMES(1));
    END;
    /
    
    ---============
    
    DECLARE
    TYPE EMP_TABLE IS TABLE OF VARCHAR2(50);
    EMP_NAMES EMP_TABLE:=EMP_TABLE();
    BEGIN
    EMP_NAMES.EXTEND(3);
    EMP_NAMES(1):='JOHN';
    EMP_NAMES(2):='SHASHI';
    EMP_NAMES(3):='KIRAN';
    FOR I IN 1..EMP_NAMES.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE('FIRST EMPLOYEE NAME: '||EMP_NAMES(I));
    END LOOP;
    END;
    /
    
    ---===================
    DECLARE
        TYPE EMP_TABLE IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
        EMP_SALARIES EMP_TABLE;
        BEGIN
        EMP_SALARIES(1001):=5000;
        EMP_SALARIES(1002):=5500;
        IF  EMP_SALARIES.EXISTS(1002) THEN
        DBMS_OUTPUT.PUT_LINE('Salary of Employee 1002: ' || emp_salaries(1002));
    END IF;
END;
/

-====================
    CREATE TYPE NAME_TABLE IS TABLE OF VARCHAR2(20);
    /
    
    CREATE TABLE EMPLOYEE(
    EMPNO NUMBER PRIMARY KEY,
    EMP_NAMES NAME_TABLE
    )NESTED TABLE EMP_NAMES STORE AS EMP_NAMES_TABLE;
    /
    
    
    INSERT INTO EMPLOYEE VALUES(1,NAME_TABLE('JOHN','SASHI','KIRAN'));
    
    SELECT * FROM EMPLOYEE;
    
----==================

    DECLARE
    TYPE emp_id_table IS TABLE OF NUMBER;
    TYPE salary_table IS TABLE OF NUMBER;

    emp_ids emp_id_table := emp_id_table(101, 102, 103);
    emp_salaries salary_table := salary_table(50000, 60000, 70000);
BEGIN
    FOR i IN 1..emp_ids.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || emp_ids(i) || 
                             ' Salary: ' || emp_salaries(i));
    END LOOP;
END;
/
