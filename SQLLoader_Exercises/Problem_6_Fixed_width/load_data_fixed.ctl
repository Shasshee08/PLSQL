LOAD DATA
INFILE 'employees_fixed.txt'
INTO TABLE EMP_FIXED
(
    EMPNO      POSITION(01:05) INTEGER EXTERNAL,
    FIRST_NAME POSITION(06:15) CHAR,
    LAST_NAME  POSITION(16:25) CHAR,
    SALARY     POSITION(26:35) INTEGER EXTERNAL
)
