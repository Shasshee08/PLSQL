-- Step 1: Create the DEPT_LARGE table with more departments


CREATE TABLE DEPT_LARGE (
    DEPTNO INT PRIMARY KEY,
    DNAME VARCHAR(50),
    LOC VARCHAR(50)
);

-- Insert more departments (e.g., 50 departments)
INSERT INTO DEPT_LARGE (DEPTNO, DNAME, LOC)
SELECT level, 
       'Department ' || level, 
       CASE MOD(level, 5) 
            WHEN 0 THEN 'New York'
            WHEN 1 THEN 'Los Angeles'
            WHEN 2 THEN 'Chicago'
            WHEN 3 THEN 'Houston'
            ELSE 'Dallas' 
       END
FROM dual CONNECT BY level <= 50;

-- Step 2: Create the SALGRADE_LARGE table with more salary grades
CREATE TABLE SALGRADE_LARGE (
    GRADE INT PRIMARY KEY,
    LOSAL INT,
    HISAL INT
);

-- Insert more salary grades (e.g., 10 grades)
INSERT INTO SALGRADE_LARGE (GRADE, LOSAL, HISAL)
SELECT level, level * 1000, level * 2000
FROM dual CONNECT BY level <= 10;

-- Step 3: Create the EMP_LARGE table with 1 million rows
CREATE TABLE EMP_LARGE (
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(50),
    JOB VARCHAR(50),
    MGR INT,
    HIREDATE DATE,
    SAL INT,
    COMM INT,
    DEPTNO INT,
    FOREIGN KEY (DEPTNO) REFERENCES DEPT_LARGE(DEPTNO)
);

-- Insert 1 million employees with random but structured data
INSERT INTO EMP_LARGE (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT 
    level, 
    'Employee ' || level, 
    CASE MOD(level, 5) 
        WHEN 0 THEN 'CLERK'
        WHEN 1 THEN 'MANAGER'
        WHEN 2 THEN 'ANALYST'
        WHEN 3 THEN 'SALESMAN'
        ELSE 'PRESIDENT' 
    END,
    CASE WHEN MOD(level, 10) = 0 THEN NULL ELSE level - 1 END,
    TRUNC(SYSDATE - DBMS_RANDOM.VALUE(1000, 5000)),
    TRUNC(DBMS_RANDOM.VALUE(2000, 10000)),
    CASE WHEN MOD(level, 4) = 0 THEN NULL ELSE TRUNC(DBMS_RANDOM.VALUE(100, 1000)) END,
    TRUNC(DBMS_RANDOM.VALUE(1, 50))
FROM dual CONNECT BY level <= 1000000;

select * from emp_large;

select count(*) from emp_large;
