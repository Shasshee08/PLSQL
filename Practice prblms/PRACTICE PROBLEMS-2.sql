--Basic SQL Queries
    SELECT * FROM EMP2;
    SELECT * FROM DEPT2;
--1️⃣ List employees working in a department located in DALLAS.
    SELECT * FROM EMP WHERE DEPTNO=20;
    
    SELECT * FROM EMP2 E JOIN DEPT2 D ON E.DEPTNO=D.DEPTNO WHERE LOC='DALLAS';

--2️⃣ Find employees whose names start with 'A' and have more than 4 characters
    SELECT * FROM EMP2 WHERE ENAME LIKE 'A%' AND LENGTH(ENAME)>4;
    
--3️⃣ Retrieve employees hired in the year 1981.
    SELECT * FROM EMP2 WHERE TO_CHAR(HIREDATE,'YY')=81;

--4️⃣ Get the total salary paid in each department.
    SELECT D.DNAME,SUM(SAL) AS TOTAL FROM EMP E
    JOIN DEPT D ON E.DEPTNO=D.DEPTNO
    GROUP BY D.DNAME;
    
    select deptno,sum(sal) from emp2 group by deptno;

--5️⃣ List employees whose job is the same as 'FORD'.
    SELECT * FROM EMP2 WHERE JOB=(SELECT JOB FROM EMP2 WHERE ENAME='FORD');
--
--Intermediate SQL Queries
--6️⃣ Find the third highest salary in the company.
    SELECT * FROM EMP2 WHERE SAL=(SELECT MAX(SAL) FROM EMP2 WHERE SAL<(SELECT MAX(SAL) FROM EMP2 WHERE SAL<(SELECT MAX(SAL) FROM EMP2)));
    
    SELECT * FROM(SELECT ENAME,JOB,SAL,DENSE_RANK() OVER (ORDER BY SAL DESC) AS RANKS FROM EMP2) WHERE RANKS=3; 

--7️⃣ List employees who have the highest salary in their department but are not managers.
    SELECT ENAME,JOB,SAL,DEPTNO FROM EMP2 E WHERE SAL=(SELECT MAX(SAL) FROM EMP2 WHERE DEPTNO=E.DEPTNO )
    AND JOB!='MANAGER';

    SELECT JOB,MAX(SAL) FROM EMP2 GROUP BY JOB;
--8️⃣ Retrieve employees whose salary is within 10% of the highest salary in their department.
    SELECT E.ENAME,E.JOB,E.SAL,E.DEPTNO FROM EMP2 E WHERE E.SAL BETWEEN
    (SELECT MAX(SAL)*0.90 FROM EMP2 WHERE DEPTNO=E.DEPTNO)
    AND
    (SELECT MAX(SAL) FROM EMP2 WHERE DEPTNO=E.DEPTNO);

--9️⃣ Find employees who have the same job role as their manager.
    SELECT E.ENAME AS EMPLOYEE,E.JOB AS EMP_JOB,M.ENAME AS MANAGERS,M.JOB AS MGR_JOB FROM EMP2 E
    JOIN EMP2 M ON E.MGR=M.EMPNO
    WHERE E.JOB=M.JOB;
    
--🔟 Display employees who earn more than the average salary of all employees.
    SELECT * FROM EMP E WHERE SAL>(SELECT AVG(SAL) FROM EMP);

--Advanced SQL Queries
--1️⃣1️⃣ Find departments where more than 2 employees are working
    SELECT DEPTNO,COUNT(*) FROM EMP GROUP BY DEPTNO HAVING COUNT(*)>2;
