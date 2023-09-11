-- group by is aggregate function 
use world;
select * from country;
select count(continent) from country;
select distinct(continent) from country;
select continent  from country group by continent;
select continent ,count(*), sum(population)from country group by continent;
-- aggrigate data pe where caluse ni chal sakta
select continent ,count(*), sum(population)from country group by continent
having count(*)>50;

use sakila;
show tables;
desc actor;
desc actor_info;
select first_name from actor limit 3;
select first_name from actor_info order by first_name limit 3;


-- union
select first_name from actor
union 
select first_name from actor_info;

create table xyz(id int) ;
insert into xyz values(15);
create table abc(id int) ;
insert into abc values(10);

select * from xyz 
union 
select * from abc;

-- it apply automatic distinct in union  by defalut you get distinct values 
select * from xyz 
union all
select * from abc;
-- union all gives comman values as per times they are
-- number of column must be same
-- if the data type is different then it type cast the datatype and gives the union values mostly in string ( not in orecle)


select * from xyz
intersect 
select * from abc;
-- gives comman value of the columns 

select * from xyz
except 
select * from abc;
-- it gives distinct value of first table but it  does'nt include the second table distinct values 

select * from xyz;
select * from abc;
