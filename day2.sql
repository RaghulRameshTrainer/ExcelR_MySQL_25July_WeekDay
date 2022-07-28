use cust;

SELECT * FROM CUSTOMER;

-- DELETE

-- DELETE FROM CUSTOMER;

DELETE FROM CUSTOMER WHERE age=40;

SELECT * FROM CUSTOMER;

DELETE FROM CUSTOMER WHERE fullname='Ramya';

DELETE FROM CUSTOMER WHERE city='Chennai' and gender='F';

SELECT * FROM CUSTOMER;

DELETE FROM CUSTOMER WHERE city='PUNE';

-- Windowing function (rank, dense_rank, row_number)


-- CONSTRAINTS
-- UNIQUE
-- NOT NULL
-- PRIMARY KEY
-- FOREIGN KEY
-- CHECK
-- DEFAULT


-- unique constraints

CREATE TABLE unique_tbl(
custid INT UNIQUE,
fullname VARCHAR(100),
age INT,
mobile VARCHAR(100) ,
city VARCHAR(100)
);

INSERT INTO unique_tbl VALUES(1,'Madhan Kumar',35,'+91-9876543210' ,'Hyderabad');
INSERT INTO unique_tbl VALUES(2,'Bala Ravikumar',37,'+91-9876543211' ,'Bangalore');
INSERT INTO unique_tbl VALUES(3,'Bala Ravikumar',37,'+91-9876543211' ,'Bangalore');

SELECT * FROM unique_tbl;

CREATE TABLE unique_tbl_2(
custid INT UNIQUE,
fullname VARCHAR(100),
age INT,
mobile VARCHAR(100) UNIQUE ,
city VARCHAR(100)
);


INSERT INTO unique_tbl_2 VALUES(1,'Madhan Kumar',35,'+91-9876543210' ,'Hyderabad');
INSERT INTO unique_tbl_2 VALUES(2,'Bala Ravikumar',37,'+91-9876543211' ,'Bangalore');
INSERT INTO unique_tbl_2 VALUES(3,'Bala Ravikumar',37,'+91-9876543212' ,'Bangalore');

SELECT * FROM unique_tbl_2;

INSERT INTO unique_tbl_2(fullname, age, mobile, city) VALUES('Levin Lunux',40,'+91-9876543255' ,'Chennai');

INSERT INTO unique_tbl_2(fullname, age, mobile, city) VALUES('Dinesh Kumar',39,'+91-9876543266' ,'Chennai');


-- not null constrains

CREATE TABLE notnull_tbl(
custid INT NOT NULL,
fullname VARCHAR(100),
age INT,
mobile VARCHAR(100) UNIQUE,
city VARCHAR(100)
);

INSERT INTO notnull_tbl VALUES(1,'Anita Joicy',36,'9839899389','Pune');
SELECT * FROM notnull_tbl;
INSERT INTO notnull_tbl VALUES(1,'Charanya Rajesh',35,'9839899399','Pune');

INSERT INTO notnull_tbl(custid,fullname, age, mobile, city) VALUES(2,'Levin Lunux',40,'+91-9876543255' ,'Chennai');


CREATE TABLE notnull_tbl_2(
custid INT UNIQUE NOT NULL,
fullname VARCHAR(100),
age INT,
mobile VARCHAR(100) UNIQUE,
city VARCHAR(100)
);

INSERT INTO notnull_tbl_2 VALUES(1,'Anita Joicy',36,'9839899389','Pune');
SELECT * FROM notnull_tbl_2;
INSERT INTO notnull_tbl_2 VALUES(2,'Charanya Rajesh',35,'9839899399','Pune');

INSERT INTO notnull_tbl_2(custid,fullname, age, mobile, city) VALUES(3,'Levin Lunux',40,'+91-9876543255' ,'Chennai');

-- PRIMARY KEY 
-- unique + not null

CREATE TABLE primarykey_tbl(
custid INT PRIMARY KEY,    -- simple primary key 
fullname VARCHAR(100),
age INT,
mobile VARCHAR(100) UNIQUE,
city VARCHAR(100)
);

INSERT INTO primarykey_tbl VALUES(1,'Sindhya Rajesh',27,'9483939890','Ooty');
SELECT * FROM primarykey_tbl;
INSERT INTO primarykey_tbl VALUES(2,'Ramya Siva',37,'9483939891','Mumbai');

INSERT INTO primarykey_tbl(custid,fullname,age,mobile,city) VALUES(3,'Kavita Rajesh',37,'9483939800','Pune');
INSERT INTO primarykey_tbl VALUES(5,'Ramya Siva',37,'9483939891','Mumbai');

