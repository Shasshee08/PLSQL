💡 Medium Level:
1️⃣ Write a query to find the second highest salary in an employee table.
    SELECT ENAME,SAL,DENSE_RANK() OVER (ORDER BY SAL DESC) AS RANKS FROM EMP2;

2️⃣ Fetch all employees whose names contain the letter “a” exactly twice.
    SELECT * FROM EMP2 WHERE ENAME LIKE '%A%';
    
    SELECT * 
    FROM EMP2 
    WHERE LENGTH(ENAME) - LENGTH(REPLACE(UPPER(ENAME), 'A', '')) = 2;

3️⃣ How do you retrieve only duplicate records from a table?
    SELECT JOB FROM EMP2
    GROUP BY JOB
    HAVING COUNT(*)>1;

4️⃣ Write a query to calculate the running total of SALARY by date.
    SELECT SAL,SUM(SAL) OVER(ORDER BY HIREDATE)AS RUNNING_SAL FROM EMP2;

5️⃣ Find employees who earn more than the average salary in their department.
    SELECT ENAME,SAL,DEPTNO FROM EMP2 E WHERE SAL>
    (SELECT AVG(SAL) FROM EMP2 WHERE DEPTNO=E.DEPTNO)
    ORDER BY DEPTNO;
    
    SELECT DEPTNO,AVG(SAL) FROM EMP2 GROUP BY DEPTNO;

6️⃣ Write a query to find the most frequently occurring value in a column.
7️⃣ Fetch records where the date is within the last 7 days from today.

8️⃣ Write a query to count how many employees share the same salary.
    SELECT SAL,COUNT(*) AS EMP_COUNT  FROM EMP2 
    GROUP BY SAL
    HAVING COUNT(*)>1;

9️⃣ How do you fetch the top 3 records for each group in a table?
    SELECT * FROM EMP WHERE ROWNUM<=3;
    
    SELECT ENAME,DEPTNO,SAL FROM(SELECT ENAME,DEPTNO,SAL,DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) AS RANKS FROM EMP2)
    WHERE RANKS<=3 ORDER BY DEPTNO,RANKS;

🔟 Retrieve products that were never sold (hint: use LEFT JOIN).

💡 Challenging Level:
1️⃣ Retrieve customers who made their first purchase in the last 6 months.
2️⃣ How do you pivot a table to convert rows into columns?
3️⃣ Write a query to calculate the percentage change in sales month-over-month.
4️⃣ Find the median salary of employees in a table.
5️⃣ Fetch all users who logged in consecutively for 3 days or more.
6️⃣ Write a query to delete duplicate rows while keeping one occurrence.
7️⃣ Create a query to calculate the ratio of sales between two categories.
8️⃣ How would you implement a recursive query to generate a hierarchical structure?
9️⃣ Write a query to find gaps in sequential numbering within a table.
🔟 Split a comma-separated string into individual rows using SQL.

💡 Advanced Problem-Solving:
1️⃣ Rank products by sales in descending order for each region.
2️⃣ Fetch all employees whose salaries fall within the top 10% of their department.
3️⃣ Identify orders placed during business hours (e.g., 9 AM to 6 PM).
4️⃣ Write a query to get the count of users active on both weekdays and weekends.
5️⃣ Retrieve customers who made purchases across at least three different categories.