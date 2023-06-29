select distinct author_lname, author_fname
from books;

SELECT author_fname, author_lname FROM books 
ORDER BY author_lname, author_fname;

select title, author_fname from books where author_fname like "%da%";

select title, stock_quantity from books where stock_quantity like "____";

select title from books where title like "%\%%";

select title from books where title like "%stories%";

select title, pages from books order by pages desc limit 1;

select distinct
	concat
		(
			title,
            ' - ',
            released_year
        ) AS summary
from books
order by released_year desc limit 3;

select  title, author_lname from books where author_lname like"% %";

select title, released_year, stock_quantity from books order by stock_quantity limit 3;

select title, author_lname from books order by author_lname, title;

select
	concat
    (
		"MY FAVORITE AUTHOR IS ",
        upper(author_fname),
        " ",
        upper(author_lname)
    ) AS yell
from books
order by author_lname;