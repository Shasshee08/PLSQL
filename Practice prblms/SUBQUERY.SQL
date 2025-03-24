SELECT * FROM EMP;

SELECT * FROM DEPT;

SELECT * FROM SALGRADE;

Single row subquery:
	- when a subquery returns a single value is known as "SRSQ".
	- we can use the following operators are " = , < , > , <= , >= , != ".

EX:
--waq to display employees details who are earning the 1st highest salary in the organization?

    SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP);
    
--waq to display the senior most employees details from emp table?
    SELECT * FROM EMP WHERE HIREDATE=(SELECT MIN(HIREDATE) FROM EMP);
    
--waq to find out the second highest salary from emp table?    
    (SELECT MAX(SAL) FROM EMP WHERE SAL<(SELECT MAX(SAL) FROM  EMP));
    
--waq to display employees details who are getting the 2nd highest salary in the organization?    
     SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP WHERE SAL<(SELECT MAX(SAL) FROM  EMP));
     
--waq to fetch employees details from emp table whose salary is more than the maximum salary of 
--the job is "SALESMAN"?     
    SELECT * FROM EMP WHERE SAL>(SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN');
    
--waq to find out the 3rd highest salary from emp table?   
--waq to display employees details who are getting the 3rd highest salary in the organization?
       SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP WHERE SAL<(SELECT MAX(SAL) FROM EMP WHERE 
       SAL<(SELECT MAX(SAL) FROM EMP)));
    
--    Find employees who earn more than SMITH.
   SELECT * FROM EMP WHERE SAL>( SELECT SAL FROM EMP WHERE ENAME='SMITH');
        
    
--    Find employees who joined before KING
    SELECT * FROM EMP WHERE HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='KING');
    
--    Find employees in the same department as BLAKE
    SELECT * FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='BLAKE');
    
    
Multiple row subquery: 
	- when a subquery return more than one value is known as "MRSQ".
	- in this subquery we will use the following operators are "IN,ANY,ALL".

EX:
--waq to display employees details from emp table whose job is same as the employees "SMITH","BLAKE"    ?
    SELECT * FROM EMP WHERE JOB IN(SELECT JOB FROM EMP WHERE ENAME IN('SMITH','BLAKE'));
    
    
--waq to display employees who are getting minimum and maximum salary from emp table?    
    SELECT * FROM EMP WHERE SAL IN(
    SELECT MIN(SAL) FROM EMP 
    UNION
    SELECT MAX(SAL) FROM EMP 
    );
            
--waq to display employees who are getting maximum salary from each job wise?            
    SELECT * FROM EMP WHERE SAL IN(SELECT MAX(SAL) FROM EMP GROUP BY JOB);
    
--waq to fetch the senior most employees details from each deptno wise?    
    SELECT * FROM EMP WHERE HIREDATE IN(SELECT MIN(HIREDATE) FROM EMP GROUP BY DEPTNO);
    
--Find employees who have the same job as someone in department 30    
    SELECT * FROM EMP WHERE JOB IN(SELECT JOB FROM EMP WHERE DEPTNO=30);
    
ANY operator:
	- it return TRUE if any one value is satisfied with the given conditional value in the query.
    
ALL operator:
	- it return TRUE if all values are satisfied with the given conditional value in the query.
    
--waq to display employees whose salary is more than to all SALESMAN salaries?    
    SELECT * FROM EMP WHERE SAL>ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN');
    
--waq to display employees whose salary is more than to any SALESMAN salary?    
    SELECT * FROM EMP WHERE SAL>ANY(SELECT SAL FROM EMP WHERE JOB='SALESMAN');
    ===============================================================================
Correlated Subquery:
A Correlated Subquery is a subquery that depends on the outer query for its execution.
It runs once for each row in the outer query.
The subquery references a column from the outer query.
 	Used when we need row-by-row comparison.

    
--    Employees earning more than the average salary of their department
    SELECT * FROM EMP E1 WHERE SAL>(SELECT AVG(SAL) FROM EMP E2 WHERE E1.DEPTNO=E2.DEPTNO);    
    
--    Employees who joined before their manageR
    SELECT * FROM EMP E1 WHERE E1.HIREDATE<(SELECT E2.HIREDATE FROM EMP E2 WHERE E1.MGR=E2.EMPNO);
    
    
    
