DECLARE
    file_handle UTL_FILE.FILE_TYPE;
    line_content VARCHAR2(4000);
BEGIN
    -- Open file in read mode
    file_handle := UTL_FILE.FOPEN('MY_DIR', 'test_file.txt', 'R');

    -- Read one line
    UTL_FILE.GET_LINE(file_handle, line_content);
    DBMS_OUTPUT.PUT_LINE('Read Line: ' || line_content);

    -- Close file
    UTL_FILE.FCLOSE(file_handle);
END;
/