-- UPDATE primarykey_tbl SET city='Mumbai' WHERE city='Mmmbai';


CREATE TABLE primarykey_tbl_2(
custid INT,
fullname VARCHAR(100),
age INT,
mobile VARCHAR(100) UNIQUE,
city VARCHAR(100),
PRIMARY KEY (custid,fullname)     -- composite primary key
);


INSERT INTO primarykey_tbl_2 VALUES(1,'Sindhya Rajesh',27,'9483939890','Ooty');
SELECT * FROM primarykey_tbl_2;
INSERT INTO primarykey_tbl_2 VALUES(1,'Ramya Siva',37,'9483939891','Mumbai');
INSERT INTO primarykey_tbl_2 VALUES(2,'Ramya Siva',27,'9483939811','Chennai');

INSERT INTO primarykey_tbl_2(custid,fullname,age,mobile,city) VALUES(3,'Kavita Rajesh',37,'9483939800','Pune');


-- FOREIGN KEY
CREATE TABLE foreignkey_tbl(
custid INT,
fullname VARCHAR(100),
age INT,
mobile VARCHAR(100) UNIQUE,
city VARCHAR(100),
FOREIGN KEY (custid) REFERENCES primarykey_tbl(custid)
);

INSERT INTO foreignkey_tbl VALUES(1,'Tharani Priya',33,'9876789909','New Delhi');
SELECT * FROM foreignkey_tbl;
INSERT INTO foreignkey_tbl VALUES(1,'Ashwin Kumar',33,'9876789900','New Delhi');
INSERT INTO foreignkey_tbl VALUES(2,'Arun Kumar',33,'9876789901','Chennai');

DELETE FROM foreignkey_tbl WHERE custid=2;

CREATE TABLE foreignkey_tbl_2(
custid INT,
fullname VARCHAR(100),
age INT,
mobile VARCHAR(100) UNIQUE,
city VARCHAR(100),
FOREIGN KEY (custid) REFERENCES primarykey_tbl(custid) ON DELETE CASCADE
);

INSERT INTO foreignkey_tbl_2 VALUES(1,'Tharani Priya',33,'9876789909','New Delhi');
SELECT * FROM foreignkey_tbl_2;
INSERT INTO foreignkey_tbl_2 VALUES(1,'Ashwin Kumar',33,'9876789906','New Delhi');
INSERT INTO foreignkey_tbl_2 VALUES(2,'Arun Kumar',33,'9876789901','Chennai');

DELETE FROM primarykey_tbl WHERE custid=2;

-- Please practice ON UPDATE CASCADE


CREATE TABLE foreignkey_tbl_3(
custid INT,
fullname VARCHAR(100),
age INT,
mobile VARCHAR(100) UNIQUE,
city VARCHAR(100),
FOREIGN KEY (custid) REFERENCES primarykey_tbl(custid) ON UPDATE CASCADE
);


INSERT INTO foreignkey_tbl_3 VALUES(1,'Tharani Priya',33,'9876789909','New Delhi');
SELECT * FROM foreignkey_tbl_3;
INSERT INTO foreignkey_tbl_3 VALUES(3,'Ashwin Kumar',33,'9876789906','New Delhi');
INSERT INTO foreignkey_tbl_3 VALUES(5,'Gayathri',32,'9876789555','Chennai');

SELECT * FROM primarykey_tbl;
UPDATE primarykey_tbl SET custid=555 WHERE custid=5;
-- CHECK WHICH ARE THE TABLE REFERING A PRIMARY KEY TABLE AS A PARENT TABLE
SELECT table_name, column_name FROM information_schema.key_column_usage
WHERE referenced_table_name='primarykey_tbl';

-- CHECK constraints


CREATE TABLE check_tbl(
custid INT,
fullname VARCHAR(100),
age INT CHECK (age >=0 and age <=100),
mobile VARCHAR(100) UNIQUE,
city VARCHAR(100)
);

INSERT INTO check_tbl VALUES(1,'Bala Kumar',25,'9878987899','Chennai');
SELECT * FROM check_tbl;
INSERT INTO check_tbl VALUES(1,'Aveek Sharma',100,'9878987898','Chennai');



CREATE TABLE check_tbl_2(
custid INT,
fullname VARCHAR(100),
age INT CHECK (age >=0 and age <=100),
mobile VARCHAR(100) ,
city VARCHAR(100) CHECK ( city IN ('Chennai','Bangalore','Hyderabad','Pune'))
);

