SELECT title, released_year FROM books WHERE released_year != 2017;
SELECT title, author_lname FROM books WHERE author_lname = 'Harris';
SELECT title, author_lname FROM books WHERE author_lname != 'Harris';

SELECT title FROM books WHERE title LIKE '%the%';
SELECT title FROM books WHERE title NOT LIKE '%the%';

SELECT * FROM books WHERE released_year > 2000;
SELECT * FROM books WHERE released_year > 2000 ORDER BY released_year;
SELECT * FROM books WHERE released_year >= 2000 ORDER BY released_year;

SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;
SELECT 99 < 1; -- returns 1 or zero, true or false
SELECT 'a' > 'b';
SELECT 'A' > 'a';
SELECT 'b' > 'a';

SELECT * FROM books WHERE released_year < 2000;
SELECT * FROM books WHERE released_year < 2000 ORDER BY released_year;
SELECT * FROM books WHERE released_year <= 2000 ORDER BY released_year;

SELECT 3 < -10;
SELECT -10 < -9;
SELECT 42 <= 42;
SELECT 'h' < 'p';
SELECT 'Q' < 'q';

SELECT * FROM books 
WHERE author_lname = 'Eggers' 
AND released_year > 2010;

SELECT 1 < 5 AND 7 = 9;
SELECT -10 > -20 AND 0 <= 0;
SELECT -40 <= 0 AND 10 > 40;
SELECT 54 <= 54 AND 'a' = 'A';

SELECT * FROM books 
WHERE author_lname = 'Eggers' 
AND released_year > 2010 
AND title LIKE '%novel%';

SELECT * FROM books 
WHERE author_lname = 'Eggers' 
OR released_year > 2010;

SELECT 40 <= 100 OR -2 > 0;
SELECT 10 > 5 OR 5 = 5;
SELECT 'a' = 5 OR 3000 > 2000;

SELECT * FROM books 
WHERE author_lname = 'Eggers' 
OR released_year > 2010 
OR stock_quantity > 100;

SELECT * FROM books WHERE released_year >= 2004 AND released_year <= 2015;
SELECT * FROM books WHERE released_year BETWEEN 2004 AND 2015;
SELECT * FROM books WHERE released_year NOT BETWEEN 2004 AND 2015 ORDER BY released_year;

SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01'; -- this works
SELECT name, birthdt FROM people 
WHERE birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME); -- but this is preferred version

SELECT title, author_lname FROM books 
WHERE author_lname = 'Carver' 
OR author_lname = 'Lahiri' 
OR author_lname = 'Smith';

SELECT title, author_lname FROM books 
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT title, released_year FROM books 
WHERE released_year IN (1945, 1985, 2017);

SELECT title, released_year FROM books 
WHERE released_year NOT IN (1945, 1985, 2017);

SELECT title, released_year FROM books 
WHERE released_year >= 2000 
AND released_year % 2 != 0;

SELECT title, released_year, 
		CASE 
			WHEN released_year >= 2000 THEN 'Modern Lit'
            ELSE '20th Century Lit'
		END AS GENRE
FROM books;

SELECT title, stock_quantity, 
		CASE 
			WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
            WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
            ELSE '***'
		END AS STOCK
FROM books;

SELECT 10 != 10;
SELECT 15 > 14 AND 99 - 5 <= 94;
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;

SELECT * FROM books WHERE released_year < 1980;

SELECT * FROM books WHERE author_lname IN('Eggers', 'Chabon');

SELECT * FROM books 
WHERE author_lname = 'Lahiri' 
AND released_year > 2000;

SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

SELECT * FROM books 
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

SELECT title, author_lname, 
		CASE 
			WHEN title LIKE '%Just Kids%' OR title LIKE '%Heartbreaking Work%' THEN 'Memoir'
			WHEN title LIKE '%stories%' THEN 'Short Stories'
            ELSE 'Novel'
		END AS TYPE
FROM books;

SELECT author_lname, 
		CASE 
			WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*), ' book') 
            ELSE CONCAT(COUNT(*), ' books') 
		END AS COUNT
FROM books GROUP BY author_fname, author_lname;