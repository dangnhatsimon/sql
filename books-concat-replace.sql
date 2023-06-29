select reverse("Why does my cat look at me with such hatred?") AS rever;
select upper("Why does my cat look at me with such hatred?") AS upp;

SELECT
  REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  ) AS repl;
  
select author_lname as forwards, reverse(author_lname) as backwards from books;

select
	concat
    (
		upper(author_fname),
        ' ',
        upper(author_lname)
    ) AS "full name is cap"
from books;

select
	concat
    (
		title,
        ' was realeased in ',
        released_year
    ) as blurb
from books;

select
	title,
    char_length(title) as "char count"
from books;

select * from books;

SELECT DISTINCT author_lname FROM books;

select distinct author_lname
from books
order by author_lname;

SELECT title, author_fname, author_lname 
FROM books ORDER BY 1;