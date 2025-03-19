CREATE OR REPLACE FUNCTION GET_BONUS(EMP_ID NUMBER)
RETURN NUMBER
IS
    EMP_SAL NUMBER;
    BONUS NUMBER;
BEGIN
    SELECT SAL INTO EMP_SAL FROM EMP_LARGE WHERE EMPNO=EMP_ID;
    
    BONUS := EMP_SAL*0.10;
    RETURN BONUS;
END;

SELECT GET_BONUS(1234) FROM DUAL;


---====================
CREATE OR REPLACE FUNCTION CALCULATE_TAX(SAL NUMBER,TAX_RATE NUMBER)
 RETURN NUMBER
  IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       CALCULATE_TAX
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        19/03/2025   Shasshee       1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     CALCULATE_TAX
      Sysdate:         19/03/2025
      Date and Time:   19/03/2025, 11:51:46, and 19/03/2025 11:51:46
      Username:        Shasshee (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
   tmpVar := SAL *(TAX_RATE/100);
   RETURN tmpVar;
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END CALCULATE_TAX;
/

SELECT CALCULATE_TAX(5000,12) FROM DUAL;

--================================
