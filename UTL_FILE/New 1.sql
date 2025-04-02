DECLARE
    FILE_HANDLE UTL_FILE.FILE_TYPE;
BEGIN
    FILE_HANDLE :=UTL_FILE.FOPEN('MY_DIR' , 'TEST_FILE1.TXT', 'W');
    
    UTL_FILE.PUT_LINE(file_handle, 'This is the first line.');
    UTL_FILE.PUT_LINE(file_handle, 'This is the second line.');
    UTL_FILE.PUT_LINE(file_handle, 'This is the third line.');
    
    UTL_FILE.FCLOSE(FILE_HANDLE);
    DBMS_OUTPUT.PUT_LINE('File written successfully.');
    END;
    /