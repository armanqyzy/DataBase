--1
create database lab6;

--2
CREATE TABLE locations(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

CREATE TABLE department(
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    location_id integer references locations
);

CREATE TABLE employee(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references department
);

--3
SELECT employee.first_name, employee.last_name, employee.department_id, department.department_name
FROM employee
JOIN department ON employee.department_id = department.department_id;

--4
SELECT employee.first_name, employee.last_name, employee.department_id, department.department_name
FROM employee
JOIN department ON employee.department_id = department.department_id
WHERE employee.department_id IN (80, 40);

--5
SELECT employee.first_name, employee.last_name, department.department_name, locations.city, locations.state_province
FROM employee
JOIN department ON employee.department_id = department.department_id
JOIN locations ON department.location_id = locations.location_id;

--6
SELECT DISTINCT department.department_name
FROM department
LEFT JOIN employee ON department.department_id = employee.department_id;

--7
SELECT employee.first_name, employee.last_name, employee.department_id, department.department_name
FROM employee
FULL JOIN department ON employee.department_id = department.department_id;
