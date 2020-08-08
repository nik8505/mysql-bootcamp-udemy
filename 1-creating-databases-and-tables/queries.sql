CREATE DATABASE hello_world_db;
DROP DATABASE hello_world_db;
show databases;

CREATE DATABASE dog_walking_app;
USE dog_walking_app;
SELECT database();
DROP DATABASE dog_walking_app;
SELECT database();

CREATE DATABASE cat_app;
USE cat_app;
CREATE TABLE cats (
	name VARCHAR(100),
    age INT
);
SHOW TABLES;
SHOW COLUMNS FROM cats;
DESCRIBE cats;
DROP TABLE cats;

CREATE TABLE pastries (
	name VARCHAR(50),
    quantity INT 
);
DESCRIBE pastries;
DROP TABLE pastries;
