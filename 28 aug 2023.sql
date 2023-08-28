show databases;
use sakila;
show tables;
select * from actor;

-- first Question actor id must be between 2 to 7 and name nick or edo 
select * from actor where
(actor_Id between 2 and 7) and (first_name = 'Nick' or first_name = 'ed');

-- second Question  in last name a & e na ho
select * from actor where  last_name not like '%a%' 
and last_name not like '%e%' ;

-- third Question first not be grace , methu ,joy and actor id less than 15
select * from actor where not first_name in ('grace' , 'matthew', 'joy') and actor_id <=15;

-- fourth Question last name does not consist a letter and first name does not consist of i letter and actor id in range of 10 to 20
select * from actor where first_name not like '%i%' and last_name not like '%a%'
 and actor_id between 10 and 20;
 
 
 select * from city 
 where (city_id = 3 or city_id =4 )
 and country_id = 60;
 select fid ,title from film_list
 where fid < 7 and (fid =4 or fid = 6);
 
 select * from film_list;
 
 -- order by clause => sort ascending or descending
 
 select * from film_list order by category a;
 select * from film_list order by category desc;
 
-- defalut order by is asc and hyperparameter can be desc

select * from film_list order by 5;
select fid, title, category from film_list  order by price ;

select * from address;
desc address;
select * from address order by district;
-- preority to first then acoding to same district then sort by address_id

select district , address, address_id from address 
order by district,address_id;

select district ,address ,address_id from address
order by district , address_id desc;
select district ,address ,address_id from address
order by district desc , address_id asc;

select * from address
limit 3 ;
select * from address limit 3 where  order by city_id;
-- visa versa in , and offset 
select * from address limit 3,2 ;
select * from address limit 5 offset 3;

# tabel => dual dummy table => logic
select 2+2  from dual ;

select now() from dual; -- current time of the system
-- pseduo column => column => specific meaning
-- already avaialbe with your system 