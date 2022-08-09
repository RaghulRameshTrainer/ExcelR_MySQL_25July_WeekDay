USE training;

CREATE TABLE CUSTOMER( 
id INTEGER, 
name VARCHAR(100), 
age INTEGER, 
city VARCHAR(100) 
);


INSERT INTO CUSTOMER VALUES(100,'Ram Shankar',35,'Chennai');

INSERT INTO CUSTOMER VALUES(102,'Bala Murugan',30,'Banaglore');

INSERT INTO CUSTOMER VALUES(103,'Prabhakaran',25,'Hyderabad');

INSERT INTO CUSTOMER VALUES(104,'Arun Vetri Maran',40,'Pune');

INSERT INTO CUSTOMER VALUES(101,'Shivani',50,'Delhi');

SELECT * FROM CUSTOMER;
CREATE TABLE CUSTOMER( 
id INTEGER, 
name VARCHAR2(100), 
age INTEGER, 
city VARCHAR2(100) 
);


INSERT INTO CUSTOMER VALUES(100,'Ram Shankar',35,'Chennai');

INSERT INTO CUSTOMER VALUES(102,'Bala Murugan',30,'Banaglore');

INSERT INTO CUSTOMER VALUES(103,'Prabhakaran',25,'Hyderabad');

INSERT INTO CUSTOMER VALUES(104,'Arun Vetri Maran',40,'Pune');

INSERT INTO CUSTOMER VALUES(105,'Shivani',50,'Delhi');

SELECT * FROM CUSTOMER;

-- CURSOR is a pointer to the memory area used to store the queries result.
-- IMPLICIT and EXPLICIT cursor

DECLARE
    c_id CUSTOMER.id%type;
    c_name CUSTOMER.name%type;
    c_age CUSTOMER.age%type;
    c_city CUSTOMER.city%type;
    CURSOR customer_data IS
        SELECT id, name, age, city FROM CUSTOMER;
BEGIN
    OPEN customer_data;
    LOOP
        FETCH customer_data INTO c_id, c_name, c_age, c_city;
        EXIT WHEN customer_data%NOTFOUND;
        dbms_output.put_line(c_id || ' ~ '|| c_name || ' ~ ' || c_age || ' ~ '|| c_city);
    END LOOP;
    CLOSE customer_data;
END;
/
    
    
DECLARE
    c_id CUSTOMER.id%type;
    c_name CUSTOMER.name%type;
    c_age CUSTOMER.age%type;
    c_city CUSTOMER.city%type;
    CURSOR customer_data IS
        SELECT name,  city FROM CUSTOMER;
BEGIN
    OPEN customer_data;
    LOOP
        FETCH customer_data INTO  c_name,  c_city;
        EXIT WHEN customer_data%NOTFOUND;
        dbms_output.put_line( c_name || ' ~ '|| c_city);
    END LOOP;
    CLOSE customer_data;
END;
/
    
    
  =============================================
  
  -- TRIGGER   
    
    
CREATE TABLE OLD_CUSTOMER( 
id INTEGER, 
name VARCHAR2(100), 
age INTEGER, 
city VARCHAR2(100) 
);


SELECT * FROM OLD_CUSTOMER;

CREATE OR REPLACE TRIGGER cust_trigger
BEFORE DELETE ON CUSTOMER
FOR EACH ROW
BEGIN
INSERT INTO OLD_CUSTOMER VALUES(:OLD.id,:OLD.name,:OLD.age,:OLD.city);
END;
/


SELECT * FROM CUSTOMER;
DELETE FROM CUSTOMER WHERE ID=103;


SELECT * FROM OLD_CUSTOMER;

CREATE OR REPLACE TRIGGER cust_age_update
BEFORE UPDATE ON CUSTOMER
FOR EACH ROW
DECLARE
    age_diff number;
BEGIN
    age_diff := :NEW.age - :OLD.age;
    dbms_output.put_line('OLD AGE: ' || :OLD.age); 
    dbms_output.put_line('NEW AGE: ' || :NEW.age); 
    dbms_output.put_line('AGE DIFF: ' || age_diff); 
END;
/

UPDATE CUSTOMER SET age=100 WHERE ID=105;

=====================================================================

SET sql_safe_updates=0;

UPDATE CUSTOMER SET age=45 WHERE ID=100;

START TRANSACTION;
UPDATE CUSTOMER SET AGE=1000 ;

ROLLBACK;


START TRANSACTION;
UPDATE CUSTOMER SET AGE=100 WHERE ID=101 ;

COMMIT;

START TRANSACTION;
UPDATE CUSTOMER SET city='TRICHY' WHERE ID=102;
ROLLBACK;


START TRANSACTION;
UPDATE CUSTOMER SET city='TRICHY' WHERE ID=101;
COMMIT;

SELECT * FROM CUSTOMER;
START TRANSACTION;
DELETE FROM CUSTOMER WHERE ID=103;
COMMIT;

START TRANSACTION;
DELETE FROM CUSTOMER WHERE ID=102;
ROLLBACK;

START TRANSACTION;
DELETE FROM CUSTOMER WHERE ID=100;
DELETE FROM CUSTOMER WHERE ID=102;
DELETE FROM CUSTOMER WHERE ID=101;
ROLLBACK;

START TRANSACTION;
DELETE FROM CUSTOMER WHERE ID>101;
ROLLBACK;
    
    
    
    
    
    
    
    
    
    