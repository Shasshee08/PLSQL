 SQL Practice Questions
    SELECT * FROM EMP2;
    SELECT * FROM DEPT2;

--1️⃣ Basic Queries
--Retrieve all employees who were hired before 1982.
    SELECT * FROM EMP2 WHERE TO_CHAR(HIREDATE,'YY')<82;
    
    SELECT * FROM EMP2 WHERE HIREDATE<TO_DATE('01-JAN-1982' , 'DD-MM-YYYY');
    
    SELECT * FROM EMP2 WHERE HIREDATE BETWEEN TO_DATE('01-JAN-1981' ,'DD-MM-YYYY') AND TO_DATE('31-DEC-1981' ,'DD-MM-YYYY');
--List all unique job titles from the EMP table.
    SELECT DISTINCT JOB FROM EMP2;

--Show the employees whose salary is between 1200 and 3000.
    SELECT * FROM EMP2 WHERE SAL BETWEEN 1200 AND 3000;
    
    SELECT * FROM EMP2 WHERE SAL>=1200 AND SAL<=3000;
--2️⃣ Joins & Aggregations
--Retrieve the department name and location for each employee.
    SELECT D.DNAME,D.LOC,E.ENAME FROM EMP2 E JOIN DEPT2 D ON E.DEPTNO=D.DEPTNO;

--Find the highest salary in each department.
    SELECT D.DNAME,E.ENAME,E.SAL FROM EMP2 E JOIN DEPT2 D ON E.DEPTNO=D.DEPTNO 
    WHERE E.SAL=(SELECT MAX(SAL) FROM EMP2 WHERE DEPTNO=E.DEPTNO);
    
    SELECT DEPTNO,MAX(SAL) FROM EMP2 GROUP BY DEPTNO;

--Count the number of employees in each department.
    SELECT DEPTNO,COUNT(*) FROM EMP2 GROUP BY DEPTNO;
    
    SELECT D.DNAME,COUNT(*) FROM EMP2 E JOIN DEPT2 D ON E.DEPTNO=D.DEPTNO GROUP BY D.DNAME;
--Find employees who earn more than their manager.
    SELECT E.ENAME AS EMPLOYEE,M.ENAME AS MANAGERS FROM EMP2 E JOIN EMP M ON M.EMPNO=E.MGR 
    WHERE E.SAL>M.SAL;

--3️⃣ Subqueries & Advanced SQL
--Retrieve employees who have the highest salary in their department.
    SELECT * FROM EMP2 WHERE SAL=(SELECT MAX(SAL) FROM EMP2);
    
    SELECT D.DNAME,E.ENAME,E.SAL FROM EMP2 E JOIN DEPT2 D ON E.DEPTNO=D.DEPTNO 
    WHERE E.SAL=(SELECT MAX(SAL) FROM EMP2 WHERE DEPTNO=E.DEPTNO);
--Find the department with the maximum number of employees.
    SELECT DNAME,COUNT(*) FROM EMP2 E JOIN DEPT2 D ON E.DEPTNO=D.DEPTNO
    GROUP BY D.DNAME HAVING COUNT(*)=(SELECT MAX(COUNT(*))
    FROM EMP2 E1 JOIN DEPT2 D1 ON E1.DEPTNO=D1.DEPTNO GROUP BY D1.DNAME);
    
--Get the employees who do not have a commission (COMM is NULL).
    SELECT * FROM EMP2 WHERE COMM IS NULL;
    
--4️⃣ Window Functions & Performance Optimization
--Rank employees based on their salary within each department.
    SELECT ENAME,DEPTNO,SAL,DENSE_RANK() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANKS FROM EMP2;

--Retrieve employees who are earning above the department’s average salary.
--Show the cumulative salary of employees in each department ordered by salary.
    SELECT ENAME,DEPTNO,SAL,SUM(SAL) OVER (PARTITION BY DEPTNO ORDER BY SAL DESC) AS CUMMULATIVE_SAL FROM EMP2;
    
--5️⃣ Query Optimization & Edge Cases
--Fetch employees hired in the last 3 months before the latest hire date.
    SELECT * FROM EMP2 WHERE HIREDATE BETWEEN ADD_MONTHS((SELECT MAX(HIREDATE) FROM EMP2), -3) AND
    (SELECT MAX(HIREDATE) FROM EMP2);

--Identify employees who have the same salary as someone else in the company.
    SELECT ENAME,SAL FROM EMP2  WHERE SAL IN (SELECT SAL FROM EMP2 GROUP BY SAL
    HAVING COUNT(*)>1);
    
