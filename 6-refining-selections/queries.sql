INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
SELECT title FROM books;

SELECT author_lname FROM books;
SELECT DISTINCT author_lname FROM books;
SELECT released_year FROM books;
SELECT DISTINCT released_year FROM books;

SELECT author_fname, author_lname FROM books;
SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;

SELECT author_lname FROM books ORDER BY author_lname;
SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT title FROM books ORDER BY author_lname DESC;
SELECT released_year FROM books ORDER BY released_year DESC;
SELECT title, released_year, pages FROM books ORDER BY released_year;
SELECT title, released_year, pages FROM books ORDER BY released_year DESC;
SELECT title, released_year, pages FROM books ORDER BY pages DESC;
SELECT title, pages FROM books ORDER BY released_year;

SELECT title, author_fname, author_lname FROM books ORDER BY 2; -- orders by second column
SELECT title, author_fname, author_lname FROM books ORDER BY 3; -- orders by third column

SELECT author_fname, author_lname FROM books;
-- first sort by author_lname and then if there is a conflict sort by author_fname
SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;

SELECT title FROM books LIMIT 3;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5; -- just limit
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 14, 5; -- offset a.k.a. strating point + limit

SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
SELECT title, author_fname FROM books WHERE title LIKE '%the%';
-- underscore wilcard character specifies exactly one character, any character but exactly one
-- so this says give everything that has stock_quantity with 4 characters long
SELECT title, author_fname, stock_quantity FROM books WHERE stock_quantity LIKE '____';
SELECT title, author_fname, stock_quantity FROM books WHERE stock_quantity LIKE '___';
SELECT title, author_fname, stock_quantity FROM books WHERE stock_quantity LIKE '__';
SELECT title, author_fname, stock_quantity FROM books WHERE stock_quantity LIKE '_';

-- escape character
SELECT title, author_fname FROM books WHERE title LIKE '%\%%';
SELECT title, author_fname FROM books WHERE title LIKE '%\_%';

-- (235)234-0987 LIKE '(___)___-____'

SELECT title FROM books WHERE title LIKE '%stories%';
SELECT title, pages AS pages FROM books ORDER BY pages DESC LIMIT 1;
SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;
SELECT title, author_lname FROM books ORDER BY author_lname, title;
SELECT UPPER(CONCAT('My favorite author is ', author_fname, ' ', author_lname, '!')) AS yell FROM books ORDER BY author_lname;