
use world;
select * from actor;
select * from film where title like "A%R";
select * from city;

--  select x, y, z,
    case
        when x + y > z AND x + z > y AND y + z > x THEN 'Yes'
        else 'No'
    end as 'triangle'
from triangle;

desc city;
select * from country;
select * from city;
select code, name from country;
select name, countrycode from city;

select country.code, country.name,city.name from country,city 
where country.code = city.countrycode;
select country.code, country.name,city.name from country
join city on country.code = city.countrycode;

create table student(id int, name varchar(20), dept varchar(20));

insert into student values(10,"tushar","hr"),
(11,"aman","developer"),(12,"shyam","hr"),(13,"naina","CTO");

create table project(dept varchar(20), name varchar(29));
insert into project values("hr","website"),
("developer","application"),("finance","account");
select * from project;
select *from  student;

select s.id,s.name,s.dept,p.name from student as s 
, project as p;
select s.id,s.name,s.dept,p.name from student as s 
, project as p where s.dept=p.dept;

select s.id,s.name,s.dept,p.name from student as s 
join project as p on s.dept=p.dept;

select s.id,s.name,s.dept,p.name from student as s 
left join project as p on s.dept=p.dept;

select s.id,s.name,s.dept,p.name from student as s 
right join project as p on s.dept=p.dept;

select s.id,s.name,s.dept,p.name from student as s 
join project as p using (dept);

select * from student  
natural join project ;

use employees;
select * from employees;
use sakila;

select * from film;
select * from inventory;
select * from rental;

-- tile of 130 , 408

select f.title from film as f join inventory as i using
 (film_id) join rental r using(inventory_id) where
 customer_id in(130,408) ;
 
 
 -- ddl  create drop alter truncate
 -- DMl  insert , update , delete
 -- delete vs drop vs truncate
 
 

drop table student;
truncate table project;
show tables;
select * from project;
alter table project add id int;
insert into project value (' ','uname',1);
desc project;
update project set dept = 'hr',id = 2 where dept =' ';
delete from project;
select * from project;
drop table project;

-- fast = drop> truncate > delete
use sakila;
select * from film;
select rental_duration from film ;
select * from film where rental_rate > 0.99;
select * from film where film_id=1;
select * from film where rental_rate >
(select rental_rate from film where film_id=1);
 -- now get the movie title of the movie whose length is 86 and 
 -- replacement cost is 20,99--
select title from film where length= 
(select length from film where replacement_cost = 20.99 ) and replacement_cost =
(select replacement_cost from film where length = 86);

-- get the rental id and rental date ,customer id for those perticuar user where the return data is more than rental date for 30 days;
select * from film;
select * from ;
show tables;
select * from rental;
select rental_id,rental_date, customer_id where rental_id =
(select rental_id from rental where  return_date - rental_date >30);

select rental_id , rental_date , customer_id , return_date from rental
where return_date > (select rental_date from rental where rental_id = 330);

-- get the email id of the customer who has rented a movie
select * from rental;
select * from customer;
select email from customer c join rental  r using(customer_id);
select * from film;
select title from film join inventory using
 (film_id) join rental using (inventory_id)
where rental_id = (select max(rental_id)
  from rental customer  where email = "MARY.SMITH@sakilacustomer.org" );
 
 -- select the contitnet where number of coutire is greater than contitnet  the numbeer of the continent of north america
 
use world;
select * from world;
use world;
select * from country;

  
select continent , count(name) from country group by continent having count(*) > 
(select count(Continent) from country where Continent= 'North America');

create table a;

