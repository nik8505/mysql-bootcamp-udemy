CREATE TABLE cats (
	name VARCHAR(100),
    age INT
);

INSERT INTO cats(name, age) VALUES('Blue', 1);
INSERT INTO cats(age, name) VALUES(11, 'Draco');
INSERT INTO cats(name, age) 
VALUES 
 ('Charlie', 10),
 ('Sadie', 13),
 ('Lazy Bear', 1),
 ('Peanut', 2),
 ('Butter', 4),
 ('Jelly', 7);
SELECT * FROM cats;



CREATE TABLE people (
	first_name VARCHAR(20),
	last_name VARCHAR(20),
    age INT
);

INSERT INTO people(first_name, last_name, age) VALUES('Tina', 'Belcher', 25);
INSERT INTO people(first_name, last_name, age) VALUES('Bob', 'Belcher', 45);
INSERT INTO people(first_name, last_name, age) VALUES 
('Linda', 'Belcher', 45),
('Phillip', 'Belcher', 38),
('Calvin', 'Belcher', 70);
SELECT * FROM people;

SHOW WARNINGS;


CREATE TABLE cats2 (
	name VARCHAR(100) DEFAULT 'unnamed',
    age INT DEFAULT 99
);

DESCRIBE cats2;

INSERT INTO cats2(age) VALUES(13);
SELECT * FROM cats2;
INSERT INTO cats2() VALUES();
INSERT INTO cats2(name, age) VALUES('Montana', NULL);

CREATE TABLE cats3
  (
	name VARCHAR(20) DEFAULT 'no name provided',
	age INT DEFAULT 99
  );
      
DESC cats3;
INSERT INTO cats3(age) VALUES(13);
INSERT INTO cats3() VALUES();

CREATE TABLE cats4 (
	name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
);

INSERT INTO cats4(age) VALUES(13);
INSERT INTO cats4(name, age) VALUES('Cali', NULL); -- error
INSERT INTO cats4(name, age) VALUES('Cali', 11);
SELECT * FROM cats4;
INSERT INTO cats4() VALUES();


CREATE TABLE unique_cats (
	cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

DESC unique_cats;

INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'Fred', 2);
INSERT INTO unique_cats(cat_id, name, age) VALUES(2, 'Louise', 3);
INSERT INTO unique_cats(cat_id, name, age) VALUES(3, 'James', 3);
SELECT * FROM unique_cats;


CREATE TABLE unique_cats2 (
	cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);


DESC unique_cats2;

INSERT INTO unique_cats2(name, age) VALUES('Fred', 2);
INSERT INTO unique_cats2(name, age) VALUES('Louise', 3);
INSERT INTO unique_cats2(name, age) VALUES('James', 3);
SELECT * FROM unique_cats2;


CREATE TABLE employees (
	id INT NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT 'employed',
    PRIMARY KEY (id)
);

INSERT INTO employees(first_name, last_name, age) VALUES
('Dora', 'Smith', 58);