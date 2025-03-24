 SQL Problems for Today
Solve the following queries using your EMP and DEPT tables:

--1️⃣ Find all employees who have a salary greater than their manager's salary.
    SELECT E.ENAME AS EMPLOYEE,M.ENAME AS MANAGERS FROM EMP2 E JOIN EMP M 
    ON E.MGR=M.EMPNO WHERE E.SAL>M.SAL;
    
--2️⃣ List employees who do not have a commission (COMM is NULL).
    SELECT * FROM EMP2 WHERE COMM IS  NULL;    

--3️⃣ Retrieve the department name and the highest salary in each department
    SELECT D.DNAME,MAX(SAL) AS HIGHEST_SAL FROM EMP2 E JOIN DEPT2 D ON
    E.DEPTNO=D.DEPTNO GROUP BY DNAME;

--4️⃣ Find the second highest salary in the company
    SELECT * FROM EMP2 WHERE SAL=(SELECT MAX(SAL) FROM EMP2 WHERE SAL<(SELECT MAX(SAL) FROM EMP2));
    
    SELECT * FROM(SELECT ENAME,JOB,SAL,DENSE_RANK() OVER(ORDER BY SAL DESC) AS RANKS FROM EMP2) WHERE RANKS=2;

--5️⃣ Display employees whose names contain exactly 5 letters.
    SELECT * FROM EMP2 WHERE LENGTH(ENAME)=5;

--6️⃣ Retrieve the names of employees who were hired in the same year as ‘JONES’.
        SELECT ENAME 
    FROM EMP2
    WHERE YEAR(HIREDATE) = (
        SELECT YEAR(HIREDATE) 
        FROM EMP2 
        WHERE ENAME = 'JONES'
    );

    
    SELECT * FROM EMP2 WHERE TO_CHAR(HIREDATE,'YY')='81';

--7️⃣ Show the total salary expenditure for each department.
    SELECT DEPTNO,SUM(SAL) FROM EMP2 GROUP BY DEPTNO;

--8️⃣ Find the employees who have the same job as ‘FORD’.
    SELECT * FROM EMP2 WHERE JOB IN(SELECT JOB FROM EMP2 WHERE ENAME='FORD');

--9️⃣ List employees who earn more than the average salary of their department
    SELECT * FROM EMP2 E WHERE SAL>(SELECT AVG(SAL) FROM EMP2 WHERE DEPTNO=E.DEPTNO GROUP BY DEPTNO);
--🔟 Find departments that do not have any employees.
    SELECT * FROM DEPT2 D LEFT JOIN EMP2 E ON E.DEPTNO=D.DEPTNO
    WHERE E.DEPTNO IS NULL;
    
