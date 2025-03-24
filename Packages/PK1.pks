----Simple Package with Procedures
---A package that contains two procedures that print messages.

CREATE OR REPLACE PACKAGE PK1 AS
    PROCEDURE SP1;
    PROCEDURE SP2;
END PK1;
/

--================
---PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY PK1
IS
    PROCEDURE SP1
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('MY NAME IS PROCEDURE1');
    END SP1;
    
    PROCEDURE SP2
    IS
    BEGIN
    DBMS_OUTPUT.PUT_LINE('MY NAME IS PROCEDURE2');
    END SP2;
END PK1;

----================
EXEC PK1.SP1;
EXEC PK1.SP2;
