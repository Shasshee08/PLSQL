DECLARE
    file_handle  UTL_FILE.FILE_TYPE;
    line_content VARCHAR2(32767);
BEGIN
    -- Open the file in read mode
    file_handle := UTL_FILE.FOPEN('MY_DIR', 'example_write.txt', 'R');

    -- Loop through the file until all lines are read
    LOOP
        BEGIN
            UTL_FILE.GET_LINE(file_handle, line_content);
            -- Process the line as needed
            DBMS_OUTPUT.PUT_LINE(line_content);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                -- End of file reached
                EXIT;
        END;
    END LOOP;

    -- Close the file
    UTL_FILE.FCLOSE(file_handle);
END;
/

SET SERVEROUTPUT ON;
