use sakila;
show tables;
select database();

select * from actor;
select actor_id , first_name , actor_id+10 as new_id
from actor;
-- where clause
select actor_id , first_name , actor_id+10 as new_id
from actor 
where first_name > "BD";

-- not equal to !=    ,     <>
 
 -- between and in 
select actor_id , first_name , actor_id+10 as new_id
from actor
where actor_id between 3 and 7;

select actor_id , first_name , actor_id+10 as new_id
from actor
where actor_id not between 3 and 7;

select actor_id , first_name , actor_id+10 as new_id
from actor
where actor_id not in( 3 , 7);

select actor_id , first_name , actor_id+10 as new_id
from actor
where actor_id in( 3 , 7);

select actor_id, first_name, actor_id+10 as new_Id
from actor
where first_name like "A%";
-- not case sensitive 

select actor_id, first_name, actor_id+10 as new_Id
from actor
where first_name like "_Au%";
select count(*) from actor;

select actor_id, first_name, actor_id+10 as new_Id
from actor
where first_name like "_Au%" and ( actor_id = 159 or actor_id = 34);
;

select actor_id, first_name, actor_id+10 as new_Id
from actor
where ( actor_id =167 or actor_id=34)  and first_name like "Laurence";

show tables;
select * from address;o
-- get all the 
select * from address where
city_id > 115 and address like '%parkway%' and phone like '_____%'; 



-- what is database 
-- sql vs mysql  , rdbms vs dbms , type of database