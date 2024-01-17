use sakila;
show databases;
show tables;

describe actor;
select * from actor;
select first_name , FIRST_NAME, actor_id , actor_id *10 'id' from actor;
select * from actor where actor_id %2 = 0 ;
select * from city;
select * from city where city_id > country_id;

select * from actor where actor_id between 2 and 5;
select * from actor where actor_id not between 2 and 5;

select * from actor where actor_id in (2,3,5,6,7,7,9,49494968);

select * from actor where first_name like "_A%" ;

select * from customer;
 
 -- from the customer table get the id and first name where first name is patricia or mary and custoner id should be 2
 
 select customer_id , first_name from customer where first_name in('Mary',"Patricia") and customer_id = 2;
 select customer_id , first_name from customer where (first_name ='Mary' or first_name="Patricia") and customer_id = 2;
 
 create database xyz;
 use xyz;
create table tushar(name varchar(20));
insert into tushar values('Pet'),('pettter'),('pe%') , ('pe');
select * from tushar where name like "pe%";

use sakila;
select * from customer;
select * from customer order by first_name desc;
select * from customer order by store_id desc , first_name asc;
select * from customer order by 2,3,4;
select customer_id , last_name from customer  order by 2;
 
# string function 

select first_name , last_name , email, concat(first_name,' ' , lower(last_name), ' Id=', customer_id) from customer;

select first_name , last_name, customer_id, 
concat_ws('&&', first_name, last_name , customer_id) from customer;

select length('sonu') from dual;

select char_length('sonu') from dual;

select first_name, substr(first_name,2),substr(first_name,-3) 
from actor;
select first_name,substr(first_name,2,3) from actor;
select first_name, instr(first_name,'e') from actor;
select first_name, locate('e',first_name) from actor;
select first_name, locate('e',first_name,3) from actor;

select "           hello  " from dual;
select length("           hello  ") ,
length(trim("           hello  ")) from dual;
select trim(leading ' ' from '         hello   ') from dual;
select trim(trailing ' ' from '         hello   ') from dual;
select trim(both 'h' from 'hhhhhhh hello  hhha') from dual;
select trim(both 'h' from 'hhhhhhh hello  hhh') from dual;
-- lpad and rpad
select '585985858',lpad('585985858',10,'#') from dual;
select '585985858',rpad('585985858',10,'#') from dual;
select first_name,lpad(first_name,5,'_') from actor;

select first_name, replace(first_name,'E','$') from actor;

select first_name from actor where substr(first_name,1,1) = 'S';
select ceil(11.00000001),floor(11.9) from dual;

select round(12.45234,1),round(12.4444,1) from dual;
select truncate(752.952,2) from dual;
select truncate(752.952,-1),truncate(752.952,-2),truncate(752.952,-3) from dual;


-- type of dbms 
-- dbms and rdbms 
-- what is database
-- mysql vs sql

-- string function , mathematical functions 
-- general functions / null handling function 

-- null ==> 0 / 
use sakila ;
select * from address;
select postal_code , length(postal_code) from address;
select * from address
where postal_code = '';

select * from address where address2=null;
select password , email from staff
where password is not null;
select password, ifnull(password,1000), email from staff;
select nullif('abc','abc') from dual;
select first_name, length(first_name),last_name, 
last_name, length(last_name) , 
nullif(length(first_name),length(last_name))
from actor;
select first_name,if (length(first_name)=3,'abc','no data')
from actor;

select * from payment;

select first_name, 
case first_name 
	when 'nick' then actor_id*10 
	when 'PENELOPE' then actor_id *100
    else actor_id
end as 'new_actro_id'
from actor;

select first_name, 
case  
	when first_name='nick' then actor_id*10 
	when first_name='PENELOPE' then actor_id *100
    else actor_id
end as 'new_actro_id'
from actor;

-- print the actor id firstname for the user based of certian condition if the actor id is >=2 then print actor id is more than  2
-- actor id is between 5,6,7 print actor id is more tha  5 and 7 
-- if actor id i more than 12 print actor id is more then 12 
-- else print no condiiton verified;

select actor_id ,first_name,
case
	when actor_id >= 12 then 'actor id is more then 12'
    when actor_id in (5,6,7)  then 'actor id is more than 5'
    when actor_id >= 2 then 'actor id is more than 2'
    else 'no codition is verified'
		end as 'case_check'
 from actor;

-- what is data model and type of data model(detail)
-- charectorstic of dbms
-- what are crud opration 
-- what are acid properties 