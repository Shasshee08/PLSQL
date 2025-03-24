1️⃣ Highest Earning Employee per Department
Retrieve the employee(s) with the highest salary in each department.
Output: DEPTNO, DNAME, EMPNO, ENAME, SAL

    SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.SAL FROM DEPT D JOIN EMP E 
    ON D.DEPTNO=E.DEPTNO WHERE E.SAL=(SELECT MAX(SAL) FROM EMP  WHERE DEPTNO=E.DEPTNO);

--2️⃣ Employees Who Earn More Than Their Manager
--Find employees whose salary is higher than their direct manager's salary.
--Output: EMPNO, ENAME, JOB, SAL, MGR, MANAGER_NAME, MANAGER_SAL
    SELECT E.EMPNO,E.ENAME,E.JOB,E.SAL,E.MGR,M.ENAME AS MANAGER_NAME,M.SAL AS MANAGER_SAL FROM EMP E JOIN EMP M
    ON E.MGR=M.EMPNO WHERE E.SAL>M.SAL;


--3️⃣ Second Highest Salary in Each Department
--Find the second highest salary in each department.
--Output: DEPTNO, DNAME, EMPNO, ENAME, SAL
    SELECT DEPTNO,DNAME,EMPNO,ENAME,SAL FROM  (SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL,
           DENSE_RANK() OVER (PARTITION BY E.DEPTNO ORDER BY E.SAL DESC) AS RANKS FROM EMP E JOIN DEPT D ON 
    E.DEPTNO=D.DEPTNO)
    WHERE RANKS=2;
    
    SELECT * FROM (SELECT ENAME,SAL,DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANKS FROM EMP) 
    WHERE RANKS=2;
    

--4️⃣ Departments Without Any Employees
--Find all departments that have no employees assigned to them.
--Output: DEPTNO, DNAME, LOC
    SELECT D.DEPTNO,D.DNAME,D.LOC FROM DEPT D LEFT JOIN EMP E ON D.DEPTNO=E.DEPTNO
    WHERE E.DEPTNO IS NULL;


5️⃣ Employees with the Same Salary as Someone Else
Find employees who earn the same salary as at least one other employee.
    SELECT E1.EMPNO, E1.ENAME, E1.SAL 
FROM EMP E1
JOIN EMP E2 ON E1.SAL = E2.SAL AND E1.EMPNO <> E2.EMPNO
ORDER BY E1.SAL;

SELECT * FROM EMP WHERE SAL in(SELECT SAL FROM EMP group by sal having COUNT(*)>1)order by sal;


--6️⃣ Employees in the Top 3 Salaries of the Company
--Find employees who are in the top 3 highest salaries in the entire company.
--Output: EMPNO, ENAME, SAL, RANK
    SELECT * FROM(SELECT EMPNO,ENAME,SAL,DENSE_RANK() OVER(ORDER BY SAL DESC) AS RANKS FROM EMP) WHERE RANKS<=3;


7️⃣ Department-wise Salary Ranking
Rank employees within their own department based on salary (highest first).

Output: DEPTNO, EMPNO, ENAME, SAL, RANK_IN_DEPT

    SELECT * FROM (SELECT DEPTNO,EMPNO,ENAME,SAL,DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANKS FROM EMP)
    WHERE RANKS<=3;
    
--8️⃣ Total Salary for Each Department and Overall Company
--Find the total salary paid in each department along with the company's total salary.
--Output: DEPTNO, DNAME, TOTAL_SALARY + an extra row for Overall_Total_Salary
    SELECT D.DEPTNO,D.DNAME,SUM(SAL) AS TOTAL_SALARY FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO GROUP BY D.DEPTNO,D.DNAME
    UNION ALL
    SELECT NULL AS DEPTNO,'Overall_Total_Salary' AS DNAME, SUM(SAL) AS TOTAL_SALARY
FROM EMP;

9️⃣ Employees Not in Salary Grade Table
Find employees whose salary does not fit into any salary grade range from SALGRADE.

SELECT E.EMPNO, E.ENAME, E.SAL
FROM EMP E
LEFT JOIN SALGRADE S 
ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE S.GRADE IS NULL;

Output: EMPNO, ENAME, SAL
🔟 Most Recent Hired Employee in Each Job Role
Find the most recently hired employee for each job type.

SELECT * FROM(SELECT EMPNO,ENAME,HIREDATE,RANK() OVER(PARTITION BY JOB ORDER BY HIREDATE DESC)AS RANKS FROM EMP)
WHERE RANKS=1;


