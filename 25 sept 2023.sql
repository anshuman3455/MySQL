show databases;
use employees;
show tables;

-- co related subquery
select * from departments;
select count(*) from departments;
select count(*) from departments where exists 
(select * from dept_emp );
select count(*) from departments where exists 
(select * from dept_emp where emp_no <100);

use sakila;
show tables;
select first_name , last_name from staff;
select first_name , last_name from staff 
where exists (select * from customer 
where customer.first_name = staff.first_name and
customer.last_name = staff.last_name);

select * from inventory;
select * from film;
select inventory.film_id,count(*) from inventory, film 
where inventory.film_id = film.film_id 
group by film_id;
select count(*) from film where not exists 
(select count(*) from inventory , film 
where inventory.film_id = film.film_id 
group by inventory.film_id having count(*) >8);

-- sub querry from caluse
use employees;
select * from (select emp_no, year(birth_date)  from employees) as xyz;

select id from 
(select emp_no as id, year(birth_date) as sal from employees) as xyz;

use sakila;
select amount , film_id 
from payment join rental using (rental_id) 
join inventory using (inventory_id)
join film using (film_id);

select sum(amount) from (select amount , film_id 
from payment join rental using (rental_id) 
join inventory using (inventory_id)
join film using (film_id))as xyz;

-- case statement
use sakila;
show tables;
select payment_id , rental_id ,amount from payment;

select 
	case 
    when rental_id = 76 then rental_id+ 10
    when rental_id >= 1000 then rental_id +100
    else rental_id
    end "newcol",
	rental_id, payment_id, amount from payment ;
    
select ceil(192.23) from dual;
select floor(192.23) from dual;
select round(192.4634,1) from dual;
select round( 154.324 , -1 ) from dual;
select round(155.324 ,-1) from dual;
select round(166.434 , -2) from dual;
select round(166.432 , -3) from dual;
select round(666.432 , -3) from dual;
select mod(107,20) from dual;
select mod(70,20) from dual;
select truncate(343.434 ,-1) from dual;
select truncate(349.323, -1) from dual;

 -- get employee no first name and full name of every person where birth year is greater than birth year of emp id 1003 
 -- and
-- where the hire year of emp>1005
select * from employees;
select first_name , last_name from employees where year(birth_date) > (select year(birth_date) from employees where emp_no= 10003) and  
year(hire_date) < (select year(hire_date) from employees where emp_no = 10005);


-- get the information of those user where the hire year is greater among all the hire year of emp_no 10003 to 10007
select * from employees;
select * from employees where year(hire_date) > 
all (select year(hire_date) from employees where emp_no between 10003 and 10007);

-- find out emp_no  department no dept name of those ueser who has work into my company more than 28 year]
select * from employees;
select * from employees where 28 >  all (select ( select  year(hire_date) from employees) , (select year(now())  from dual)from employeees)  ;
select year(now()) from dual;
 select  year(hire_date) from employees;
 
 select * from dept_emp;
select emp_no,dept_no,(select year(now())-year(from_date)) from dept_emp where (select year(now())-year(from_date))>28;

select year(now())-year(from_date) from dept_emp;

-- find out the emp_no departmetn no and name of employ and the next working monday from date column
 

-- find out the emp name emp no deparment name and the year total no of month he has worked inot your 
-- compnay only for those user where the total no of months of working id greater than 400;

-- make a foregin key of a table for making a relationship between  another table

show tables;

select * from dept_emp;

select year(now())-year(from_date) from dept_emp;