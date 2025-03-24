DECLARE
    CURSOR CURSOR_NAME IS SELECT_STATEMENT;
    BEGIN
        OPEN CURSOR_NAME;
        FETCH CURSOR_NAME INTO VARIALBLE_LIST;
        CLOSE CURSOR_NAME;
    END;
    /
    --======================
    DECLARE
        CURSOR EMP_CUR IS
        SELECT ENAME,SAL  FROM EMP WHERE DEPTNO=10;
        V_ENAME EMP.ENAME%TYPE;
        V_SAL EMP.SAL%TYPE;
        BEGIN
            OPEN EMP_CUR;
            LOOP
            FETCH EMP_CUR INTO V_ENAME,V_SAL;
            EXIT WHEN EMP_CUR%NOTFOUND ;
          DBMS_OUTPUT.PUT_LINE('Fetched Row: ' || emp_cur%ROWCOUNT || 
                             ' | Name: ' || v_Ename || 
                             ' | Salary: ' || v_sal);
            END LOOP;
            CLOSE EMP_CUR;
            END;
            /
            
             ---Cursor FOR LOOP
             BEGIN
             FOR EMP_REC IN
             (SELECT ENAME,SAL FROM EMP WHERE DEPTNO=10)
             LOOP
             DBMS_OUTPUT.PUT_LINE('ROWS FETCHED: ' ||SQL%ROWCOUNT);
             DBMS_OUTPUT.PUT_LINE('EMPLOYEE: '||EMP_REC.ENAME|| ', SALARY: ' || EMP_REC.SAL);
             END LOOP;
             END;
             /
             
             --===============
             -----------Passing Parameters to a Cursor
             DECLARE
             CURSOR EMP_CURSOR(V_DEPTNO NUMBER) IS
             SELECT ENAME,SAL FROM EMP WHERE DEPTNO=V_DEPTNO;
             V_ENAME EMP.ENAME%TYPE;
             V_SAL EMP.SAL%TYPE;
             BEGIN
             OPEN EMP_CURSOR(10);
             LOOP
             FETCH EMP_CURSOR INTO V_ENAME,V_SAL;
             EXIT WHEN EMP_CURSOR%NOTFOUND;
              DBMS_OUTPUT.PUT_LINE('Employee: ' || v_Ename || ' | Salary: ' || v_sal);
    END LOOP;
    CLOSE EMP_CURSOR;
    END;
    /