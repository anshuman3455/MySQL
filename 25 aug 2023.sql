-- logical and or not
show databases;
use sakila;
show tables;
desc actor;
select * from actor;
select * from actor where first_name='NICK'
and actor_id=2;

select * from actor where first_name='NICK'
or actor_id=7;
select * from actor_info where 
film_info like 'Animation%'
and first_name='GOLDIE';

-- precidence to 'and' then or condition will follow..
SELECT * FROM actor_info
	where film_info like 'Animation%'
    and first_name= 'GOLDIE' or first_name = "Nick";
    
Select category, rating, title from film_list
	where category Like 'Sci-fi' and rating like 'PG';
    
select category, rating ,title from film_list where category like 'Sci-Fi'
	or category like 'Family' And rating Like 'PG';
    
select category, rating ,title from film_list where (category like 'Sci-Fi'
	or category like 'Family') And rating Like 'PG';
    
select 2+2*3;
select (2+2)*3;

select * from actor 
where actor_id>5 and actor_id<10;
select * from actor 
where actor_id>=5 and actor_id<=10;
select * from actor 
where actor_id between 5 and 10 ;
select * from actor 
where first_name between "B" and "D";   -- here D is exclusive because D name peple surely have after Other leter in the name

select * from actor
where actor_id=1 or actor_id=5;
select * from actor
where actor_id in (1,5);

-- <>  !=
select * from actor where actor_id!=1;
select * from actor where not (actor_id=1);