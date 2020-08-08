SELECT COUNT(*) FROM books;
SELECT COUNT(DISTINCT(author_fname)) FROM books;
SELECT COUNT(DISTINCT author_fname, author_lname) FROM books;
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

SELECT title, author_lname FROM books;
SELECT title, author_lname FROM books GROUP BY author_lname;
SELECT author_lname, COUNT(*) AS count FROM books GROUP BY author_lname;

SELECT title, author_fname, author_lname FROM books;
SELECT author_fname, author_lname, COUNT(*) AS count FROM books GROUP BY author_lname;
SELECT author_fname, author_lname, COUNT(*) AS count FROM books GROUP BY author_fname, author_lname;

SELECT released_year, COUNT(*) AS count FROM books GROUP BY released_year;
SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) were released') AS result FROM books GROUP BY released_year;

SELECT MIN(released_year) AS min_released_year FROM books;
SELECT MAX(released_year) AS max_released_year FROM books;
SELECT MIN(pages) AS min_pages FROM books;
SELECT MAX(pages) AS max_pages FROM books;

SELECT MAX(pages), title FROM books; -- this is bad, don't do it this does not work
-- this is the solution to the query above, use subquery in such situation
SELECT * FROM books 
WHERE pages = (SELECT MIN(pages) FROM books);

SELECT title, pages FROM books 
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT * FROM books ORDER BY pages ASC LIMIT 1;
SELECT * FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(author_fname, ' ', author_lname) AS full_name, MIN(released_year) AS released_year 
FROM books 
GROUP BY author_fname, author_lname;

SELECT CONCAT(author_fname, ' ', author_lname) AS full_name, MAX(pages) AS max_pages 
FROM books 
GROUP BY author_fname, author_lname;

SELECT SUM(pages) as pages_total FROM books;
SELECT SUM(released_year) as all_years_total FROM books;

SELECT CONCAT(author_fname, ' ', author_lname) AS full_name, SUM(pages) AS total_pages_written 
FROM books 
GROUP BY author_fname, author_lname;

SELECT AVG(released_year) as average_release_year FROM books;
SELECT AVG(pages) as average_pages_per_book FROM books;

SELECT released_year, AVG(stock_quantity) AS average_stock_quantity 
FROM books 
GROUP BY released_year;

SELECT CONCAT(author_fname, ' ', author_lname) AS full_name, AVG(pages) AS average_pages_per_book 
FROM books 
GROUP BY author_fname, author_lname;

SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) AS total_books 
FROM books 
GROUP BY released_year;

SELECT SUM(stock_quantity) AS total_of_books FROM books;

SELECT CONCAT(author_fname, ' ', author_lname) AS full_name, AVG(released_year) AS average_released_year
FROM books 
GROUP BY author_fname, author_lname;

SELECT CONCAT(author_fname, ' ', author_lname) AS full_name, pages
FROM books 
WHERE pages = (SELECT MAX(pages) FROM books); 

SELECT released_year, COUNT(*) AS total_books, AVG(pages) AS average_pages_per_book
FROM books 
GROUP BY released_year;