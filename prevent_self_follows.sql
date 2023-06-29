create database prevent;
use prevent;

create table users
(
	id int primary key auto_increment,
    username varchar(255) unique,
    created_at timestamp default now()
);

create table photos
(
	id int primary key auto_increment,
    image_url varchar(255) not null,
    user_id int not null,
    created_at timestamp default now(),
    foreign key (user_id) references users(id)
);


create table comments
(
	id int primary key auto_increment,
    comment_text varchar(255) not null,
    user_id int not null,
    photo_id int not null,
    created_at timestamp default now(),
    foreign key (user_id) references users(id),
    foreign key (photo_id) references photos(id)
);

create table likes
(
	user_id int not null,
    photo_id int not null,
    created_at timestamp default now(),
	foreign key (user_id) references users(id),
	foreign key (photo_id) references photos(id),
    primary key (user_id, photo_id)
);

create table follows
(
	follower_id int not null,
    followee_id int not null,
    created_at timestamp default now(),
	foreign key (followee_id) references users(id),
	foreign key (follower_id) references users(id),
    primary key (follower_id, followee_id)
);

create table tags
(
	id int primary key auto_increment,
    tag_name varchar(255) unique,
    created_at timestamp default now()
);
create table photo_tags
(
	photo_id int not null,
    tag_id int not null,
    foreign key (photo_id) references photos(id),
    foreign key (tag_id) references tags(id),
    primary key (photo_id, tag_id)
);

delimiter $$
create trigger prevent_self_follows
before insert on follows for each row
begin
	if new.follower_id = new.followee_id
    then
		signal sqlstate '45000'
			set message_text='You cannot follow yourself!';
	end if;
end;
$$
delimiter ;

insert into follows(follower_id, followee_id) values (4,4);