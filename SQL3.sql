use training;

CREATE TABLE order_tbl(
orderid INT PRIMARY KEY,
custid INT ,
produname VARCHAR(100),
city VARCHAR(100),
amount DECIMAL(20,2) ,
FOREIGN KEY (custid) REFERENCES primarykey_tbl(custid) 
);
SELECT * FROM primarykey_tbl;

INSERT INTO order_tbl VALUES(1,1000,'TV','Chennai',70000);
SELECT * FROM order_tbl;
INSERT INTO order_tbl VALUES(2,1001,'Fridge','Hyderabad',50000);
INSERT INTO order_tbl VALUES(3,1005,'Home Appliance','Chennai',100000);

SELECT * FROM primarykey_tbl;
DELETE FROM primarykey_tbl WHERE custid=1005;   -- ERROR WILL BE THROWN

CREATE TABLE order_tbl2(
orderid INT PRIMARY KEY,
custid INT ,
produname VARCHAR(100),
city VARCHAR(100),
amount DECIMAL(20,2) ,
FOREIGN KEY (custid) REFERENCES primarykey_tbl(custid) ON DELETE CASCADE
);
SELECT * FROM primarykey_tbl;

INSERT INTO order_tbl2 VALUES(1,1000,'TV','Chennai',70000);
SELECT * FROM order_tbl2;
INSERT INTO order_tbl2 VALUES(2,1001,'Fridge','Hyderabad',50000);
INSERT INTO order_tbl2 VALUES(3,1005,'Home Appliance','Chennai',100000);
INSERT INTO order_tbl2 VALUES(4,1003,'Chocolates','Bangalore',1000);

SELECT * FROM primarykey_tbl;
DELETE FROM primarykey_tbl WHERE custid=1003;


CREATE TABLE order_tbl3(
orderid INT PRIMARY KEY,
custid INT ,
produname VARCHAR(100),
city VARCHAR(100),
amount DECIMAL(20,2) ,
FOREIGN KEY (custid) REFERENCES primarykey_tbl(custid) ON UPDATE CASCADE
);
SELECT * FROM primarykey_tbl;

INSERT INTO order_tbl3 VALUES(1,1000,'TV','Chennai',70000);
SELECT * FROM order_tbl3;
INSERT INTO order_tbl3 VALUES(2,1001,'Fridge','Hyderabad',50000);
INSERT INTO order_tbl3 VALUES(3,1005,'Home Appliance','Chennai',100000);
INSERT INTO order_tbl3 VALUES(4,1002,'Chocolates','Bangalore',1000);

SELECT * FROM primarykey_tbl;
UPDATE primarykey_tbl SET custid=1111 WHERE custid=1002;

SHOW CREATE TABLE primarykey_tbl;

CREATE TABLE order_tbl4(
orderid INT PRIMARY KEY,
custid INT ,
produname VARCHAR(100),
city VARCHAR(100),
amount DECIMAL(20,2) ,
FOREIGN KEY (custid) REFERENCES primarykey_tbl(custid) ON UPDATE CASCADE ON DELETE CASCADE
);



#-- ----------------------------------------

INSERT INTO order_tbl4 VALUES(1,1000,'TV','Chennai',70000);
SELECT * FROM order_tbl4;
INSERT INTO order_tbl4 VALUES(2,1001,'Fridge','Hyderabad',50000);
INSERT INTO order_tbl4 VALUES(3,1005,'Home Appliance','Chennai',100000);


-- ---------------------------------------------------------------------------

-- DEFAULT CONSTAINTS

CREATE TABLE default_tbl(
custid INT PRIMARY KEY,
CUSTNAME VARCHAR(100) NOT NULL,
age INT,
city VARCHAR(100) DEFAULT 'Nagpur'
);

INSERT INTO default_tbl  VALUES(1,'Surya', 30, 'Chennai');
SELECT * FROM default_tbl;
INSERT INTO default_tbl  VALUES(2,'Kavin', 40, 'Banglore');
INSERT INTO default_tbl(custid,custname,age)  VALUES(3,'Amit',36);


-- CHECK CONSTAINTS

CREATE TABLE check_tbl(
custid INT PRIMARY KEY,
CUSTNAME VARCHAR(100) NOT NULL,
age INT CHECK (age > 0 and age <= 100),
city VARCHAR(100) DEFAULT 'Nagpur'
);

INSERT INTO check_tbl VALUES(1,'Vijay',46,'Chennai');
SELECT * FROM CHECK_TBL;
INSERT INTO check_tbl VALUES(2,'Karthik',200,'Chennai');
INSERT INTO check_tbl VALUES(2,'Karthik',-10,'Chennai');
INSERT INTO check_tbl VALUES(2,'Karthik',0,'Chennai');
INSERT INTO check_tbl VALUES(2,'Karthik',100,'Chennai');

CREATE TABLE check_tbl2(
custid INT PRIMARY KEY,
CUSTNAME VARCHAR(100) NOT NULL,
age INT CHECK (age > 0 and age <= 100),
city VARCHAR(100) CHECK (city IN ('Chennai','Bangalore','Hyderabad','Pune','Nagpur'))
);

INSERT INTO check_tbl2 VALUES(1,'Vijay',46,'Chennai');
SELECT * FROM CHECK_TBL2;
INSERT INTO check_tbl2 VALUES(2,'Jhon',46,'New Delhi');
INSERT INTO check_tbl2 VALUES(2,'Jhon',46,'Mumbai');
INSERT INTO check_tbl2 VALUES(2,'Jhon',46,'P');