-- >any more than the minimum value of result set
-- < any (less than the maximum value of result set
-- < all (less than the maximum value of result set)
-- > all (more than the max of result set)
use employees;
select * from employees;
select * from titles;
show tables;

drop table employ;
create table employ(id int primary key auto_increment,
dept varchar(20), salary int);

insert into employ(dept, salary) values("hr",200),
("hr",300),("hr",100),
("marketing",70),("marketing",50),
("marketing",200),("marketing",400),
("dsa",150),("dsa",120),
("dsa",40),("dsa",90),("dsa",500);
select * from employ;
select avg(salary) from employ;
select id,dept, salary, avg(salary)  over (),
min(salary) over() from employ;
select id,dept,employ.* from employ;

select id,dept, salary, avg(salary)  over (partition by dept),
min(salary) over(partition by dept) from employ;

select id,dept, salary, avg(salary)  over (partition by dept) 
as Dept_avg,
avg(salary) over(partition by dept order by salary) 
as rollingTotal from employ;

select id, dept, salary, rank() over(order by salary desc)
from employ;

select id, dept, salary, rank() 
over(partition by dept order by salary desc),
dense_rank() over( partition by dept order by salary desc),
row_number() over(partition by dept order by salary desc)
from employ;
insert into employ(dept , salary)
 values('hr', 200) ,('hr',200),('hr',50);
select id,dept,salary,
ntile(4) over(partition by dept order by salary) 
from employ;

select id, dept, salary,
first_value(id) over(partition by dept order by salary desc)
 from employ;
 
select id, dept, salary, lag(salary) 
over(partition by dept order by salary desc) 
from employ;
select id, dept, salary, lead(salary) 
over(partition by dept order by salary desc) 
from employ;

select * from employee;

use test;
create table test123( id int, name varchar(20), status bool,
secondaryName varchar(20), 
constraint sakila_test123_secName_check
check ( reverse(secondaryname)= name  ));

select * from test123;

create table companies(id int) ;
insert into companies value(10);
select * from companies;

rename table companies to ncompanies;
select * from ncompanies;
alter table ncompanies rename to com;
select * from com;

alter table com add column empcount int ;
insert into com(empcount)
value(49);
select * from com;
-- alter table com add column 
desc com;

create table test(id int, name varchar(20));

insert into  test values(10,"hey"),(20,"abc"),(30,"def");
select * from test;
update test set name = 'tushar' where id = 10;
select @@autocommit;

set autocommit = 0;
set autocommit = 1;
select * from test;
update test set name = 'aman' where id = 20;
update test set name = 'anshuman' where id = 30;
select * from test;
commit;

start transaction;
update test set name = 'asdfda' where id = 10;
select * from test;
Rollback;
select * from test;kiki
 -- if ddl  dcl commit rollbakccommands 
select * from actor where first_name like "N%";

-- get all the information of the user where the joing year of user is same as employ no 100039

use employees;
select * from dept_emp;
select year(from_date) from dept_emp where emp_no = 10039;
select * from dept_emp where year(from_date) = (select year(from_date) from dept_emp where emp_no = 10039) ;

-- get the employ no and dept no and month from the emp_ where the month matcaes with the month of emp no 10039
select month(from_date) from dept_emp where emp_no = 10039;
select emp_no , dept_no, month(from_date) from dept_emp where month(from_date) = (select month(from_date) from dept_emp where emp_no = 10039);

-- get the total no of employes who has the matching month as emp no 10039
select count(emp_no)  from dept_emp where month(from_date) = (select month(from_date) from dept_emp where emp_no = 10039);

-- now get a dept no for all employees where the number of employes working is greter than the number of employees greter than D001
select * from dept_emp;
select count(dept_no) from dept_emp where dept_no = "D001";
select dept_no,count(dept_no)from dept_emp
group by dept_no having count(dept_no) > ( select count(dept_no) from dept_emp where dept_no = "D001");


create table new123(id int, name varchar(20) , salary int ) ;
insert into new123 values (10,'abc', 990) , (11,'japan', 100), (11,'dan',400), (20,'jan',343),(43,'swe',344);


use sakila;
show tables;
drop tables employee;
create table testt( id float(5,2));
insert into testt values(10.343);

-- change the name of a perosn as same for id 10
drop table employe;
create table employe (id int(2) , name varchar(10) );
insert into employe values(10,'saurab'),(11,'Uday') , (12,'Lokesh'),(13,'sonu') , (14,'sushil');
select * from employe;

update employe set name = (select name from employe where id = 12) where id = 10;
select * from employe;
-- delete all entry of id  12 to 15 and id is null 
delete from employe where id between 12 and 15 or id is null ;

use sakila;
use test;

drop table employee;
create table employee(id int, name varchar(20) default 'anshuman');


-- regex emp id primary key , emp name var30 email var 30 , gender m f o ;
drop table regex;
create table regex(emp_id int primary key , emp_name varchar(30) ,
 Email varchar(30) , Gender varchar(8), check(Gender in ('Male', 'Female', 'Other')));
 insert into regex values(11, 'Anshuman', 'anshumanrathore@gmail.com','Male');
 select * from regex;
 
 # foreign key ;
 create table customer(cid int primary key, name varchar(20) , orderid int);
 