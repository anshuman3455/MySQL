-- comman difference in drop , delete, truncate
-- alias name - nickname
-- expression => acha name(readability)
use sakila;
select first_name, concat('MR ',first_name) from actor;
-- using alias 
select first_name , concat("mr ", first_name) as fullName from actor;

select first_name , concat("mr ", first_name) as fullName from actor where fullname
'aana';
-- it will give error
-- where , join ,using caluuse not run on alias
select first_name , concat("mr ", first_name) as fullName from actor order by fullname;
-- order by will be run

-- group by
select first_name, length(first_name) from actor;
-- these are single row funcitons 

-- multirow funciton run on multiple rows at a same time.
-- combinng similar valies is called grouping, using funciton on combined group is called group function
-- when we use multiple row operation it is called group by operations
show tables;
select * from country;
 
desc country;

create table t1 (id int,city varchar(20) );
insert into t1 values(1,'hey');
insert into t1 values(2,'hey2');
insert into t1 values(null,'hey');

select count(*)  from t1;
select count(id) from t1;         
-- if we use count(*) t4hen it count null values  but count(column name) will count null values
select sum(id) from t1;
select distinct(city)  from t1;
select distinct(city),id  from t1;
select count(distinct city) from t1;
select count(distinct id) from t1;             -- distinct not count null values

use world;
select * from city;
select * from city where countrycode = 'AFG';
-- making this in simple by using group by
 select countrycode, count(id) from city group by countrycode;

select district from city
group by countrycode;
-- it will not run
select countrycode, count(id),sum(population) from city group by countrycode;
select countrycode , count(id),sum(population) as total_population from city 
group by countrycode order by total_population;

select * from city;

select countrycode,concat('country',countrycode , 'sum of population ', sum(population))  as result from city group by countrycode;

select countrycode ,count(id),sum(population) as Totalpopulation from city group by countrycode having sum(population)>500 , and count(id)>1 order 
by Totalpopulation;

use world;
select * from city;
select count(id) , countrycode from city group by countrycode;
select count(id,), countrycode, 
from city group by countrycode ;

show databases;
use testdb;
create table cat ( id int , name varchar(20));
insert into cat value(100,'Agni'),(200,'Agni'),
(200,'Vayu'),(300,'Vayu'),(500,'Vayu'),(500,'Dharti'),(700,"Dharti");
select * from cat;

select id,name,
sum(id) over(partition by name order by id) as 'Total',
avg(id) over(partition by name order by id) as 'average',
count(id) over(partition by name order by id) as 'count',
min(id) over(partition by name order by id) as 'min',
max(id) over(partition by name order by id) as 'max'
from cat;

select id,name,
sum(id) over(order by id rows between unbounded preceding and unbounded following) as 'total',
avg(id) over(order by id rows between unbounded preceding and unbounded following) as 'average',
count(id) over(order by id rows between unbounded preceding and unbounded following) as 'count',
min(id) over(order by id rows between unbounded preceding and unbounded following) as 'min',
max(id) over(order by id rows between unbounded preceding and unbounded following) as 'max'
from cat;

select id,name,
sum(id) over(order by name) as total,
avg(id) over(order by name) as 'average',
count(id) over(order by name) as 'count',
min(id) over(order by name) as 'min',
max(id) over(order by name) as 'max'
from cat;

select id ,
row_number() over(order by id) as 'row_number',
rank() over(order by id) as 'Rank',
Dense_rank() over(order by id) as 'Dense_rank',
percent_rank() over(order by id) as 'Percent_rank'
from cat;

select id,
first_value(id) over(order by id) as 'First_value',
last_value(id) over(order by id) as 'last_value',
lead(id) over (order by id) as 'Lead',
lag(id) over (order by id) as 'lag'
from cat;

select id,
lead(id,2) over (order by id) as 'LEAD',
lag(id,2) over(order by id) as 'LAG'
from cat;

show databases;
use testdb;
show tables;
select * from tips;

create table customer (id int ,first_name varchar(20),
last_name varchar(20),address_id_ int );
insert into customer values (1,'Mary','Smith',5),
(3,'Linda','Williams',7),(4,'Barbara','Jones',8),
(2,'Madan','Mohan',6),(17,'R','Madhav',9);
select * from customer;
select * from payment;
With my_cte as ( 
Select * , avg(amount) over(order by p.id) as'average_price',
Count(address_id_) over (order by c.id) as 'count'
from payment as p
inner join customer as c
on p.id = c.id
) 
select * from my_cte;


select anshuman like "_%";