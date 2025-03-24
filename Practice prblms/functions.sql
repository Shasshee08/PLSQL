select * from dual;

desc dual;

ABS():
=====
--	- to convert (-ve) sign values into (+ve) sign values.
select abs(-12) from dual;

select abs(-112) from dual;

waq to display ENAME,SALARY,COMMISSION and COMMISSION-SALARY from emp table?
    select ename,sal,comm,abs(comm-sal)as result from emp;
    
CEIL():
======
	- it return a value which is greater than to (or) is equals to the given expression.
    
    select ceil(9.0) from dual;
    
    select ceil(9.1) from dual;
    
    SELECT ENAME,SAL,CEIL(SAL*0.05) AS RESULT FROM EMP;
    
  FLOOR():
========
	- it return a value which is less than to (or) is equals to the given expression.
    
    select floor(9.8) from dual;
    
    select floor(9.0) from dual;
    
    SELECT ENAME,FLOOR(SAL*0.05) AS RESULT FROM EMP;
    
    MOD():
======
	- it return the remainder value of the expression.
    
    select mod(2,3) from dual;
    
    select * from emp where mod(empno,2)=1;
    
      select * from emp where mod(empno,2)=0;
      
 POWER():
========
	- it return the power of the given expression.
    
    select power(2,3) from dual;
    
    select power(5,3) from dual;
    
ROUND():
========
	- it return the nearest value of the given expression based on 0.5 value.
		> if an expression is having less than 0.5 then it return------> 0
		> if an expression is having greater than or is equals to 0.5 then it return-----> 1

    select round(56.8) from dual;

    select round(56.470,1) from dual;  
    
TRUNC():
========
	- it return an exact value from the given expression.
	- it does not depends on 0.5 value.
syntax:
======
	trunc(expression[,decimal places])
    
    select trunc(56.6) from dual;
    
--character / string functions    

LENGTH():
=========
	- it return the length of the given string.
    
    select ename,length(ename) from emp;
    
    select * from emp where length(ename)=6;
    
 LOWER():
========
	- to convert upper case characters into lower case characters.
syntax:
======
	lower(string)
    
    select ename,lower(ename) from emp;
    
    select lower('SHASHI') from dual;
    
 UPPER():
=======
	- to convert lower case characters into upper case characters.
    
    select upper(ename) from emp;
    
INITCAP():
=========
	- to make an initial character is capital from the given string.
    
    select ename,initcap(ename) from emp;
    
    select initcap('shashi') from dual;
CONCAT():
=========
	- to add two string expressions.
    
    select concat('shashi','kiran') from dual;
    
    SELECT ENAME,CONCAT('Mr./Mis.',ENAME) FROM EMP;
    
LTRIM():
=======
	- it remove unwanted characters from the given string on left side.
syntax:
=======
	ltrim(string,'<trimming character>')
    
    select ltrim('   hello') from emp;
    
    select ltrim('xxxxhello','x') from dual;
    
    SELECT LTRIM('XYZXYZXYZHELLO','XYZ') FROM DUAL;
    
RTRIM():
========
	- it remove unwanted characters from the given string on right side.
syntax:
=======
	rtrim(string,'<trimming character>')
    
    select rtrim('helloxxx','x') from dual;
    
    select rtrim('helllo   ') from dual;
    
    TRIM():
======
	- it remove unwanted characters from both sides of the given string.
syntax:
=======
	trim('trimming character' from STRING)
    
    select trim('x' from 'xxshashixx') from dual;
    
    select trim('xy' from 'xyshashixy') from dual;
    
REPLACE():
=========
	- to replace string to string / string to character / character to string.
    
    select replace('jack and jlue', 'j','b') from dual;\
    
    SELECT REPLACE('HELLO','ELL','D') FROM DUAL;
    
    select replace('hello','ello','xyz') from dual;
    
TRANSLATE():
============
	- to translate each character by character.    
    
    select translate('hello','elo','xyz') from dual;
    
    select translate('hello','elo','ab') from dual;
    
 LPAD():
======
	- filling the specified character on the left side of the given string if string
length is less than to user defined length.

syntax:
======
	lpad(string,<user defined length>,'<specified character>')
    
    select lpad('hello',2) from dual;
    
    select lpad('hello',10,'a') from dual;
    
RPAD():
======
	- filling the specified character on the right side of the given string if string
length is less than to user defined length.

    SELECT RPAD('HELLO',10,'@') FROM DUAL;
    
 SUBSTR():
=========
	- it return the required substring from the given string expression.

    SELECT SUBSTR('WELCOME',1,5) FROM DUAL;
    
     SELECT SUBSTR('WELCOME',-5,2) FROM DUAL;
   
