--1
CREATE DATABASE lab5;

--2
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO Customers (customer_id, cust_name, city, grade, salesman_id) VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3001, 'Brad Guzan', 'London', 100, 5005),
    (3004, 'Fabian Johns', 'Paris', 300, 5006),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3009, 'Geoff Camero', 'Berlin', 100, 5003),
    (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760.0, '2012-09-10', 3002, 5001);

--3
SELECT SUM(purch_amt) AS totalOfPurch_amt
FROM orders;

--4

SELECT AVG(purch_amt) AS averageOfpurch_amt
FROM orders;

--5
SELECT COUNT(cust_name) AS totalCustomers
FROM Customers;

--6
SELECT MIN(purch_amt)  AS minPurchAmt
FROM orders;

--7
SELECT * FROM Customers
WHERE cust_name LIKE '%b';


--8
SELECT * FROM orders
WHERE customer_id IN (
        SELECT customer_id FROM Customers
        WHERE city = 'New York'
);


--9
SELECT * FROM customers
WHERE customer_id IN (
        SELECT customer_id FROM orders
        WHERE purch_amt > 10
);

--10
SELECT SUM(grade) AS total_grade
FROM customers;

--11
SELECT * FROM customers
WHERE cust_name IS NOT NULL;

-- 12
SELECT MAX(grade) AS maximum_grade
FROM customers;

