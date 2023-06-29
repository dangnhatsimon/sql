use data_type;
Create table inventory(
	item_name varchar(100),
    price decimal (8,2),
    quantity int
);
select curtime() as "Current time";
select curdate() as "Current date";
select dayofweek(curdate()) as "Day of week";
select dayname(curdate()) as "Day name of week";
select date_format(now(),'%m/%d/%Y') as "Today";
select date_format(now(),'%M %d at %h:%i') as "Today";

Create table tweets(
	content varchar(100),
    username varchar(100),
    created_at timestamp default now()
);