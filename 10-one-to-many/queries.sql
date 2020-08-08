CREATE DATABASE shop_db;
USE shop_db;

    CREATE TABLE customers(
        id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(100),
        last_name VARCHAR(100),
        email VARCHAR(100)
    );
    
    CREATE TABLE orders(
        id INT AUTO_INCREMENT PRIMARY KEY,
        order_date DATE,
        amount DECIMAL(8,2),
        customer_id INT,
        FOREIGN KEY(customer_id) REFERENCES customers(id)
    );
    
	INSERT INTO customers (first_name, last_name, email) 
    VALUES ('Boy', 'George', 'george@gmail.com'),
           ('George', 'Michael', 'gm@gmail.com'),
           ('David', 'Bowie', 'david@gmail.com'),
           ('Blue', 'Steele', 'blue@gmail.com'),
           ('Bette', 'Davis', 'bette@aol.com');
           
    INSERT INTO orders (order_date, amount, customer_id)
    VALUES ('2016/02/10', 99.99, 1),
           ('2017/11/11', 35.50, 1),
           ('2014/12/12', 800.67, 2),
           ('2015/01/03', 12.50, 2),
           ('1999/04/11', 450.25, 5);
           
SELECT * FROM customers WHERE email = 'george@gmail.com';
SELECT * FROM orders WHERE customer_id = 1;

SELECT cts.first_name, cts.last_name, ord.* 
FROM customers AS cts 
INNER JOIN orders AS ord ON cts.id = ord.customer_id;

SELECT cts.first_name, cts.last_name, ord.* 
FROM customers AS cts 
INNER JOIN orders AS ord ON cts.id = ord.customer_id 
WHERE cts.id = (SELECT id FROM customers WHERE email = 'george@gmail.com');

SELECT cts.first_name, cts.last_name, ord.* 
FROM customers AS cts 
INNER JOIN orders AS ord ON cts.id = ord.customer_id 
ORDER BY ord.amount;

SELECT cts.first_name, cts.last_name, ord.* 
FROM customers AS cts 
INNER JOIN orders AS ord ON cts.id = ord.customer_id 
ORDER BY ord.order_date;

SELECT cts.first_name, cts.last_name, AVG(ord.amount) AS average_amount_spent 
FROM customers AS cts 
INNER JOIN orders AS ord ON cts.id = ord.customer_id 
GROUP BY cts.id;

SELECT cts.first_name, cts.last_name, SUM(ord.amount) AS total_amount_spent 
FROM customers AS cts 
INNER JOIN orders AS ord ON cts.id = ord.customer_id 
GROUP BY cts.id 
ORDER BY total_amount_spent DESC;

SELECT cts.first_name, cts.last_name, ord.* 
FROM customers AS cts 
LEFT JOIN orders AS ord ON cts.id = ord.customer_id;

SELECT 
	cts.first_name,
    cts.last_name,
    IFNULL(SUM(ord.amount), 0) AS total_amount_spent
FROM customers AS cts 
LEFT JOIN orders AS ord ON cts.id = ord.customer_id 
GROUP BY cts.id 
ORDER BY total_amount_spent DESC;

SELECT cts.first_name, cts.last_name, ord.* 
FROM customers AS cts 
RIGHT JOIN orders AS ord ON cts.id = ord.customer_id;

DROP TABLE orders, customers;

    CREATE TABLE customers(
        id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(100),
        last_name VARCHAR(100),
        email VARCHAR(100)
    );
    
    CREATE TABLE orders(
        id INT AUTO_INCREMENT PRIMARY KEY,
        order_date DATE,
        amount DECIMAL(8,2),
        customer_id INT,
        FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE
    );
    
	INSERT INTO customers (first_name, last_name, email) 
    VALUES ('Boy', 'George', 'george@gmail.com'),
           ('George', 'Michael', 'gm@gmail.com'),
           ('David', 'Bowie', 'david@gmail.com'),
           ('Blue', 'Steele', 'blue@gmail.com'),
           ('Bette', 'Davis', 'bette@aol.com');
           
    INSERT INTO orders (order_date, amount, customer_id)
    VALUES ('2016/02/10', 99.99, 1),
           ('2017/11/11', 35.50, 1),
           ('2014/12/12', 800.67, 2),
           ('2015/01/03', 12.50, 2),
           ('1999/04/11', 450.25, 5);

SELECT * FROM customers;
SELECT * FROM orders;

DELETE FROM customers WHERE id = 1;

    CREATE TABLE students(
        id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(100)
    );
    
    CREATE TABLE papers(
        id INT AUTO_INCREMENT PRIMARY KEY,
        grade INT,
        title VARCHAR(100),
        student_id INT,
        FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE
    );
    
    DROP TABLE papers;
    
	INSERT INTO students (first_name) VALUES 
    ('Caleb'), 
    ('Samantha'), 
    ('Raj'), 
    ('Carlos'), 
    ('Lisa');
     
    INSERT INTO papers (student_id, title, grade ) VALUES
    (1, 'My First Book Report', 60),
    (1, 'My Second Book Report', 75),
    (2, 'Russian Lit Through The Ages', 94),
    (2, 'De Montaigne and The Art of The Essay', 98),
    (4, 'Borges and Magical Realism', 89);
    
    
SELECT students.first_name, papers.title, papers.grade 
FROM students
INNER JOIN papers ON students.id = papers.student_id;

SELECT students.first_name, papers.title, papers.grade 
FROM students
LEFT JOIN papers ON students.id = papers.student_id;

SELECT 
	students.first_name, 
    IFNULL(papers.title, 'MISSING'), 
    IFNULL(papers.grade, 0) 
FROM students
LEFT JOIN papers ON students.id = papers.student_id;

SELECT students.first_name, IFNULL(AVG(papers.grade), 0) AS average
FROM students
LEFT JOIN papers ON students.id = papers.student_id 
GROUP BY students.id;

SELECT students.first_name, IFNULL(AVG(papers.grade), 0) AS average, 
		CASE 
			WHEN AVG(papers.grade) >= 75 THEN 'PASSING'
            ELSE 'FAILING' 
		END AS passing_status 
FROM students
LEFT JOIN papers ON students.id = papers.student_id 
GROUP BY students.id;