
--LAB2


--2.1 Create database called «lab2»
CREATE DATABASE lab2;


--2.2 Create a simple table countries including columns
-- country_id (primary_key, auto increment), country_name(string),
-- region _id(integer) and population(integer).
CREATE TABLE countries(
    country_id   SERIAL PRIMARY KEY,
    country_name VARCHAR(50),
    region_id    INT,
    population   INT
);



--2.3. Insert a row with any data into the table countries against each columns.
INSERT INTO countries(country_name, region_id, population)
VALUES ('China', 1, 1419321278);



--2.4 Insert one row into the table countries against the column country_id and country_name.
INSERT INTO countries(country_name)
VALUES ('Germany');


--2.5 Insert NULL value to region _id column for a row of countries table.
INSERT INTO countries(country_name, region_id, population)
VALUES ('India', NULL, 1453980647);



--2.6 Insert 3 rows by a single insert statement.
INSERT INTO countries(country_name, region_id, population)
VALUES
    ('Australia', 2, 26713205 ),
    ('US', 3, 345426571),
    ('Pakistan', 4, 252197089);


--2.7 Set default value 'Kazakhstan' to country_name column.
ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakstan';


--2.8  Insert default value to country_name column for a row of countries table
INSERT INTO countries(population,region_id)
VALUES (19000000, 1);


--2.9 Insert only default values against each column of countries table.
INSERT INTO countries DEFAULT VALUES;


--2.10 Create duplicate of countries table named countries_new with all structure using LIKE keyword.
CREATE TABLE countries_new (LIKE countries INCLUDING ALL);


--2.11 Insert all rows from countries table to countries_new table.
INSERT INTO countries_new (country_id, country_name, region_id, population)
SELECT country_id, country_name, region_id, population FROM countries;


--2.12 Change region_id of country to «1» if it equals NULL. (Use WHERE clause and IS NULL operator)
UPDATE countries
SET region_id=1
WHERE region_id IS NULL;


--2.13 Write a SQL statement to increase population of each country by 10%.
-- Statement should return country _name and updated population column with name «New Population»(alias).

UPDATE countries
SET population = population * 1.1
RETURNING country_name, population  AS "New Population";



--2.14  Remove all rows from countries table which has less than 100k population.
DELETE FROM countries
WHERE population < 100000;


--2.15 Remove all rows from countries_new table if country _id exists in countries table. Statement should return all deleted data.
DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries);


--2.16 Remove all rows from countries table. Statement should return all deleted data.
DELETE FROM countries
RETURNING *;
