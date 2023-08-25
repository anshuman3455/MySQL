show databases;
use sakila;
show tables;
-- kese select
-- select statement
-- structure of table (desribe ______)
describe actor;
-- or 
desc actor;
select * from actor; 

select actor_id, first_name from actor;
 
 DESC ACTOR_INFO;
 -- PROJECTION AND SELECTION
 select * from actor_info;
 select actor_id , actor_id*10 from actor_info;
 select * from actor_info;
 
 -- where clause
 select * from actor_info where actor_id=2;
 
 select actor_id ,first_name
 from actor_info where actor_id>2;
 
 select * 
 from actor_info where first_name = "ED";
  -- not in orecal # case sensitive
   select * 
 from actor_info where first_name = "eD";
 
 -- dql select statement
 select database();
 show tables;
 show columns from actor;
 dEsc actor;
 select * from actor;
 select * from sakila.actor;
 select name from sakila.language;
 select * from sakila.language;
 
 -- where clause ka use kiya jata he data filtering me for example
 
 select * from language where language_id <> 3;
 select * from language where name = "English";
 select * from language where name> "I";
select * from language where name> "Iu";

select first_name from actor Where first_name > "b";

select * from film;

select * from film where title like "A%R";
select * from film where title like "%Dinosaur";
select * from film where title like "%Dinosaur%";
select * from film where title like "%family%";

select * from film where description like "%Drama%";
select title , description , release_year from film where title like "a%les";

select * From film where title like "A_E%";
select * From film where release_year like "2006";

-- filmid title reaseiye descrip
 
 select film_id, title , description , release_year From film where title like "_C%";  -- 1st ans
 select film_id, title , description , release_year From film where title like "A%AN"; 
 select film_id, title , description , release_year From film where title like "%___T";
 select film_id, title , description , release_year From film where title like "_f_i%egg";
 select film_id, title , description , release_year From film where title like "%__a__%";