REM   Script: PLSQLPROCEDURE
REM   PROCEDURE

DECLARE 
    x integer := 10; 
BEGIN 
    LOOP 
    dbms_output.put_line('The value of x is :'  || x); 
    x := x - 1; 
     
    IF x < 1 THEN 
        exit; 
    END IF; 
     
    END LOOP; 
     
    -- After exit the loop , print the value of x 
    dbms_output.put_line('The value of x at end is :'  || x); 
END; 
/

DECLARE 
    x integer := 10; 
BEGIN 
    LOOP 
    dbms_output.put_line('The value of x is :'  || x || ' Continue processing' ); 
    x := x - 1; 
     
    IF x < 1 THEN 
        exit; 
    END IF; 
     
    END LOOP; 
     
    -- After exit the loop , print the value of x 
    dbms_output.put_line('The value of x at end is :'  || x); 
END; 
/

DECLARE 
    x integer := 10; 
BEGIN 
    WHILE x > 0 LOOP 
    dbms_output.put_line('The value of x is :'  || x); 
    x := x - 1; 
    END LOOP; 
     
    -- After exit the loop , print the value of x 
    dbms_output.put_line('The value of x at end is :'  || x); 
END; 
/

DECLARE 
  type namesarray IS VARRAY(5) OF VARCHAR2(100); 
  type agearray IS VARAAY(5) OF INTEGER; 
  names namesarray; 
  age agearray; 
  total INTEGER; 
BEGIN 
    names := namesarray('Bala','Dinesh','Fintan','Ganesh','Kirti'); 
    age := agearray(40,45,36,50,30); 
    total := names.count; 
    FOR i in 1 .. total LOOP 
        dbms_output.put_line('Student: ' || names(i)  || ' and his age is : '|| age(i) ); 
    END LOOP; 
END; 
/

DECLARE 
  type namesarray IS VARRAY(5) OF VARCHAR2(100); 
  type agearray IS VARRAY(5) OF INTEGER; 
  names namesarray; 
  age agearray; 
  total INTEGER; 
BEGIN 
    names := namesarray('Bala','Dinesh','Fintan','Ganesh','Kirti'); 
    age := agearray(40,45,36,50,30); 
    total := names.count; 
    FOR i in 1 .. total LOOP 
        dbms_output.put_line('Student: ' || names(i)  || ' and his age is : '|| age(i) ); 
    END LOOP; 
END; 
/

DECLARE 
  type namesarray IS VARRAY(5) OF VARCHAR2(100); 
  type agearray IS VARRAY(5) OF INTEGER; 
  names namesarray; 
  age agearray; 
  total INTEGER; 
BEGIN 
    names := namesarray('Bala','Dinesh','Fintan','Ganesh'); 
    age := agearray(40,45,36,50); 
    total := names.count; 
    FOR i in 1 .. total LOOP 
        dbms_output.put_line('Student: ' || names(i)  || ' and his age is : '|| age(i) ); 
    END LOOP; 
END; 
/

DECLARE 
  type namesarray IS VARRAY(5) OF VARCHAR2(100); 
  type agearray IS VARRAY(5) OF INTEGER; 
  names namesarray; 
  age agearray; 
  total INTEGER; 
BEGIN 
    names := namesarray('Bala','Dinesh','Fintan','Ganesh','kirti'); 
    age := agearray(40,45,36,50); 
    total := names.count; 
    FOR i in 1 .. total LOOP 
        dbms_output.put_line('Student: ' || names(i)  || ' and his age is : '|| age(i) ); 
    END LOOP; 
END; 
/

DECLARE 
  type namesarray IS VARRAY(5) OF VARCHAR2(100); 
  type agearray IS VARRAY(5) OF INTEGER; 
  names namesarray; 
  age agearray; 
  total INTEGER; 
