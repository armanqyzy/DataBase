create database lab10;

--Tables:
--1
create table Books(
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INTEGER NOT NULL
);
--2
CREATE TABLE Customers2(
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) not null,
    email varchar(255) not null
);
--3
create table Orders2(
    order_id serial primary key,
    book_id integer not null,
    customer_id integer not null,
    order_date date not null,
    quantity integer not null,
    foreign key (book_id) references books (book_id),
    foreign key (customer_id) references Customers2(customer_id)
);


--Sample Data

insert into Books(book_id, title, author, price, quantity)
values
(1, 'Database 101', 'A.Smith', 40.00, 10),
(2, 'Learn SQL', 'B. Johnson', 35.00, 15),
(3, 'Advanced DB', 'C. Lee', 50.00, 5);

insert into Customers2(customer_id, name, email)
values (101, 'John Doe', 'johndoe@example.com'),
       (102, 'Jane Doe', 'janedoe@example.com');

--TASK 1
begin;
insert into Orders2(book_id, customer_id, order_date, quantity)
values(1, 101, CURRENT_DATE, 2);
UPDATE Books SET quantity = quantity - 2 WHERE book_id = 1;
commit;


--TASK 2
do $$
begin
    IF(select quantity FROM Books WHERE book_id = 3) < 10 THEN
        RAISE NOTICE 'Incomplete quantity for book_id 3';
        ROLLBACK;
    ELSE
        INSERT INTO Orders2(order_id, book_id, customer_id, order_date, quantity)
        values (2, 3, 102, current_date, 10);

        update Books set quantity = quantity- 10 where book_id = 3;
        commit;
    end if;
end $$;
select * from Books;
select * from orders;




-- TASK 3

--session one
begin transaction isolation level  read committed;
update Books set price = 38.00 where book_id = 2;
commit;

--session two
begin transaction  isolation level  read committed ;
select price from Books where book_id = 2;

select price from Books where book_id = 2;

commit;



-- TASK 4

begin;
update Customers2 SET email = 'johndoe123@kbtu.kz' WHERE customer_id = 101;
commit;

select * from Customers2 WHERE customer_id = 101;