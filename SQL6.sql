use training;

-- Numeric number

SELECT * FROM employee;
-- To get the max salary detail

SELECT * FROM employee WHERE salary=(SELECT max(salary) FROM employee);
SELECT max(salary) FROM employee;

-- To get the min salary details
SELECT min(salary) FROM employee;
SELECT * FROM employee WHERE salary=(SELECT min(salary) FROM employee);

-- To get the avg salary details
SELECT avg(salary) FROM employee;
SELECT * FROM employee WHERE salary>(SELECT avg(salary) FROM employee);
SELECT * FROM employee WHERE salary<(SELECT avg(salary) FROM employee);

-- To get the total(sum) of salary
SELECT sum(salary) from EMPLOYEE;

-- To the total number of rows in a table
SELECT count(*) FROM employee;


-- STRING functions

-- CONCAT  cancatenate two string 

SELECT * FROM CUSTOMER;

SELECT CONCAT(custname,' - ',city,',','ExcelR') as customer_info FROM customer;
SELECT CONCAT_WS('-',custname,city,'ExcelR') as customer_info FROM customer;


-- INITCAP Convert the first character in each word to upper case
SELECT INITCAP('hi everyone, how are you doing') FROM DUAL ;

-- LENGTH

SELECT custname FROM CUSTOMER;
SELECT CUSTNAME, LENGTH(custname) as length FROM CUSTOMER;

-- LOWER
SELECT LOWER(custname) FROM CUSTOMER;

-- UPPER
SELECT upper(custname) FROM CUSTOMER;

-- REPLACE
SELECT replace(custname,'a','A') FROM customer;

-- SUBSTR
SELECT substr(custname,1,2) FROM customer;

-- TRIM
SELECT TRIM(' ExcelR ') FROM dual;

-- LPAD and RPAD
SELECT custname FROM customer;
SELECT LPAD(custname,10,'_') FROM customer;
SELECT RPAD(custname,10,'*') FROM customer;

-- SUBSTRING_INDEX

SELECT SUBSTRING_INDEX(SUBSTRING_INDEX('ABCD@gmail.com','@',-1),'.',1) as domain FROM DUAL;

-- CAST
SELECT CAST(custid as char(4)) FROM CUSTOMER;


-- DATE FUNCTION

-- %a ->  abbreviated weekday (Sun,Mon,... Sat)
-- %W -> Weekday (Sunday, Monday.... Saturday)
-- %b -> Abbreviated Month name (Jan, Feb,....Dec)
-- %M -> Month Name (January, February....December)
-- %c -> Month in numeric (1,2,...12)
-- %d -> day in numeric (1,2...31)
-- %D --> Day of month in English suffix (1st, 2nd, 3rd....)
-- %y -> year in 2 digit (20,21,22)
-- %Y -> year in 4 digit (2020,2021,2022)
-- %H -> Hours in 24 hours format
-- %I -> hour in 12 hours name
-- %p -> AM | PM
-- %i -> Minutes (00..59)
-- %S -> Seconds (00...59)


SELECT curdate();  -- 03-Aug-2022
SELECT DATE_FORMAT(curdate(),'%d-%b-%Y');
 SELECT DATE_FORMAT(curdate(),'%c/%d/%Y');-- 08/03/2022
 SELECT DATE_FORMAT(current_timestamp(),'%W,%D %M %Y , %I:%i %p');
  SELECT DATE_FORMAT(current_timestamp(),'%W,%D %M %Y , %H:%i');

SELECT * FROM cust_info;

ALTER TABLE cust_info DROP COLUMN registred_date;
ALTER TABLE cust_info ADD COLUMN registered_date datetime DEFAULT current_timestamp;
UPDATE cust_info SET registered_date='2020-01-01 10:10:10' WHERE custid=1000;
SELECT * FROM cust_info WHERE YEAR(registered_date )='2022';
SELECT * FROM cust_info WHERE YEAR(registered_date )='2020';

SELECT * FROM cust_info WHERE MONTH(registered_date )='01';
SELECT * FROM cust_info WHERE MONTH(registered_date )='08';

SELECT * FROM cust_info WHERE DAY(registered_date )='03';
SELECT * FROM cust_info WHERE DAY(registered_date )='01';

SELECT * FROM cust_info WHERE HOUR(registered_date )='22';
SELECT * FROM cust_info WHERE MINUTE(registered_date )='08';
SELECT * FROM cust_info WHERE MINUTE(registered_date )='10';

SELECT * FROM cust_info WHERE SECOND(registered_date )='10';






INSERT INTO cust_info VALUES(1004,'Prabha','Delhi','2000-01-01 11:30');

SELECT * FROM cust_info;