BEGIN 
    names := namesarray('Bala','Dinesh','Fintan','Ganesh','kirti'); 
    age := agearray(40,45,36,50,30); 
    total := names.count; 
    FOR i in 1 .. total LOOP 
        dbms_output.put_line('Student: ' || names(i)  || ' and his age is : '|| age(i) ); 
    END LOOP; 
END; 
/

CREATE OR REPLACE PROCEDURE welcome 
AS 
BEGIN 
    dbms_putput.put_line('Welcome to Data Analytics World!'); 
END; 
/

CREATE OR REPLACE PROCEDURE welcome 
AS 
BEGIN 
    dbms_output.put_line('Welcome to Data Analytics World!'); 
END; 
/

EXECUTE welcome


BEGIN 
    dbms_output.put_line('Calling welcome procedure'); 
    welcome 
END; 
/

BEGIN 
    dbms_output.put_line('Calling welcome procedure'); 
    welcome; 
END; 
/

EXECUTE welcome


CREATE OR REPLACE PROCEDURE welcome 
AS 
BEGIN 
    dbms_output.put_line('Welcome to Data Analytics World - By ExcelR'); 
END; 
/

EXECUTE welcome


DROP PROCEDURE welcome;

EXECUTE welcome


CREATE TABLE CUSTOMER( 
custid INTEGER, 
custname VARCHAR2(100), 
gender CHAR(1), 
city VARCHAR2(100) 
);

INSERT INTO CUSTOMER VALUES(1001,'Ramkumar','M','Chennai'),(1002,'Balamurugan','M','Bangalore'),(1003,'Vignesh','M','Hyderabad'), 
(1004,'Durga','F','Pune'),(1005,'Sakshi','F','Delhi');

INSERT INTO CUSTOMER VALUES(1001,'Ramkumar','M','Chennai');

INSERT INTO CUSTOMER VALUES(1002,'Balamurugan','M','Bangalore');

INSERT INTO CUSTOMER VALUES(1003,'Vignesh','M','Hyderabad');

INSERT INTO CUSTOMER VALUES(1004,'Durga','F','Pune');

INSERT INTO CUSTOMER VALUES(1005,'Sakshi','F','Delhi');

SELECT * FROM CUSTOMER;

 DECLARE 
    a INTEGER; 
    b INTEGER; 
    c INTEGER; 
    PROCEDURE findMax(x IN integer, y IN integer , z OUT integer) IS 
    BEGIN 
        IF x > y THEN 
            z := x; 
        ELSE 
            z := y; 
        END IF 
   END; 
   BEGIN 
    a := 10; 
    b := 20; 
    findMax(a,b,c); 
    dbms_output.put_line('Max value from 10,20 is :' || c); 
   END; 
/

   /


  DECLARE 
    a INTEGER; 
    b INTEGER; 
    c INTEGER; 
    PROCEDURE findMax(x IN integer, y IN integer , z OUT integer) IS 
    BEGIN 
        IF x > y THEN 
            z := x; 
        ELSE 
            z := y; 
        END IF; 
   END; 
   BEGIN 
    a := 10; 
    b := 20; 
    findMax(a,b,c); 
    dbms_output.put_line('Max value from 10,20 is :' || c); 
   END; 
/

   /


  DECLARE 
    a INTEGER; 
    b INTEGER; 
    c INTEGER; 
    PROCEDURE findMax(x IN integer, y IN integer , z OUT integer) IS 
    BEGIN 
        IF x > y THEN 
            z := x; 
        ELSE 
            z := y; 
        END IF; 
   END; 
   BEGIN 
    a := 100; 
    b := 20; 
    findMax(a,b,c); 
    dbms_output.put_line('Max value from 100,20 is :' || c); 
   END; 
/

   /


  DECLARE 
    a INTEGER; 
    b INTEGER; 
    c INTEGER; 
    PROCEDURE findMax(x IN integer, y IN integer , z OUT integer) IS 
    BEGIN 
        IF x > y THEN 
            z := x; 
        ELSIF x = y THEN 
            z : x; 
        ELSE 
            z := y; 
        END IF; 
   END; 
   BEGIN 
    a := 200; 
    b := 200; 
    findMax(a,b,c); 
    dbms_output.put_line('Max value from 100,200 is :' || c); 
   END; 

