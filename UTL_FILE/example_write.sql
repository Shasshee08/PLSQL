DECLARE
    file_handle UTL_FILE.FILE_TYPE;
BEGIN
    -- Open the file in append mode
    file_handle := UTL_FILE.FOPEN('MY_DIR', 'example_write.txt', 'A');

    -- Append a new line to the file
    UTL_FILE.PUT_LINE(file_handle, 'Appending this line.');

    -- Close the file
    UTL_FILE.FCLOSE(file_handle);
END;
/
