use sakila;
desc film;
desc inventory;
select film.film_id,title from film;
select film_id,last_update from inventory;
-- normal here
select title, inventory.film_id, inventory.last_update from 
film inner join inventory using (film_id);

select title, count(rental_id ) from film inner join 
inventory using(film_id) inner join rental using (inventory_id)
group by title;

select * from film;

select * from inventory;

select title, count(rental_id ) as totalcount from film inner join 
inventory using(film_id) inner join rental using (inventory_id)
group by title having totalcount>15 order by totalcount desc limit 3;

select * from customer ;

select * from film_category;

select cust.customer_id , rental.rental_id , cust.email , ivn.film_id ,
film_category.category_id, category.name from 
customer as cust 
inner join rental using(customer_id) 
inner join inventory as ivn using (inventory_id) 
inner join film_category using (film_id)
inner join category using (category_id) ;

select  cust.email ,count(film_category.category_id) as moviecount, category.name from 
customer as cust 
inner join rental using(customer_id) 
inner join inventory as ivn using (inventory_id) 
inner join film_category using (film_id)
inner join category using (category_id)
group by email ,name having moviecount >2 ;


create table employee(eid int, ename varchar(20) , email varchar(20) , manager_id int);
insert into employee values( 1, 'Tushar', 'tusahar@gamil.com', null);
insert into employee values( 2, 'Anshuman', 'Anshuman@gamil.com', 1);
insert into employee values( 3, 'Sonu', 'Sony@gamil.com', 4);
insert into employee values( 4, 'Deepak', 'deepak@gamil.com', 3);

select * from employee;
select emp.eid, emp.ename , emp.manager_id , manager.eid , manager.ename from 
employee as emp , employee as manager 
where emp.manager_id = manager.eid;

select email, name as 

-- single result 
