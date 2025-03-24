-- Retrieve the names and salaries of employees who earn more than 2000 from the EMP table.
    SELECT ENAME,SAL FROM EMP WHERE SAL>2000;
    
--Display the employee name, job, department name, and location for all employees.
    SELECT ENAME,JOB,DNAME,LOC FROM EMP E LEFT JOIN DEPT D ON E.DEPTNO=D.DEPTNO;
    
--     Get the top 3 highest-paid employees in each department.
        SELECT * FROM(SELECT ENAME,SAL,DEPTNO,DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANKS FROM EMP) 
        WHERE RANKS<=3;
        
--  find employees who earn more than their department’s average salary   
        SELECT  * FROM EMP E WHERE SAL>(SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);
        
--1️⃣ Retrieve the names and salaries of employees who earn more than 2500.
    SELECT ENAME,SAL FROM EMP WHERE SAL>2500;
    
--2️⃣ Find all employees who were hired before January 1, 1982.
    SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YY')<82;
    
--3️⃣ Get a list of unique job titles from the EMP table.
    SELECT DISTINCT(JOB) FROM EMP;

--4️⃣ Show the employee name and their annual salary (SAL * 12) with an alias "ANNUAL_SALARY".
    SELECT ENAME,SAL,SAL*12 AS ANNUAL_SAL FROM EMP;

--5️⃣ Retrieve all employees who don’t have a commission (COMM is NULL).
    SELECT * FROM EMP WHERE COMM IS  NULL;


--6️⃣ Display the employee name, job title, department name, and location for each employee.
    SELECT ENAME,JOB,DNAME,LOC FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO;

--7️⃣ Find the name of the employee who earns the highest salary in the company.
    SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP);

--8️⃣ Show the employee names and their managers’ names. (Self Join on EMP table)
    SELECT E.ENAME AS EMPLOYEES,E.MGR AS EMPLOYEE_MGR,M.EMPNO AS MANAGER_EMPNO,M.ENAME AS MANAGERS FROM EMP E JOIN EMP M ON
    E.MGR=M.EMPNO;

--9️⃣ List the departments that have at least one employee.
    SELECT DEPTNO,COUNT(*) FROM EMP GROUP BY DEPTNO HAVING COUNT(*)>1;

--🔟 Find employees whose salary is greater than the average salary of the company.
    SELECT * FROM EMP E WHERE SAL>(SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);


---1️⃣1️⃣ Find the second highest salary in the company without using LIMIT or TOP.
    SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP WHERE SAL<(SELECT MAX(SAL) FROM EMP));

--1️⃣2️⃣ Display employees along with their department’s average salary and a column indicating whether they earn above or below the average.
        SELECT ENAME, SAL, DEPTNO, 
        AVG(SAL) OVER (PARTITION BY DEPTNO) AS DEPT_AVG_SAL,
        CASE  
           WHEN SAL > AVG(SAL) OVER (PARTITION BY DEPTNO) THEN 'Above Average'  
           WHEN SAL < AVG(SAL) OVER (PARTITION BY DEPTNO) THEN 'Below Average'  
           ELSE 'Average'  
        END AS SALARY_STATUS  
        FROM EMP;


--1️⃣3️⃣ Rank employees in each department based on their salary (use RANK()).
    SELECT * FROM(SELECT ENAME,SAL,RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC)AS RANKS FROM EMP);

--1️⃣4️⃣ Retrieve the cumulative salary total for each employee in order of hire date (use SUM() as a window function).
        SELECT ENAME,SAL,HIREDATE,SUM(SAL) OVER(ORDER BY HIREDATE) AS CUMM_SAL FROM EMP;

--1️⃣5️⃣ Get the top 3 highest-paid employees in each department.
    SELECT * FROM(SELECT ENAME,SAL,DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANKS FROM EMP) WHERE RANKS<=3;


--1️⃣6️⃣ Find employees who have the same salary as someone else in the company.
    SELECT * FROM EMP WHERE SAL IN(SELECT SAL FROM EMP GROUP BY SAL HAVING COUNT(*)>1);

--1️⃣7️⃣ List the employees who were hired on the same date as another employee
    SELECT * FROM EMP WHERE HIREDATE IN(SELECT HIREDATE FROM EMP GROUP BY HIREDATE HAVING COUNT(*)>1);


--1️⃣8️⃣ Retrieve departments that have more than 3 employees.
    SELECT DEPTNO,COUNT(*) AS EMP_COUNT FROM EMP GROUP BY DEPTNO HAVING COUNT(*)>3;
    
--1️⃣9️⃣ Show employees whose salary is higher than their manager's salary.
    SELECT E.ENAME AS MANAGERS,M.ENAME AS MANAGERS FROM EMP E JOIN EMP M ON E.MGR=M.EMPNO
    WHERE E.SAL>M.SAL;

--2️⃣0️⃣ Display the employee with the highest salary in each department.  
    SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMp);
