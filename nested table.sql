DECLARE
    TYPE MY_NESTED_TABLE IS TABLE OF NUMBER;
    VAR_NT MY_NESTED_TABLE := MY_NESTED_TABLE(1,2,3,4,5,6,7,8,9);
    BEGIN
        FOR I IN 1..VAR_NT.COUNT
        LOOP
        DBMS_OUTPUT.PUT_LINE('VALUE STORED AT INDEX '||I||' IS '||VAR_NT(I));
        END LOOP;
    END;
    /
    
    ---====================
    
    DECLARE
    TYPE MY_NESTED_TABLE IS TABLE OF NUMBER;
    VAR_NT MY_NESTED_TABLE := MY_NESTED_TABLE(9,8,7,6,5,4,3,2,1);
    BEGIN
        DBMS_OUTPUT.PUT_LINE('VALUE OF INDEX IS: '||VAR_NT(1));
        end;
        /
        
        ---================
        DECLARE  
  -- Associative array indexed by string:  
   
  TYPE population IS TABLE OF NUMBER   
    INDEX BY VARCHAR2(64);  
  
  city_population  population;  
  i                VARCHAR2(64);   
  
BEGIN  
  -- Add elements (key-value pairs) to associative array:  
  
  city_population('Smallville')  := 2000;  
  city_population('Midland')     := 750000;  
  city_population('Megalopolis') := 1000000;  
  
  -- Change value associated with key 'Smallville':  
  
  city_population('Smallville') := 2001;  
  
  -- Print associative array:  
  
  i := city_population.FIRST;  -- Get first element of array  
   
  WHILE i IS NOT NULL LOOP   
    DBMS_Output.PUT_LINE  
      ('Population of ' || i || ' is ' || city_population(i));   
    i := city_population.NEXT(i);  -- Get next element of array   
  END LOOP;  
END; 