show databases;

use sakila;
show tables;
-- view 
select * from actor;
select actor_id,first_name from actor;
-- creating view ,view is used to save the view of a table.
 create view actor_view as select actor_id,first_name from actor;

select * from actor_view;
create table test1(id int,name varchar(20));
insert into test1 values(1,'deepak');
insert into test1 values(2,'aman');
insert into test1 values(3,'aditya');
select * from test1;
select id from test1;
-- creating view for id from test1
create view test1_view as select id from test1;

select * from test1_view;
select * from test1_view where id=2;
insert into test1_view values(4);
select * from test1_view;
select * from test1;
-- when we insert data into view it stored in the real table;this is why 4 is also stored in test1 table too
insert into test1 values(5,'nia');
select * from test1;
select * from test1_view;

delete from test1_view where id=4;
select * from test1_view ;
select * from test1;
-- when we delete something in view it will be deleted from table too
-- view doent occupy storage it access the table only 
select * from test1_view;
-- i only have one column oin test1_view
create or replace view test1_view as select id,name from test1;
select * from test1_view;
-- here we replaced our old view with new view in new view we have both the columns

alter view test1_view as select name from test1 where id>2;
select * from test1_view;
-- alter can also be used to change view
show tables;
-- we can see the view in show tables;
-- view is also can be dropped same as tables.
 drop view test1_view;

-- lets make typical view.
select * from country;
select * from city;
select country_id,country,city_id,city from country join city using(country_id);
-- making its view.
 create view country_view as select country_id,country,city_id,city from country join city using(country_id);

select * from country_view;
insert into country_view values(9999,'yyy',34343,'japan'); -- error dega coz
-- when we make a view from join,group by,distinct,having union subquery or used any aggregation to make view we cannot update or insert in our view.
-- we can only update or insert in our view when our view is simple.
select * from test1;
insert into test1 values(null,'asds');
select count(name) from test1;
select count(id) from test1;
-- count not count null

-- replacing null  with 0 
-- if null 
select count(ifnull(id,0)) from test1;
select id from test1;

alter table test1 add column salary int;

select id,ifnull(id,0) from test1;
select count(id) from test1;
-- using coalesce
alter table test1 add column salary int;

insert into test1 values(4,null,100);
insert into test1 values(null,null,200);
insert into test1 values(100,null,null);
insert into test1 values(null,null,null);

select * from test1;
select id,name,salary,coalesce(id,name,salary) from test1;
-- coalesce returns not null values of the first one not null value of column.
-- if all columns are null it will return null.

-- question create table movieid,moviename,duration of movie,ticketprice another table customer customerid,cname,movieid,watchdate both tables  join
-- all customerid,cname,all movies name which a customer has seen  
-- get all the information of custmers whaether they watched movie or not
-- get the cid,total no of movies a person watched after 2000 year.alter
-- find out total ammount of money spend on movies and avg duration of movie he has seen
-- givet cid,cname who has watched maximum no of movies.

use testdb;
drop table movie;
create table movie(id int primary key auto_increment , name varchar(30) , duration time , price float);
insert into movie values(1,'John', '01:45:00', 9.99),
    (2,'Fukery', '02:30:00', 12.50),
    (3,'avengers', '01:55:00', 8.99),
    (4,'End games', '02:15:00', 10.25),
    (5,'Noon to moon','02:19:00',9.48),
    (6,'Comman man' , '01:01:00',15);
insert into movie values (7, 'Jurassic Park', 125, 9.49),
(8, 'Forrest Gump', 100, 8.99);


CREATE TABLE customer(customer_name VARCHAR(255),
    movie_id INT,
    watch_date DATE
);
drop table customer_watches_new;
INSERT INTO customer(customer_name, movie_id, watch_date) VALUES
('Alice Johnson', 1, DATE '2023-10-01'),
('Bob Smith', 2, DATE '2023-10-02'),
('Carol Davis', 3, DATE '2023-10-03'),
('David Wilson', 4, DATE '2023-10-04'),
('Emily Brown', 5, DATE '2023-10-05'),
('Frank Harris', 6, DATE '2023-10-06'),
('Grace Taylor', 7, DATE '2023-10-07'),
('Henry Clark', 8, DATE '2023-10-08');
select * from movie ;
select * from customer;

-- all customerid,cname,all movies name which a customer has seen 
select movie_id ,customer_name, name  from movie join customer on id = movie_id;

-- get all the information of custmers wheather they watched movie or not
select * from movie join customer on id = movie_id where id = movie_id;

-- get the cid,total no of movies a person watched after 2000 year.alter
select movie_id , count(select name from movie join customer on id = movie_id ) from customer;
select name from movie join customer on id = movie_id ;

