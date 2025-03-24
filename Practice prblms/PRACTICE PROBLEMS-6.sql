--Find the employees who earn more than their department's average salary?
    SELECT * FROM EMP2 E WHERE SAL>(SELECT AVG(SAL) FROM EMP2 WHERE DEPTNO=E.DEPTNO)ORDER BY DEPTNO;
    
    SELECT DEPTNO,AVG(SAL) FROM EMP2 GROUP BY DEPTNO;
    
--    Find the second highest salary from the EMP table
    SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP2 WHERE SAL<(SELECT MAX(SAL) FROM EMP2));
    
--    Find the employees who have the maximum commission (COMM) in the EMP table.
    SELECT * FROM EMP2 WHERE COMM=(SELECT MAX(COMM) FROM EMP2);
    
--    Find the department(s) with the highest average salary from the EMP table.
        SELECT DEPTNO, AVG(SAL) AS AVG_SAL 
FROM EMP 
GROUP BY DEPTNO 
HAVING AVG(SAL) = (
    SELECT MAX(AVG_SAL) 
    FROM (SELECT DEPTNO, AVG(SAL) AS AVG_SAL FROM EMP GROUP BY DEPTNO) AS DeptAvg
);

--Find the employees who joined on the same date as their manager from the EMP table.
   SELECT e1.* 
FROM EMP e1
JOIN EMP e2 ON e1.MGR = e2.EMPNO 
WHERE e1.HIREDATE = e2.HIREDATE;

--Find the employees who earn the highest salary in each department from the EMP table
 
    SELECT * FROM EMP2 E1 WHERE SAL=(SELECT MAX(SAL) FROM EMP2 E2 WHERE E1.DEPTNO=E2.DEPTNO);
    
--    Find the employees who do not have a manager (i.e., MGR is NULL) from the EMP table.
        SELECT * FROM EMP2 WHERE MGR IS NULL;

--Find the employees whose salary is higher than the salary of ALL managers from the EMP table.
       
        SELECT * FROM EMP2 WHERE SAL>ALL(SELECT SAL FROM EMP2 WHERE JOB='MANAGER');
        
-- Find the employees who have the same job title as their manager from the EMP table
    
        SELECT E1.* FROM EMP2 E1 JOIN EMP2 E2 ON E1.MGR=E2.EMPNO
        WHERE E1.JOB=E2.JOB;
        
-- Find the department(s) that have more than 3 employees from the EMP table.

