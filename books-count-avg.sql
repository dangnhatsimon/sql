select distinct author_lname, author_fname, title,
count(*) 
from books 
group by author_lname;

select * from books where pages = (select max(pages) from books);
select * from  books order by pages desc limit 1;

select *, author_fname,  author_lname, min(released_year)
from books
group by author_fname, author_lname;
select distinct * from books;
select count(book_id) as "Number of books" from books;
SELECT Sum(stock_quantity) FROM BOOKS;
select released_year, count(book_id) as "Number of books  in each year" from books group by released_year;
select released_year, avg(released_year) as "Average released year for each author" from books group by author_fname, author_lname;
select concat
	(
		author_fname,
        ' ',
        author_lname
    ) AS "Who wrote longest book",
    pages
from books
where pages = (select max(pages) from books);

select released_year as "year", count(book_id) as "#books", avg(pages) as "avg year" from books group by released_year  order by released_year;