--    Find employees whose department is located in ‘DALLAS’.
    SELECT * FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');
    
    
    SELECT * FROM EMP WHERE SAL>(SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);

EXISTS 
EXISTS returns TRUE if the subquery returns at least one row.
If the subquery finds matching data, the outer query executes.
If the subquery returns no rows, the outer query does not execute.

NOT EXISTS 
NOT EXISTS returns TRUE if the subquery returns no rows.
If the subquery finds no matching data, the outer query executes.
If the subquery returns any row, the outer query does not execute.

-- Find departments that have at least one employee
    SELECT DNAME FROM DEPT D WHERE NOT EXISTS(SELECT 1 FROM EMP E WHERE D.DEPTNO=E.DEPTNO);
    
    
--    Find employees who have subordinates (Are Managers)
    SELECT * FROM EMP E1 WHERE EXISTS(SELECT 1 FROM EMP E2 WHERE E1.EMPNO=E2.MGR);
    
    
--    Find employees working in the SALES department
    SELECT ENAME FROM EMP E WHERE EXISTS(SELECT 1 FROM DEPT D WHERE E.DEPTNO=D.DEPTNO AND D.DNAME='SALES');
    
--    waq to display the top 6 highest salaries rows from emp table by using INLINE VIEW along with ROWNUM?
         SELECT * FROM(SELECT * FROM EMP ORDER BY SAL DESC) WHERE ROWNUM<=6;

select rowid from emp;

select rownum from emp;

SELECT LEVEL, ENAME, JOB, MGR 
FROM EMP 
START WITH MGR IS NULL 
CONNECT BY PRIOR EMPNO = MGR;

SELECT ENAME, HIREDATE 
FROM EMP 
WHERE HIREDATE < SYSDATE;

SELECT USER FROM DUAL;

SELECT ROWNUM,ROWID,ENAME,SAL FROM EMP;

SELECT ROWNUM, ENAME, JOB, SAL 
FROM (SELECT ENAME, JOB, SAL FROM EMP ORDER BY SAL DESC) 
WHERE ROWNUM <= 3;

SELECT ENAME, SAL, ROWID 
FROM EMP 
WHERE SAL IN (SELECT SAL FROM EMP GROUP BY SAL HAVING COUNT(*) > 1);

SELECT LEVEL, ENAME, JOB, MGR 
FROM EMP 
START WITH MGR IS NULL 
CONNECT BY PRIOR EMPNO = MGR;

select * from emp where rownum<=5;
    ==============================================================================================
                                VIEWS
    CREATE VIEW EMP_DEPT AS
    SELECT E.ENAME,E.JOB,D.DNAME,D.LOC FROM EMP E JOIN DEPT ON
    E.DPTNO=D.DEPTNO;
    
    SELECT * FROM EMP_DEPT;
    
    CREATE VIEW dept_avg_salary AS
SELECT D.DNAME, AVG(E.SAL) AS avg_salary
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME;

SELECT * FROM DEPT_AVG_SALARY;

CREATE VIEW sales_employees AS
SELECT ENAME, JOB, SAL FROM EMP WHERE DEPTNO = 30;
    

SELECT * FROM SALES_EMPLOYEES;    

SELECT VIEW_NAME FROM USER_VIEWS;

SELECT VIEW_NAME, OWNER FROM ALL_VIEWS;

SELECT TEXT FROM USER_VIEWS WHERE VIEW_NAME = 'EMP_DEPT';

CREATE VIEW dept_summary AS
SELECT D.DEPTNO, D.DNAME, D.LOC, 
       COUNT(E.EMPNO) AS EMP_COUNT, 
       AVG(E.SAL) AS AVG_SAL
FROM DEPT D
LEFT JOIN EMP E ON D.DEPTNO = E.DEPTNO
GROUP BY D.DEPTNO, D.DNAME, D.LOC;

select * from dept_summary;

SELECT * FROM DBA_VIEWS;
    
    MB VIEWS
    --------
CREATE MATERIALIZED VIEW DEPT_AVG_SAL_MV
BUILD IMMEDIATE
REFRESH COMPLETE
AS
SELECT DEPTNO,AVG(SAL) FROM EMP 
GROUP BY DEPTNO;

SELECT * FROM DEPT_AVG_SAL_MV;
    
SELECT MVIEW_NAME FROM USER_MVIEWS;    
        
    
    
    
    