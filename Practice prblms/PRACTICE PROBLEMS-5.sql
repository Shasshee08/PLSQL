--Basic Queries (Company Insights & Simple Conditions):
--1️⃣ Retrieve the name and salary of employees who have a commission (COMM is NOT NULL) but earn less than 2000.
    SELECT ENAME,SAL,COMM FROM EMP2 WHERE COMM IS NOT NULL AND SAL<2000;
       
--2️⃣ Find employees who joined in the same year as at least one other employee.
    SELECT EXTRACT(YEAR FROM HIREDATE) AS HIRE_YEAR, COUNT(*)  
FROM EMP2  
GROUP BY EXTRACT(YEAR FROM HIREDATE)  
HAVING COUNT(*) > 1;

        
--3️⃣ List employees whose names start and end with the same letter.
    SELECT * FROM EMP WHERE 
    SUBSTR(ENAME,1,1)=SUBSTR(ENAME,-1,1);
    
--4️⃣ Find employees whose salary is a multiple of 500.
    SELECT * FROM EMP WHERE MOD(SAL,500)=0;
    
--5️⃣ Retrieve the top 3 highest-paid employees in the company.
    SELECT * FROM(SELECT ENAME,SAL,DENSE_RANK() OVER (ORDER BY SAL DESC) AS RANKS FROM EMP2) WHERE RANKS<=3;
    
--Intermediate Queries (Joins, Subqueries, and Aggregation):
--6️⃣ Display departments that have more than 3 employees.
    SELECT D.DNAME,COUNT(*) FROM EMP2 E JOIN DEPT2 D ON E.DEPTNO=D.DEPTNO GROUP BY DNAME HAVING COUNT(*)>3;

--7️⃣ Show the average salary of employees in each job role (JOB), but only for job roles that have at least 2 employees.
--
--8️⃣ Find the department(s) with the lowest total salary expense.
--
--9️⃣ List the employees who earn more than their manager (compare SAL with their manager's salary using MGR).
--
--🔟 Retrieve the employees who work in the same department as "ALLEN" but are not "ALLEN" himself.
--
--Adv);anced Queries (Nested Queries, Ranking, and Performance-Based Queries):
--1️⃣1️⃣ Find the third lowest salary in the company without using LIMIT or FETCH FIRST.
--
--1️⃣2️⃣ Identify employees who earn a salary within the range of the highest-paid employee’s salary in each department.
--
--1️⃣3️⃣ Display all employees who have at least two colleagues with the same job title.
--
--1️⃣4️⃣ Retrieve employees who have been working for more than twice the average experience of all employees (calculate experience based on HIREDATE).
--
----1️⃣5️⃣ Rank employees within each department based on salary and display those who are ranked second in their department.