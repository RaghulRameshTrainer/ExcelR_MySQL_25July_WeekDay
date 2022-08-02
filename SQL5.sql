use training;

-- SUB QUERY : Subquery is a query nested within another query  (INNER QUERY)

SELECT * FROM CUSTOMER;
SELECT * FROM TRANSACTION_TBL;

SELECT * FROM CUSTOMER WHERE custid IN (
SELECT DISTINCT custid FROM TRANSACTION_TBL);

SELECT * FROM CUSTOMER WHERE custid NOT IN (
SELECT DISTINCT custid FROM TRANSACTION_TBL);

SELECT * FROM CUSTOMER WHERE custid  IN (
SELECT DISTINCT custid FROM TRANSACTION_TBL WHERE productname='Laptop');

CREATE TABLE EMPLOYEE(
empid INT,
emoname VARCHAR(100),
gender CHAR(1),
salary INT);

SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE WHERE salary = 
(SELECT max(salary) FROM EMPLOYEE);

SELECT * FROM EMPLOYEE WHERE salary > (SELECT avg(salary) FROM EMPLOYEE);
SELECT * FROM EMPLOYEE WHERE salary < (SELECT avg(salary) FROM EMPLOYEE);    

SELECT * FROM EMPLOYEE_DATA;

-- VIEW  View is a virtual table based on the result set of an SQL statement

SELECT * FROM EMPLOYEE;

ALTER TABLE EMPLOYEE RENAME COLUMN emoname TO empname;
CREATE VIEW cust_data AS
SELECT empname,gender FROM EMPLOYEE;

SELECT * FROM cust_data;


CREATE VIEW male_cust_data AS
SELECT empname,gender FROM EMPLOYEE WHERE gender='M';

SELECT * FROM male_cust_data;

DROP VIEW male_cust_data;

SET sql_safe_updates=0;
DELETE FROM EMPLOYEE WHERE empname='Kavita';


ALTER VIEW cust_data AS
SELECT empname,gender,salary FROM EMPLOYEE;

SELECT * FROM cust_data WHERE salary >=100000;


--  INDEX 

SHOW INDEXES FROM CUSTOMER;

CREATE INDEX cust_idx ON CUSTOMER(custid);

SELECT * FROM CUSTOMER WHERE custid=1002;

SELECT * FROM EMPLOYEE;

SHOW INDEXES FROM EMPLOYEE;

CREATE INDEX emp_id ON EMPLOYEE(empid, empname);