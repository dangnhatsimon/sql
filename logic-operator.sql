SELECT * FROM book_shop.books;
select 10 != 10;
select 15>14 && 99-5<=94;
select 1 in (5,3) || 9 between 8 and 10;

select * from book_shop.books;
where released_year <1980;

select * from book_shop.books
where author_lname in ("Eggers", "Chabon");

select * from book_shop.books
where author_lname = "Lahiri" and released_year >2000;

select * from book_shop.books
where pages between 100 and 200;

select * from book_shop.books
where author_lname like "S%" or author_lname like "C%";

select title, author_lname,
	case
		when title like "%stories%" then "Short Stories"
        when title like "%Just Kids%" or title like "%A Heartbreaking Work%" then "Memoir"
        else "Novel"
	end as "Type"
from book_shop.books;

select title, author_lname
from book_shop.books
order by
	case
		when ;