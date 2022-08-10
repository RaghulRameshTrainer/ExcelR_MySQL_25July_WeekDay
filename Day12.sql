create database mydb;

use mydb;
create table customer(
custid int ,
custname varchar(100),
age INT,
gender char(1),
city varchar(20)
);

INSERT INTO customer values
(101, 'Shiva', 40, 'M', 'Bangalore'),
(102, 'Ram', 25, 'M', 'Hyderabad'),
(103, 'Krishna', 50, 'M', 'Chennai'),
(104, 'Ganesh', 35, 'M', 'Mumbai'),
(105, 'Mahalaxmi', 30, 'F', 'Pune');

SELECT * FROM CUSTOMER;

CREATE TABLE product(
prodid INT, 
productname VARCHAR(30), 
quantity INT, 
amount DECIMAL(20,2) 
);

INSERT INTO Product values(1, 'TV', 100, 70000),
(2, 'Fridge', 10, 50000),
(3, 'Mobile', 150, 150000),
(4, 'Watch', 100, 80000),
(5, 'Mixer', 75, 90000),
(6, 'Grinder', 200, 200000),
(7, 'Washing Machine', 175, 60000);

SELECT productname, sum(amount) 
FROM transacation_tbl
GROUP BY productname;

CREATE TABLE transaction_tbl (
transid INT, custid INT, prodid INT
);

INSERT INTO transaction_tbl values
(1001, 101, 1),
(1002, 102, 3),
(1003, 105, 5),
(1004, 102, 6),
(1005, 103, 8),
(1006, 105, 9),
(1007, 104, 10),
(1008, 101, 2),
(1009, 102, 4),
(1010, 104, 7);

select t.custid, c.custname, c.age, c.gender, c.city, p.productname, p.amount from transaction_tbl t
inner join customer c on t.custid=c.custid
inner join Product p on t.prodid=p.prodid;


-- CASE STATEMENT

SELECT * FROM CUSTOMER;

SELECT custid, custname, age, gender, city ,CASE 
WHEN city='Bangalore' THEN 'kannadam'
WHEN city='Hyderabad' THEN 'Telugu'
WHEN city='Chennai' THEN 'Tamil'
WHEN city IN ('Mumbai', 'Pune') THEN 'Marathi'
ELSE 'Hindi'
END AS language
FROM CUSTOMER;


UPDATE CUSTOMER SET gender=CASE 
WHEN gender='M' THEN 'F'
ELSE 'M' END;


-- WINDOWING FUNCTION
-- row_number, rank, dense_rank
CREATE TABLE TRANSACTION_TABLE(
transid INT,
prodname VARCHAR(100),
amount INT,
country varchar(100)
);
INSERT INTO TRANSACTION_TABLE VALUES(1,'laptop',1000,'India'),
(2,'mobile',500,'USA'),
(3,'Dekstop',600,'Canada'),
(4,'Dekstop',500,'USA'),
(5,'TV',2000,'India'),
(6,'Tablet',500,'USA'),
(7,'TV',1000,'Canada'),
(8,'mobile',1500,'Canada'),
(9,'TV',1000,'USA');

SELECT * FROM TRANSACTION_TABLE;

SELECT transid,prodname,amount, country, row_number() OVER (ORDER BY amount DESC) as rnk FROM TRANSACTION_TABLE;
SELECT transid,prodname,amount, country, row_number() OVER (partition by country ORDER BY amount DESC) as rnk FROM TRANSACTION_TABLE;

-- RANK
SELECT transid,prodname,amount, country, rank() OVER (ORDER BY amount DESC) as rnk FROM TRANSACTION_TABLE;
SELECT transid,prodname,amount, country, rank() OVER (partition by country ORDER BY amount DESC) as rnk FROM TRANSACTION_TABLE;

-- DENSE_RANK
SELECT transid,prodname,amount, country, dense_rank() OVER (ORDER BY amount DESC) as rnk FROM TRANSACTION_TABLE;

SELECT transid,prodname,amount, country , rnk FROM 
(SELECT transid,prodname,amount, country, dense_rank() OVER (partition by country ORDER BY amount DESC) as rnk FROM TRANSACTION_TABLE) chn
WHERE rnk<=2;
