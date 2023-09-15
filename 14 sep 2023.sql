use sakila;
show tables;
desc actor;
desc actor_info; 
select * from actor;
select * from film_actor;

-- method 1
select actor.actor_id ,first_name, film_id from actor 
inner join film_actor  using(actor_id);

create table student(id int ,sname varchar(20));
insert into student values(1, 'anshuman');
insert into student values(2, 'deepak');
insert into student values(5, 'sonu');
delete from student where id =1;

create table student_hobby(id int ,hobby varchar(20));
insert into student_hobby values(1, 'cricket');
insert into student_hobby values(2, 'vollyball');
insert into student_hobby values(3, 'tenis');

select * from student;
select * from student_hobby;

-- method1 of using
select  student.id , sname, hobby from student inner join student_hobby;
select  student.id , sname, hobby from student inner join student_hobby using (id);

-- method 2 of where 

select student.id, sname, hobby from student, student_hobby
 where student.id = student_hobby.id;

-- method 3 of on

select student.id, sname, hobby from student 
inner join student_hobby on student.id = student_hobby.id;
-- equavalinent join == inner join 

-- left join
select student.id, sname ,hobby from student left join
student_hobby on student.id =student_hobby.id;

-- right join
select student.id, sname ,hobby from student right join
student_hobby on student.id =student_hobby.id;

-- full join
select student.id, sname ,hobby from student left join
student_hobby on student.id =student_hobby.id
union 
select student.id, sname ,hobby from student right join
student_hobby on student.id =student_hobby.id;

-- with alias
select a.actor_id , first_name ,last_name, film_id 
from actor as a INNER Join film_actor as f
on a.actor_id = f.actor_id;

select actor_id , first_name ,last_name, film_id , title , release_year
from
actor INNER Join film_actor using(actor_id)
inner join film using (film_id);


-- 
select id,sname,hobby
from student natural join student_hobby;
select count(*) from student inner join student_hobby;


