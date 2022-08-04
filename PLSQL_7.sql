REM   Script: PLSQL_Intoduction
REM   Day1

DECLARE 
    x integer := 10; 
BEGIN 
    DBMS_OUTPUT.PUT_LINE('The value of x is :'|| x); 
END; 
/

DECLARE 
    x integer := 10; 
    y integer := 20; 
    z integer; 
    d real; 
BEGIN 
    z := x + y; 
    dbms_output.put_line('Sum of 10 and 20 is :' || z); 
     
    d := x/y; 
    dbms_output.put_line('Divison of 10 and 20 is :' || d); 
END; 
/

DECLARE 
    x number(2) := 10; 
BEGIN 
 
    IF ( x < 100 ) THEN 
        dbms_output.put_line('X is less than 100'); 
    ELSE 
        dbms_output.put_line('x is :'||x); 
    END IF 
END; 
/

DECLARE 
    x number(2) := 10; 
BEGIN 
 
    IF ( x < 100 ) THEN 
        dbms_output.put_line('X is less than 100'); 
    ELSE 
        dbms_output.put_line('x is :'||x); 
    END IF; 
END; 
/

DECLARE 
    x number(4) := 1000; 
BEGIN 
 
    IF ( x < 100 ) THEN 
        dbms_output.put_line('X is less than 100'); 
    ELSE 
        dbms_output.put_line('x is :'||x); 
    END IF; 
END; 
/

DECLARE 
    x number(4) := 1000; 
BEGIN 
 
    IF ( x < 100 ) THEN 
        dbms_output.put_line('X is less than 100'); 
    ELSIF (x < 1000) THEN 
        dbms_output.put_line('X is greater than 100 but less than 1000'); 
    ELSE 
        dbms_output.put_line('x is :'||x); 
    END IF; 
END; 
/

DECLARE 
    x number(4) := 100; 
BEGIN 
 
    IF ( x < 100 ) THEN 
        dbms_output.put_line('X is less than 100'); 
    ELSIF (x < 1000) THEN 
        dbms_output.put_line('X is greater than or equal to 100 but less than 1000'); 
    ELSE 
        dbms_output.put_line('x is :'||x); 
    END IF; 
END; 
/

DECLARE 
    x number(4) := 10; 
BEGIN 
 
    IF ( x < 100 ) THEN 
        dbms_output.put_line('X is less than 100'); 
    ELSIF (x < 1000) THEN 
        dbms_output.put_line('X is greater than or equal to 100 but less than 1000'); 
    ELSE 
        dbms_output.put_line('x is :'||x); 
    END IF; 
END; 
/

DECLARE 
    x number(4) := 1000; 
BEGIN 
 
    IF ( x < 100 ) THEN 
        dbms_output.put_line('X is less than 100'); 
    ELSIF (x < 1000) THEN 
        dbms_output.put_line('X is greater than or equal to 100 but less than 1000'); 
    ELSIF ( x==1000) THEN 
        dbms_output.put_line('It is thousand'); 
    ELSE 
        dbms_output.put_line('x is :'||x); 
    END IF; 
END; 
/

DECLARE 
    x number(4) := 1000; 
BEGIN 
 
    IF ( x < 100 ) THEN 
        dbms_output.put_line('X is less than 100'); 
    ELSIF (x < 1000) THEN 
        dbms_output.put_line('X is greater than or equal to 100 but less than 1000'); 
    ELSIF ( x=1000) THEN 
        dbms_output.put_line('It is thousand'); 
    ELSE 
        dbms_output.put_line('x is :'||x); 
    END IF; 
END; 
/

DECLARE 
    x number := 10; 
BEGIN 
    LOOP 
        dbms_output.put_line(x); 
        x := x - 1; 
         
        IF x < 1 THEN 
            exit; 
    END LOOP; 
END; 
/

DECLARE 
    x number := 10; 
BEGIN 
    LOOP 
        dbms_output.put_line(x); 
        x := x - 1; 
         
        IF x < 1 THEN 
            exit; 
        END IF; 
    END LOOP; 
END; 
/

DECLARE 
    x number := 10; 
BEGIN 
    WHILE x > 0 LOOP 
        dbms_output.put_line(x); 
        x := x - 1; 
    END LOOP; 
END; 
/

DECLARE 
    x number; 
BEGIN 
    FOR x IN 1 .. 10 LOOP 
        dbms_output.put_line(x); 
    END LOOP; 
END; 
/

