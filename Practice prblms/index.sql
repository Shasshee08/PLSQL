SELECT * FROM EMP;

                                INDEXES 
--                              =======
CREATE INDEX IDX_EMP ON EMP(ENAME,SAL);

EXPLAIN PLAN FOR
SELECT ENAME,SAL FROM EMP;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

CREATE INDEX IDX_ENAME ON EMP(LOWER(ENAME));

SELECT LOWER(ENAME) FROM EMP;

SELECT INDEX_NAME FROM USER_INDEXES;


--Create a composite index on emp_name and dept_id in the EMP table.
--Test: Run a query to retrieve employees based on dept_id.
    CREATE INDEX IDX_NAME_ID ON EMP(ENAME,DEPTNO);
    
    EXPLAIN PLAN FOR
    SELECT * FROM EMP WHERE DEPTNO=20 AND ENAME='SMITH' ;
    
    SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
    
   SELECT index_name, blevel FROM DBA_INDEXES WHERE table_name = 'EMP';
   
   drop index idx_name_id;
   
   select index_name from dba_indexes where table_name='emp';
   
   desc dba_indexes;
   
   desc user_indexes;
   
--    Create a B-Tree index on the salary column and check if it's being used.
    CREATE INDEX IDX_SAL1 ON EMP(SAL);
    
    EXPLAIN PLAN FOR
    SELECT * FROM EMP WHERE SAL>2000;
    
    SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

SELECT /*+ INDEX(EMP IDX_SAL1) */ * FROM EMP WHERE sal > 2000;

    CREATE INDEX IDX_EMP_ENAME ON EMP(ENAME);

    SELECT INDEX_NAME FROM USER_INDEXES WHERE TABLE_NAME='EMP';
    ---------------------------------------------------------------------------
                               Sequences
What is a Sequence?
	A Sequence in Oracle SQL is a database object that generates unique numbers in order. 
    It is primarily used for auto-generating primary key values in tables.
    
    CREATE SEQUENCE SEQ_EMPNO
    START WITH 1001
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
    SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;
    
    SELECT SEQ_EMPNO.CURRVAL FROM DUAL;
    
    INSERT INTO EMP(EMPNO,ENAME) VALUES(SEQ_EMPNO.NEXTVAL,'SHASHI');
    
    SELECT * FROM EMP;
    
    DELETE FROM EMP WHERE ENAME='SHASHI';
    
    ALTER SEQUENCE SEQ_EMPNO 
    INCREMENT BY 10
    MAXVALUE 9999
    CYCLE;
    
    
--    DROP SEQUENCE:
        DROP SEQUENCE SEQ_EMPNO;
    
    DESC USER_SEQUENCES;
    
    SELECT SEQUENCE_NAME FROM USER_SEQUENCES;
    
    ========================================================
    				Synonyms
What is a Synonym?
	A Synonym in Oracle is an alias or an alternative name for a database object like
Tables,Views,Sequences,Materialized Views,Procedures
Synonyms help in simplifying access to objects, especially when they belong to different schemas.

CREATE SYNONYM EMP_SYN FOR EMP;

SELECT * FROM EMP_SYN

CREATE PUBLIC SYNONYM EMP_SYN1 FOR EMP;

SELECT * FROM EMP_SYN1;

DESC ALL_SYNONYMS;

DESC USER_SYNONYMS;

SELECT SYNONYM_NAME,TABLE_NAME FROM USER_SYNONYMS WHERE TABLE_NAME='EMP';

    
    
    
    
    
    
    
    
    
    
    
    
    
   
 