    SELECT * FROM EMP;
    
    SELECT * FROM DEPT;

    SELECT * FROM SALGRADE;

--Retrieve the names of all employees who earn more than their department's average salary.

    SELECT * FROM EMP E WHERE SAL>(SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);

--Find the second highest salary from the EMP table without using the LIMIT or TOP keyword.
    SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP WHERE SAL<(SELECT MAX(SAL) FROM EMP));

--Retrieve the department name and the highest salary in each department.
    SELECT D.DNAME,MAX(SAL)AS HIGH_SAL FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO GROUP BY D.DNAME;

--Get a list of employees who were hired before their manager.
    SELECT E1.ENAME AS EMPLOYEE_NAME,E1.HIREDATE AS EMP_HIREDATE,
    E2.ENAME AS MANAGER_NAME,E2.HIREDATE AS MGR_HIREDATE FROM EMP E1
    JOIN EMP E2 ON E1.MGR=E2.EMPNO WHERE E1.HIREDATE<E2.HIREDATE;

--Display departments where the total salary expense is greater than 5000.
    SELECT D.DNAME,SUM(SAL) FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO
    GROUP BY D.DNAME HAVING SUM(SAL)>5000;

--Retrieve the employees who do not have a manager.
    SELECT * FROM EMP WHERE MGR IS NULL;

--Find the employee(s) with the longest tenure in the company.
        SELECT * FROM EMP WHERE HIREDATE=(SELECT MIN(HIREDATE) FROM EMP);

--Find employees who earn the same salary as someone in the "SALES" department.
    SELECT * FROM EMP WHERE SAL IN(SELECT SAL FROM EMP WHERE DEPTNO=30);

--Retrieve the top 3 highest-paid employees in each department.
    SELECT * FROM(SELECT DEPTNO,ENAME,SAL,DENSE_RANK() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANKS FROM EMP) 
    WHERE RANKS<=3;
    

--Find the department(s) with the most employees.
    SELECT DEPTNO,COUNT(*)AS EMP_COUNT FROM EMP GROUP BY DEPTNO HAVING COUNT(*)=(SELECT MAX(EMP_COUNT) FROM
    (SELECT COUNT(*)AS EMP_COUNT FROM EMP GROUP BY DEPTNO));

--Retrieve the names of employees whose salaries are greater than at least two other employees in their department.
    SELECT * FROM EMP E1 WHERE(SELECT COUNT(*) FROM EMP E2 WHERE E1.DEPTNO=E2.DEPTNO AND E1.SAL>E2.SAL)>=2;

--Display all employees along with their manager’s name.
    SELECT E.ENAME AS EMP_NAME,E.MGR AS MGR_NUM,M.ENAME AS MGR_NAME,M.EMPNO AS EMP_NUM FROM EMP E JOIN EMP M
    ON E.MGR=M.EMPNO;

--Retrieve employees who have the same job title as their manager.
           SELECT E.*
              FROM EMP E 
                JOIN EMP M ON E.MGR = M.EMPNO
                    WHERE E.JOB = M.JOB;


--Get the employees who have the maximum commission in their respective departments.
    SELECT * FROM EMP WHERE COMM=(SELECT MAX(COMM) FROM EMP);
    
    SELECT * FROM (SELECT DEPTNO,ENAME,SAL,COMM,RANK() OVER(PARTITION BY DEPTNO ORDER BY COMM DESC NULLS LAST) AS RANKS FROM EMP
    WHERE COMM IS NOT NULL)
    WHERE RANKS=1;
    

--Find the cumulative salary of employees ordered by hire date using Window Functions.
    SELECT HIREDATE,ENAME,SAL,SUM(SAL) OVER(ORDER BY HIREDATE) AS CUMM_SAL FROM EMP;
    
--Find the employees whose salary is greater than the salary of their department’s manager.
    SELECT * FROM EMP E JOIN EMP M ON E.MGR=M.EMPNO WHERE 
    E.SAL>M.SAL;

--Display employees who joined in the same month and year as another employee.
        SELECT * 
        FROM EMP E1
        WHERE EXISTS (
        SELECT 1 
        FROM EMP E2 
        WHERE E1.EMPNO <> E2.EMPNO  -- Exclude self-comparison
        AND EXTRACT(YEAR FROM E1.HIREDATE) = EXTRACT(YEAR FROM E2.HIREDATE)
         AND EXTRACT(MONTH FROM E1.HIREDATE) = EXTRACT(MONTH FROM E2.HIREDATE));

        SELECT * FROM ( SELECT EMP.*, 
           COUNT(*) OVER (PARTITION BY EXTRACT(YEAR FROM HIREDATE), EXTRACT(MONTH FROM HIREDATE)) AS CNT
         FROM EMP) WHERE CNT > 1;

--Find the department where the total salary of salesmen is higher than the total salary of managers.
    select deptno from emp where job='SALESMAN' GROUP BY DEPTNO 
    HAVING SUM(SAL)>(SELECT SUM(SAL) FROM EMP WHERE JOB='MANAGER' AND EMP.DEPTNO=EMP.DEPTNO);
    

--Retrieve employees along with their salary grade from the SALGRADE table.
    SELECT * FROM EMP E JOIN SALGRADE S 
    ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

--Write an optimized query to find the total salary and employee count per department, only for departments where the average salary is greater than 2500.
    SELECT DEPTNO,COUNT(*) AS EMP_COUNT,SUM(SAL) AS TOTAL_SAL FROM EMP
    GROUP BY DEPTNO HAVING AVG(SAL)>2500;