/

  DECLARE 
    a INTEGER; 
    b INTEGER; 
    c INTEGER; 
    PROCEDURE findMax(x IN integer, y IN integer , z OUT integer) IS 
    BEGIN 
        IF x > y THEN 
            z := x; 
        ELSIF x = y THEN 
            z := x; 
        ELSE 
            z := y; 
        END IF; 
   END; 
   BEGIN 
    a := 200; 
    b := 200; 
    findMax(a,b,c); 
    dbms_output.put_line('Max value from 100,200 is :' || c); 
   END; 

/

  DECLARE 
    a INTEGER; 
    b INTEGER; 
    c INTEGER; 
    PROCEDURE findMax(x IN integer, y IN integer , z OUT integer) IS 
    BEGIN 
        IF x > y THEN 
            z := x; 
        ELSIF x = y THEN 
            z := x; 
        ELSE 
            z := y; 
        END IF; 
   END; 
   BEGIN 
    a := 200; 
    b := 200; 
    findMax(a,b,c); 
    dbms_output.put_line('Max value from 200,200 is :' || c); 
   END; 

/

DECLARE 
    a number; 
    PROCEDURE squareNumber(x IN OUT number) IS 
    BEGIN 
        x := x * x; 
    END; 
    BEGIN 
        a := 10; 
        squareNumber(a); 
        dbms_output.put_line('Square of 10 is: '|| a); 
    END; 
/

    / 


DECLARE 
    a number; 
    b number; 
    PROCEDURE squareNumber(x IN number, y OUT number) IS 
    BEGIN 
        y := x * x; 
    END; 
    BEGIN 
        a := 10; 
        squareNumber(a,b); 
        dbms_output.put_line('Square of 10 is: '|| b); 
    END; 
/

    / 


DECLARE 
    a number; 
    b number; 
    PROCEDURE squareNumber(x IN number, y OUT number) IS 
    BEGIN 
        y := x * x; 
    END; 
    BEGIN 
        a := 11; 
        squareNumber(a,b); 
        dbms_output.put_line('Square of 11 is: '|| b); 
    END; 
/

    /


DECLARE 
    name VARHCAR2(100); 
    PROCEDURE getCity(user_data IN OUT VARCHAR2(100)) IS 
    BEGIN 
        SELECT city INTO user_data FROM CUSTOMER where name=user_data; 
    END; 
    BEGIN 
    nams := 'Durga'; 
    getCity(name); 
    dbms_outpur.put_line('Durga is from :' || name ); 
    END; 
/

    / 


DECLARE 
    name VARHCAR2(100); 
    PROCEDURE getCity(user_data IN OUT VARCHAR2(100)) IS 
    BEGIN 
        SELECT city INTO user_data FROM CUSTOMER where name=user_data; 
    END; 
    BEGIN 
    name := 'Durga'; 
    getCity(name); 
    dbms_outpur.put_line('Durga is from :' || name ); 
    END; 
/

    /


DECLARE 
    name VARCHAR2(100); 
    PROCEDURE getCity(user_data IN OUT VARCHAR2(100)) IS 
    BEGIN 
        SELECT city INTO user_data FROM CUSTOMER where name=user_data; 
    END; 
    BEGIN 
    name := 'Durga'; 
    getCity(name); 
    dbms_output.put_line('Durga is from :' || name ); 
    END; 
/

    / 


DECLARE 
    name VARCHAR2(100); 
    PROCEDURE getCity(user_data IN OUT VARCHAR2(100)) IS 
    BEGIN 
        SELECT city INTO user_data FROM CUSTOMER where custname=user_data; 
    END; 
    BEGIN 
    name := 'Durga'; 
    getCity(name); 
    dbms_output.put_line('Durga is from :' || name ); 
    END; 
