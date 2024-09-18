-- 1
CREATE DATABASE lab1;

-- 2
CREATE TABLE users(
    id SERIAL,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

--3
ALTER TABLE users
    ADD COLUMN isadmin INTEGER;

-- 4
ALTER TABLE users
ALTER COLUMN isadmin TYPE BOOLEAN
USING isadmin::boolean;


-- 5
ALTER TABLE users
    ALTER COLUMN isadmin SET DEFAULT false;

-- 6
ALTER TABLE users
    ADD CONSTRAINT pkey_id PRIMARY KEY (id);

-- 7
CREATE TABLE tasks(
    id SERIAL,
    name varchar(50),
    user_id INTEGER
);

-- 8
DROP TABLE tasks;

-- 9
DROP DATABASE lab1;