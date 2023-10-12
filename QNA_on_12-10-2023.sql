-- Q1 How many movies a user has worked
-- Actor and film_actor table
-- Number of movies should me more than 3

use sakila;
show tables;
select * from actor;
select * from film_actor;
select a.actor_id,a.first_name, a.last_name,count(b.film_id) as num from actor as a
join film_actor as b  using(actor_id)
group by actor_id having num >3 ;


-- Q2.Get all the information of user with the maximum 
-- and minium salary (id , name, email, salary)
show databases;
use testdb;
show tables;
create table employ (id INT AUTO_INCREMENT PRIMARY KEY,
name varchar(255) ,email varchar(255) ,salary decimal(10, 2) );
insert into employ (name, email, salary) VALUES
    ('John Doe', 'johndoe@example.com', 60000.00),
    ('Jane Smith', 'janesmith@example.com', 55000.00),
    ('Bob Johnson', 'bobjohnson@example.com', 62000.00),
    ('Alice Brown', 'alicebrown@example.com', 58000.00),
    ('Charlie Davis', 'charliedavis@example.com', 63000.00),
    ('Eva Wilson', 'evawilson@example.com', 70000.00),
    ('Michael Lee', 'michaellee@example.com', 54000.00),
    ('Olivia White', 'oliviawhite@example.com', 67000.00),
    ('William Moore', 'williammoore@example.com', 64000.00),
    ('Sophia Taylor', 'sophiataylor@example.com', 72000.00),
    ('Liam Anderson', 'liamanderson@example.com', 58000.00),
    ('Emma Martinez', 'emmartinez@example.com', 65000.00),
    ('James Garcia', 'jamesgarcia@example.com', 71000.00),
    ('Oliver Hernandez', 'oliverhernandez@example.com', 59000.00),
    ('Ava Lopez', 'avalopez@example.com', 75000.00),
    ('Benjamin Gonzalez', 'benjamingonzalez@example.com', 56000.00),
    ('Charlotte Perez', 'charlotteperez@example.com', 63000.00),
    ('Mason Sanchez', 'masonsanchez@example.com', 68000.00),
    ('Harper Adams', 'harperadams@example.com', 71000.00),
    ('Liam Wilson', 'liamwilson@example.com', 59000.00);
select * from employ;
select * from employ where salary=(select max(salary) from employ)
 or salary=( select min(salary) from employ);

-- Q3 Calculating the total population where the total population should be more
-- than 1000  and there should be more than 2 city in each code
use world;
show tables;
select * from city;
select * from country;
select CountryCode,sum(city.Population) as population,count(city.name) 
as num_city from city join country on 
CountryCode = Code  group by CountryCode 
having population>1000 and num_city> 2;


-- Q4 Finding all the country code where
-- the number of city in each country should be greater than or equal tol the
-- city present in each country code ” AFG”, ”NLD”, “ARE”  and “BGD”  ( use country table)

select * from city;
select CountryCode , count(name) as num from city group by CountryCode having CountryCode ='AFG'or
CountryCode ='NLD'or CountryCode ='ARE' or CountryCode ='BGD' ;

select CountryCode , count(name) as num from city group by CountryCode having  num >= all 
(select count(name) as num from city group by CountryCode having CountryCode ='AFG'or
CountryCode ='NLD'or CountryCode ='ARE' or CountryCode ='BGD') ;

-- Q5 Create a table with  id, name, salary, dept
-- insert all the data for all the column value
-- Get the id, salary and the salary_percent of every employee
-- here salary_percent should be percentage with employee_id 2;
use testdb;
create table abc (id int  auto_increment primary key,
name varchar(30), salary decimal(10,2), dept varchar(30));
insert into abc values (1, "John Doe", 50000.00, "HR"),
    (2, "Jane Smith", 60000.00, "Finance"),
    (3, "Bob Johnson", 55000.00, "Marketing"),
    (4, "Alice Brown", 65000.00, "IT"),
    (5, "Ella Davis", 70000.00, "Sales"),
    (6, "Mike Wilson", 48000.00, "IT"),
    (7, "Sarah Lee", 62000.00, "HR"),
    (8, "Tom Clark", 54000.00, "Finance"),
    (9, "Olivia White", 72000.00, "Marketing"),
    (10, "James Smith", 55000.00, "Sales"),
    (11, "Grace Allen", 61000.00, "HR"),
    (12, "William Turner", 58000.00, "IT"),
    (13, "Lily Baker", 68000.00, "Finance"),
    (14, "Daniel Moore", 53000.00, "Marketing"),
    (15, "Sophia Hall", 59000.00, "Sales"),
    (16, "Matthew Harris", 65000.00, "HR"),
    (17, "Ava King", 56000.00, "IT"),
    (18, "Liam Parker", 70000.00, "Finance"),
    (19, "Chloe Scott", 54000.00, "Marketing"),
    (20, "Ethan Green", 61000.00, "Sales")
;
select * from abc;
select id ,salary,
 round(concat(((salary/(select salary from abc where id =2))*100),'%'),2) 
 as percentage
 from abc;
 
 
-- Q6 use salaries table find out the the max, sum, avg salary 
-- for each person in every month  from the from_date column
-- that should have the to_date year to be before 1999
use employees;
show tables;
select * from salaries;
select emp_no,sum(salary), avg(salary),
 max(salary) from salaries where
 year(from_date)<1999 group by emp_no ;