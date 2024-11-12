CREATE DATABASE lab7;
--1task
create index ind_count on countries(name);

--2 task
create index ind_emp on employees(name, surname);

--3 task
create unique index ind_emp_salary_range on employees(salary);

--4 task
create index ind_emp_sub on employees(substring(name from 1 for 4));

--5 task
create index ind_emp_salary on employees(salary);
create index ind_dep_budget on departments(budget);

create index ind_emp_department_id on employees(department_id);
create index ind_dep_department_id on departments(department_id);