INSTR():
=======
	- to find out the occurrence position of the specified character.
    
    SELECT INSTR('HELLOWORLD','L') FROM DUAL;
    
    SELECT INSTR('WELCOME HELLO','L',-1,2) FROM DUAL;
    
DATE FUNCTIONS:
================
SYSDATE:
=========
	- it return the current date information of the system.
    
    SELECT SYSDATE FROM DUAL;
    
    SELECT SYSDATE+5 FROM DUAL;
    
ADD_MONTHS():
==============
	- to add / subtract no.of months from / to the given date expression.
    
    SELECT ADD_MONTHS(SYSDATE,-3) FROM DUAL;
    
    CREATE TABLE PRODUCT(PCODE NUMBER(4),PNAME VARCHAR2(10),MFG_DATE DATE,EXP_DATE DATE);

 INSERT INTO PRODUCT(PCODE,PNAME,MFG_DATE)VALUES(1021,'P1','02-MAR-2021');
 INSERT INTO PRODUCT(PCODE,PNAME,MFG_DATE)VALUES(1022,'P2','19-DEC-2024');
 COMMIT;
 
 SELECT * FROM PRODUCT;
 
 UPDATE PRODUCT SET EXP_DATE=ADD_MONTHS(MFG_DATE,13);
 
 LAST_DAY():
===========
	- it return the last day of the month in the given date expression.
syntax:
=======
	last_day(date)
    
    SELECT LAST_DAY(SYSDATE) FROM DUAL;
    
    MONTHS_BETWEEN():
===================
	- it return no.of months in between the given two dates.
    
    SELECT MONTHS_BETWEEN(SYSDATE,'01-JAN-2023') FROM DUAL;
    
    
CONVERSION FUNCTIONS:
I) TO_CHAR()
	II) TO_DATE()

I) TO_CHAR():
===========
	- to convert date type to character(string) type and also display date in different 
formats.

    SELECT TO_CHAR(SYSDATE,'YYYY YY YEAR CC') FROM DUAL;
    
    SELECT TO_CHAR(SYSDATE, 'MONTH MON MM') FROM DUAL;
    
    SELECT TO_CHAR(SYSDATE, 'D DD DDD DY DAY') FROM DUAL;
    
    SELECT TO_CHAR(SYSDATE,'Q') FROM DUAL;
    
    SELECT TO_CHAR(SYSDATE, 'W WW') FROM DUAL;
    
    SELECT TO_CHAR(SYSDATE, 'HH HH24 MM SS PM')FROM DUAL;
    
  waq to display employees who are joined in 1981 by using to_char()?
  SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY')=1981;
  
  waq to display employees who are joined in 1980,1982,1983 by using to_char()?
  SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY')IN(1981,1982,1983);
  
  waq to display employees who are joined in the month of "DECEMBER" by using to_char()?
  select * from emp where to_char(hiredate,'mon')='dec';
  
  waq to display employees who are joined in the month of "DECEMBER" in 1982 by using to_char()?
  select * from emp where to_char(hiredate,'mon-yy')='dec-82';
  
  waq to display employees joined day?
  select ename,hiredate,to_char(hiredate,'day') as join_day from emp;
  
  waq to display employees who are joined on weekends?
  select * from emp where to_char(hiredate,'dy')in('sat','sun');
  
  
  II) TO_DATE():
============
	- to convert string type to oracle default date format type.
    
    select to_date('21/02/25')+10 from dual;
    
    
 ii) Multiple row functions:
=====================
	- these functions are also called as "grouping functions / aggregative functions" in 
database

SUM():
======
	- it return total value
    
    select sum(sal) from emp where job='manager';
    
    select sum(sal) from emp;
    
AVG():
=====
	- it return average value.

EX:
    SELECT AVG(SAL) FROM EMP;
    SELECT AVG(SAL) FROM EMP WHERE JOB='MANAGER';

MIN():
====
	- it return minimum value.

EX:
    SELECT MIN(SAL) FROM EMP;
    SELECT MIN(HIREDATE) FROM EMP WHERE DEPTNO=20;

MAX():
=====
	- it return maximum value.

EX:
     SELECT MAX(SAL) FROM EMP;

COUNT():
========
	- it again three types.

i) count(*):
=========
	- counting all rows including duplicates and nulls in the table.
EX:
     SELECT COUNT(*) FROM EMP;-----------> 14

ii) count(column name):
====================
	- counting all values including duplicate values but not nulls from a column.

EX:
     SELECT COUNT(MGR) FROM EMP;-------> 13

iii) count(distinct <column name>):
==============================
	- counting unique values from a column only.(i.e no duplicates & no nulls)

EX:
      SELECT COUNT(DISTINCT MGR) FROM EMP;------> 6    
      
      
  