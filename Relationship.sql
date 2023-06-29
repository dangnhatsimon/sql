create database if not exists school;
use school;

create table if not exists students
(
	id int auto_increment primary key,
    first_name varchar(100)
);

create table if not exists papers
(
	title varchar(100),
    grade int,
    student_id int,
    foreign key (student_id) references students(id) on delete cascade
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);


select students.first_name first_name, papers.title title, papers.grade grade
from students
right join papers
on students.id = papers.student_id
order by grade desc;

select students.first_name first_name, papers.title title, papers.grade grade
from students
left join papers
on students.id = papers.student_id;

select students.first_name first_name,
ifnull(papers.title,"MISSING"), ifnull(papers.grade,0)
from students
left join papers
on students.id = papers.student_id;

select students.first_name first_name, ifnull(avg(papers.grade), 0) as average
from students
left join papers
on students.id = papers.student_id
group by students.first_name
order by papers.grade desc;

select students.first_name, ifnull(avg(papers.grade), 0) as average, 
case
	when avg(papers.grade) is null then "FALLING"
    when avg(papers.grade)>=75 then "PASSING"
    else "FALLING"
end as "passing_status"
from students
left join papers
on students.id = papers.student_id
group by students.first_name
order by papers.grade desc;

select students.first_name, ifnull(avg(papers.grade), 0) as average, 
if(avg(papers.grade)>=75,"PASSING","FALLING") as "passing_status"
from students
left join papers
on students.id = papers.student_id
group by students.first_name
order by papers.grade desc;
