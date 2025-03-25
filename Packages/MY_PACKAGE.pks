CREATE OR REPLACE PACKAGE MY_PACKAGE AS
/******************************************************************************
   NAME:       MY_PACKAGE
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        25/03/2025      Shasshee       1. Created this package.
******************************************************************************/

  FUNCTION ADD_NUMBERS(X NUMBER,Y NUMBER) RETURN NUMBER;
  PROCEDURE SAY_HELLO;

END MY_PACKAGE;

/
---===========

CREATE OR REPLACE PACKAGE BODY MY_PACKAGE AS
/******************************************************************************
   NAME:       MY_PACKAGE
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        25/03/2025      Shasshee       1. Created this package body.
******************************************************************************/

 FUNCTION ADD_NUMBERS(X NUMBER,Y NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN X+Y;
  END;

  PROCEDURE SAY_HELLO IS 
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello from the package!');
  END;

END MY_PACKAGE;

/

---========
EXEC MY_PACKAGE.SAY_HELLO;

SELECT MY_PACKAGE.ADD_NUMBERS(10,11) FROM DUAL;