INSERT INTO check_tbl_2 VALUES(1,'Bala Kumar',25,'9878987899','Chennai');
SELECT * FROM check_tbl_2;
INSERT INTO check_tbl_2 VALUES(1,'Aveek Sharma',100,'9878987898','Pune');

CREATE TABLE check_tbl_3(
custid INT,
fullname VARCHAR(100),
age INT CHECK (age >=0 and age <=100),
mobile VARCHAR(100) CHECK (LENGTH(mobile) = 10),
city VARCHAR(100) CHECK ( city IN ('Chennai','Bangalore','Hyderabad','Pune'))
);

INSERT INTO check_tbl_3 VALUES(1,'Bala Kumar',25,'9878987899','Chennai');
SELECT * FROM check_tbl_3;
INSERT INTO check_tbl_3 VALUES(1,'Aveek Sharma',100,'9878987891','Pune');

-- DEFAULT constraint

CREATE TABLE default_tbl(
custid INT,
fullname VARCHAR(100),
age INT,
mobile VARCHAR(100) UNIQUE,
city VARCHAR(100) DEFAULT 'Chennai'
);

INSERT INTO default_tbl VALUES(1,'Pankaj Kumar',30,'9909098761','New Delhi');
SELECT * FROM default_tbl;
INSERT INTO default_tbl(custid,fullname,age,mobile) VALUES(2,'Part',27,'9909098762');
INSERT INTO default_tbl(custid,fullname,age,mobile) VALUES(3,'Radhika',25,'9909098763');

-- SEQUENCE (AUTO_INCREMENT)

CREATE TABLE autoincrement_tbl(
custid INT UNIQUE AUTO_INCREMENT,
fullname VARCHAR(100),
age INT,
mobile VARCHAR(100) ,
city VARCHAR(100) 
);

INSERT INTO autoincrement_tbl(fullname,age,mobile,city) VALUES('Prakash Raj',50,'9812345677','Bangalore');
SELECT * FROM autoincrement_tbl;
INSERT INTO autoincrement_tbl(fullname,age,mobile,city) VALUES('Surya',45,'9812345676','Chennai');
INSERT INTO autoincrement_tbl(fullname,age,mobile,city) VALUES('Vijay',47,'9812345675','Chennai');

UPDATE autoincrement_tbl SET custid=100 WHERE fullname='Vijay';
INSERT INTO autoincrement_tbl(fullname,age,mobile,city) VALUES('Ajit',48,'9812345670','Chennai');

-- LIKE
SELECT * FROM CUSTOMER;

SELECT * FROM CUSTOMER WHERE fullname LIKE 'R%';
SELECT * FROM CUSTOMER WHERE fullname LIKE '%a';
SELECT * FROM CUSTOMER WHERE fullname LIKE '%Ram%';
SELECT * FROM CUSTOMER WHERE fullname LIKE '%R__e%';
SELECT * FROM CUSTOMER WHERE CITY NOT LIKE '%b%';

-- ALTER STATEMENT
DESC CUSTOMER;
ALTER TABLE CUSTOMER ADD COLUMN country VARCHAR(100);

				SELECT * FROM CUSTOMER;
				UPDATE CUSTOMER SET country='INDIA' WHERE CITY IN  ('Chennai','Hyderabad','Bangalore','Pune');

ALTER TABLE CUSTOMER DROP COLUMN gender;

ALTER TABLE CUSTOMER MODIFY COLUMN country VARCHAR(10);

ALTER TABLE CUSTOMER RENAME COLUMN city TO location;
ALTER TABLE CUSTOMER RENAME TO EMPLOYEE;

SELECT * FROM EMPLOYEE;
DESC EMPLOYEE;


CREATE TABLE foreignkey_tbl_10(
custid INT,
fullname VARCHAR(100),
age INT,
mobile VARCHAR(100) UNIQUE,
city VARCHAR(100),
CONSTRAINT cust_key FOREIGN KEY (custid) REFERENCES primarykey_tbl(custid) ON UPDATE CASCADE
);


ALTER TABLE foreignkey_tbl_10 DROP CONSTRAINT cust_key; 
ALTER TABLE foreignkey_tbl_10 ADD CONSTRAINT cust_key FOREIGN KEY (custid) REFERENCES primarykey_tbl(custid) ON DELETE CASCADE;

DESCRIBE foreignkey_tbl_10;

-- ALTER TABLE foreignkey_tbl_10 DROP CONSTRAINT foreignkey_tbl_10.mobile;

SELECT * FROM foreignkey_tbl_10;
INSERT INTO foreignkey_tbl_10 VALUES(1,'Tharani Priya',33,'9876789909','New Delhi');