/

    /


DECLARE 
    name VARCHAR2(100); 
    PROCEDURE getCity(user_data IN OUT VARCHAR2(100)) IS 
    BEGIN 
        SELECT city INTO user_data FROM CUSTOMER where custname='Durga'; 
    END; 
    BEGIN 
    name := 'Durga'; 
    getCity(name); 
    dbms_output.put_line('Durga is from :' || name ); 
    END; 
/

    / 


DECLARE 
    name VARCHAR2(100); 
    PROCEDURE getCity(user_data OUT VARCHAR2(100)) IS 
    BEGIN 
        SELECT city INTO user_data FROM CUSTOMER where custname='Durga'; 
    END; 
    BEGIN 
    name := 'Durga'; 
    getCity(name); 
    dbms_output.put_line('Durga is from :' || name ); 
    END; 
/

    /


DECLARE 
    name VARCHAR2(100); 
    PROCEDURE getCity(user_data OUT VARCHAR2(100)) IS 
    BEGIN 
        SELECT city INTO user_data FROM CUSTOMER where custname='Durga'; 
    END; 
    BEGIN 
    getCity(name); 
    dbms_output.put_line('Durga is from :' || name ); 
    END; 
/

    / 


DECLARE 
    name VARCHAR2(100); 
    PROCEDURE getCity(user_data OUT VARCHAR2) IS 
    BEGIN 
        SELECT city INTO user_data FROM CUSTOMER where custname='Durga'; 
    END; 
    BEGIN 
    getCity(name); 
    dbms_output.put_line('Durga is from :' || name ); 
    END; 
/

    /


DECLARE 
    name VARCHAR2(100); 
    PROCEDURE getCity(user_data IN OUT VARCHAR2) IS 
    BEGIN 
        SELECT city INTO user_data FROM CUSTOMER where custname=user_data; 
    END; 
    BEGIN 
    name := 'Durga' 
    getCity(name); 
    dbms_output.put_line('Durga is from :' || name ); 
    END; 
/

    / 


DECLARE 
    name VARCHAR2(100); 
    PROCEDURE getCity(user_data IN OUT VARCHAR2) IS 
    BEGIN 
        SELECT city INTO user_data FROM CUSTOMER where custname=user_data; 
    END; 
    BEGIN 
    name := 'Durga'; 
    getCity(name); 
    dbms_output.put_line('Durga is from :' || name ); 
    END; 
/

    / 


ALTER TABLE CUSTOMER MODIFY COLUMN custid INTEGER UNIQUE AUTO_INCREMENT;

DECLARE 
    c_name VARCHAR2(100); 
    c_gender CHAR(1); 
    c_city VARCHAR2(100); 
    PROCEDURE addCustomer(cn IN VARCHAR2, cg IN CHAR , cc IN VARCHAR2) IS 
    BEGIN 
        INSERT INTO CUSTOMER VALUES(1006,cn,cg,cc); 
    END; 
    BEGIN 
        c_name='Raj'; 
        c_gender='M'; 
        c_city='Kolkatta'; 
        addCustomer(c_name,c_gender,c_city); 
        dbms_output.put_line('Customer data added successfully!'); 
    END; 
/

    / 


DECLARE 
    c_name VARCHAR2(100); 
    c_gender CHAR(1); 
    c_city VARCHAR2(100); 
    PROCEDURE addCustomer(cn IN VARCHAR2, cg IN CHAR , cc IN VARCHAR2) IS 
    BEGIN 
        INSERT INTO CUSTOMER VALUES(1006,cn,cg,cc); 
    END; 
    BEGIN 
        c_name :=' Raj'; 
        c_gender := 'M'; 
        c_city := 'Kolkatta'; 
        addCustomer(c_name,c_gender,c_city); 
        dbms_output.put_line('Customer data added successfully!'); 
    END; 
/

    / 


SELECT * FROM CUSTOMER;

