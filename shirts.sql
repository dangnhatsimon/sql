create database shirts_db;
show databases;
use shirts_db;
create table shirts
(
	shirt_id int not null auto_increment primary key,
    article varchar (100),
    color varchar (100),
    shirt_size varchar (100),
    last_worn int
);
desc shirts;
insert into shirts (article, color,shirt_size, last_worn)
values 
    ('t-shirt', 'white', 'S', 10),
	('t-shirt', 'green', 'S', 200),
	('polo shirt', 'black', 'M', 10),
	('tank top', 'blue', 'S', 50),
	('t-shirt', 'pink', 'S', 0),
	('polo shirt', 'red', 'M', 5),
	('tank top', 'white', 'S', 200),
	('tank top', 'blue', 'M', 15);
Select * From shirts;
insert into shirts (color, article, shirt_size, last_worn) 
values ('purple', 'polo shirt','M',50);
Select article, color From shirts;
select article, color, shirt_size,last_worn from shirts where shirt_size = 'M';
