CREATE DATABASE new_testing_db;
USE new_testing_db;

CREATE TABLE dogs (
	name CHAR(5),
    breed VARCHAR(10)
);

INSERT INTO dogs (name, breed) VALUES('bob', 'beagle');
INSERT INTO dogs (name, breed) VALUES('bobby', 'corgi');
INSERT INTO dogs (name, breed) VALUES('Princess Jane', 'Retriever'); -- error
INSERT INTO dogs (name, breed) VALUES('jane', 'Golden Retriever'); -- error

-- (5, 2) -> 5 is the maximum number of digits, and 2 is the number of digits after the floating point
CREATE TABLE items (price DECIMAL(5, 2));
INSERT INTO items(price) VALUES(7);
SELECT * FROM items;
INSERT INTO items(price) VALUES(7987654); -- error
INSERT INTO items(price) VALUES(34.88);
INSERT INTO items(price) VALUES(298.9999); -- not error, but warning of truncation and rounded up to 299.00
INSERT INTO items(price) VALUES(1.9999); -- not error, but warning of truncation and rounded up to 2.0


-- float and double store larger numbers using less space than decimal, but it comes with a cost of precision, 
-- meaning that numbers stored in double and or float are not going to as precise as numbers stored in decimal.
CREATE TABLE thingies (price FLOAT);
INSERT INTO thingies (price) VALUES(88.45);
SELECT * FROM thingies;
INSERT INTO thingies (price) VALUES(8877.45);
SELECT * FROM thingies;
INSERT INTO thingies (price) VALUES(8877665544.45);
SELECT * FROM thingies;

CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Padma', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Toaster', '1990-04-21', '19:12:43', '1990-04-21 19:12:43');
SELECT * FROM people;

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Microwave', CURDATE(), CURTIME(), NOW());
SELECT * FROM people;

DELETE FROM people WHERE name = 'Microwave';

SELECT name, birthdate FROM people;
SELECT name, DAY(birthdate) FROM people;
SELECT name, birthdate, DAY(birthdate) FROM people;
SELECT name, birthdate, DAYNAME(birthdate) FROM people;
SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people;
SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;
SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;
SELECT name, birthdt, MONTH(birthdt) FROM people;
SELECT name, birthdt, MONTHNAME(birthdt) FROM people;
SELECT name, birthdt, HOUR(birthdt) FROM people;
SELECT name, birthdt, MINUTE(birthdt) FROM people;

SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W %M %Y') AS a_date;
SELECT DATE_FORMAT(birthdt, 'Was born on a %W') AS a_date FROM people;
SELECT DATE_FORMAT(birthdt, '%m/%d/%y') AS a_date FROM people;
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') AS a_date FROM people;
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%m:%s') AS a_date FROM people;

SELECT DATEDIFF(NOW(), birthdt) FROM people;
SELECT name, birthdate, DATEDIFF(NOW(), birthdt) AS days_from FROM people;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) AS changed_birthdt FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) AS changed_birthdt FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) AS changed_birthdt FROM people;

SELECT birthdt, birthdt + INTERVAL 1 MONTH AS changed_birthdt FROM people;
SELECT birthdt, birthdt - INTERVAL 5 MONTH AS changed_birthdt FROM people;
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR AS changed_birthdt FROM people;


-- !!! TIMESTAMP stores values between 1970-01-01 00:00:01 UTC and 2038-01-19 03:14:07 UTC !!!


CREATE TABLE comments (
	content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO comments(content) VALUES('lol what a funny article');
INSERT INTO comments(content) VALUES('i found this informative');
INSERT INTO comments(content) VALUES('coll stuff');
SELECT * FROM comments;
SELECT * FROM comments ORDER BY created_at DESC;


CREATE TABLE comments2 (
	content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);
INSERT INTO comments2(content) VALUES('lol what a funny article');
INSERT INTO comments2(content) VALUES('i found this informative');
INSERT INTO comments2(content) VALUES('coll stuff');
UPDATE comments2 SET content = 'awesome' WHERE content LIKE '%coll stuff%';
SELECT * FROM comments2;


CREATE TABLE invertory (
	item_name VARCHAR(255),
    price DECIMAL(8,2),
    quantity INT
);

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

SELECT DAYOFWEEK(NOW());
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');
SELECT CONCAT(MONTHNAME(NOW()), ' ', DATE_FORMAT(NOW(), '%D at %h:%m')) AS curr_date;   

CREATE TABLE tweets (
	content VARCHAR(140),
    username VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);