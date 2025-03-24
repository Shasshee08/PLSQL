Basic Queries (2 Problems)
1️⃣ Retrieve the details of employees whose salary is between 1000 and 3000.
    SELECT * FROM EMP2 WHERE SAL>=1000 AND SAL<=3000;

2️⃣ Display all employees hired before 1982.
    SELECT * FROM EMP2 WHERE TO_CHAR(HIREDATE,'YY')<82;
    
    SELECT * FROM EMP2 WHERE HIREDATE<TO_DATE('01-JAN-1982','DD-MM-YYYY');

Aggregation & Grouping (2 Problems)
--3️⃣ Find the average salary for each job role in the company.
    SELECT JOB,AVG(SAL) FROM EMP2 GROUP BY JOB;

--4️⃣ Count the number of employees in each department.
    SELECT DEPTNO,COUNT(*) FROM EMP2 GROUP BY DEPTNO;

--Joins (2 Problems)
--5️⃣ Retrieve employee names along with their department location.
    SELECT ENAME,LOC FROM  EMP2 E JOIN DEPT2 D ON E.DEPTNO=D.DEPTNO;

--6️⃣ Display employees and their managers' names.
    SELECT E.ENAME,M.ENAME AS MANAGERS FROM EMP2 E JOIN EMP M ON M.EMPNO=E.MGR;

Subqueries (2 Problems)
--7️⃣ List employees who earn more than the average salary of their department
    SELECT * FROM EMP2 E WHERE SAL>(SELECT AVG(SAL) FROM EMP2 WHERE DEPTNO=E.DEPTNO);
--8️⃣ Find departments that have more than 3 employees.
    SELECT DEPTNO,COUNT(*) FROM EMP2 GROUP BY DEPTNO HAVING COUNT(*)>3;
    
Set Operations (2 Problems)
--9️⃣ Display employees who are not assigned to any department.
    SELECT * FROM EMP2 WHERE DEPTNO IS NULL;

--🔟 Find all employees who are either managers or analysts.
    SELECT * FROM EMP2 WHERE JOB IN('MANAGER','ANALYST');

--Window Functions (2 Problems)
--1️⃣1️⃣ Show each employee’s salary along with the department-wise salary rank.
    SELECT ENAME,SAL,DEPTNO,DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANK FROM EMP2;    

--1️⃣2️⃣ Retrieve employees with the second-highest salary in their department using window functions
    SELECT * FROM(SELECT ENAME,SAL,DEPTNO,DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANK  FROM EMP2)
    WHERE RANK=N;

--Query Optimization (2 Problems)
--1️⃣3️⃣ Write an optimized query to find the highest salary in each department without using subqueries.
--1️⃣4️⃣ Find employees who earn more than their direct manager.
    SELECT E.ENAME AS EMP_NAME,E.SAL AS EMP_SAL,
    M.ENAME AS M_NAME,M.SAL AS M_SAL FROM EMP2 E JOIN EMP2 M ON
    E.MGR=M.EMPNO WHERE E.SAL>M.SAL;

--
--Miscellaneous (1 Problem)
--1️⃣5️⃣ Find the top 3 highest-paid employees across all departments.
    SELECT ENAME,SAL FROM EMP2 ORDER BY SAL DESC
    FETCH FIRST 3 ROWS ONLY;
    
    --1️⃣2️⃣ List employees along with their next hired employee (use LEAD()).
--1️⃣3️⃣ Find employees who are getting the same salary as someone in a different department.
--1️⃣4️⃣ Get employees whose salary is within 20% of their department’s average salary.
--1️⃣5️⃣ List departments where total salary expense is higher than any other departmen