--Prevent deleting a department from DEPT if there are employees in that department.
CREATE OR REPLACE TRIGGER prevent_dept_deletion
BEFORE DELETE ON DEPT_LARGE
FOR EACH ROW
DECLARE
    emp_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO emp_count FROM EMP_LARGE WHERE DEPTNO = :OLD.DEPTNO;
    IF emp_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Cannot delete department with employees');
    END IF;
END;


--================
DELETE FROM DEPT_LARGE WHERE DEPTNO=10;

select * from user_triggers;