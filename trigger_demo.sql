create database trigger_demo;
use trigger_demo;

create table users
(
	username varchar(100),
    age int
);
insert into users(username,age) values ("nhat",23),("nhi",16);

delimiter $$
create trigger must_be_adult
before insert on users for each row
begin
	if new.age<18
    then
		signal sqlstate '45000'
			set message_text='Must be an adult!';
	end if;
end;
$$
delimiter ;

insert into users(username,age) values ("sue",54);
insert into users(username,age) values("yang",14);