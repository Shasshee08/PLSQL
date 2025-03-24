how to view list of tables in oracle?
    
desc user_tables;

SELECT TABLE_NAME FROM USER_TABLES;

emp sal grade ?
select e.ename,e.sal,s.grade from emp2 e, salgrade2 s where
e.sal between s.losal and s.hisal;

select e.ename,e.sal,s.grade from emp2 e  inner join salgrade2 s on
e.sal between s.losal and s.hisal;

OUTER JOINS
--LEFT OUTER JOIN
    SELECT E.ENAME,D.DNAME FROM EMP E LEFT OUTER JOIN DEPT2 D
    ON E.DEPTNO=D.DEPTNO;
    
    SELECT D.DNAME,E.ENAME FROM DEPT2 D LEFT OUTER JOIN EMP2 E
    ON D.DEPTNO=E.DEPTNO;


select * from emp2;

select * from dept2;