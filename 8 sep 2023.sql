 -- By youtube Rishabh Mishra SQL
 create table del ( name varchar(20) primary key default 'rhe');
 insert into del value ('ant   ');
 insert into del value('ant  ') ;
 insert into del value('ant ');
 insert ignore del value('ant');
 select name ,length(name) from del;
 
create table del1 (name char(20) primary key default 'rhe');
insert into del1 value ('ant   ');
 insert into del1 value('ant  ') ;
 insert into del1 value('ant ');
 insert ignore del1 value('ant');
select name , length(name) from del1;

 show databases;
 drop database test;
 create database testdb;
 use testdb;
 create table jeit( id int, name varchar(10) , 
 course varchar(20), package int);
 insert into jeit values(1,'ankit','datascience',4),
 (2,'sushil','java',5), (3,'anshuman','datascience',8),
 (4,'deepak','ceo' , 25), (4 ,'uday', 'frontenc',7);
 select * from jeit;
 alter table  jeit add column  (hike_percentage int );
 alter table jeit drop column hike_percentage;
 alter table jeit modify column package float;
 update jeit set package=14 where id= 2 ;
 alter table jeit add column hike_per int ;
 update jeit set hike_per=10 where id >0;
 update jeit set hike_per= hike_per*package/id where id> 0 ;
 select * from jeit;
 update jeit set package = 19 , hike_per= 58 where id = 3;
alter table jeit add column fy_2024 float;
update jeit set fy_2024 = package where id >0;
update jeit set fy_2024 = fy_2024+fy_2024*hike_per/100 where id >0;
select * from jeit;
 
create table tips (total_bill float ,tip float ,sex varchar(10) ,
smoker varchar(4), day varchar(10), size int);
select * from tips;

select round(avg(package),2) from jeit;
select name , sum(fy_2024) as total from jeit group by
 name having total >10 order by total desc limit 2; 
select now();
select timeofday();
select current_time();
select current_date();
use sakila;
show tables;
select * from city;
desc country;
select weekofyear(last_update) from city;
show databases;
use testdb;
show tables;
select * from tips;
alter table tips add column id int  ;
insert into tips value(100,5,'female','no','w',2,6);
insert into tips value(800,30,'female','yes','t',2,2),
(10000,500,'male','yes','s',6,3),(2500,150,'male','no','f',3,4),
(600,10,'female','no','m',2,5);
select * from jeit as j inner join tips as t
on j.id = t.id;
select * from jeit as j left join tips as t
on j.id = t.id;
select * from jeit as j right join tips as t
on j.id = t.id;
select * from jeit as j left join tips as t on j.id = t.id
union
select * from jeit as j right join tips as t on j.id = t.id;

select * from jeit as j left join tips  as t on j.id = t.id 
union 
select * from jeit as j right join tips as t on j.id = t.id
where j.id is null;


create table emp (id int , name varchar(15), manager int);
insert into emp value(1,'Agni',3),
(2,'Akash',4),(3,'Dharti',2),(4,'Vayu',3);
select * from emp;
select * from emp as t1 
join emp as t2
on t2.id = t1.manager;
select t1.name,t2.name from emp as t1
join emp as t2 
on t2.id = t1.manager;

-- sub query
select avg(package) from jeit;
select * from jeit where package> 13.8;
select * from jeit where package > (select avg(package) from jeit);


 