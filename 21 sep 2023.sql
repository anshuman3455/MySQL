show databases;
use employees;
show tables;
select * from employees;

select hire_date from employees where emp_no = 10003;

select * from employees where hire_date > '1986-08-28';

-- nested sub query
select * from employees where 
hire_date >(select hire_date from employees where emp_no = 10003);
-- combined two queires;

select* from employees where first_name = "Georgi" and birth_date
 ='1953-09-02';
 
select * from titles;

select title from titles where emp_no=10001;

select * from titles 
where title = (select title from titles where emp_no=10001);
select * from titles 
where titles = (select title from titles where emp_no 10001,10002);
-- will give error because i have two result so i can not use =,>,<,<=,<= i we need to have only one output 
-- we use other operators when i have more then one result in subquery
-- 1. any (if have any result in subquery it will run)
select * from titles where
title = any (select title from titles where emp_no in (10001,10002));

-- understanding it more. 
select * from salaries where emp_no = 10002;


select * from salaries where salary=(select salary from salaries where emp_no=10002);
-- it will give coz we have multiple values in subquery.
select * from salaries where salary=Any(select salary from salaries where emp_no=10002);
-- we get the users who has salaries equal to the salary of subquery.
select * from salaries where salary>Any(select salary from salaries where emp_no=10002);
-- >any mean greater then the salary of minimum salary of subquery. greater then 65828 which is lowest in subquery.

select * from salaries where salary< any(select salary from salaries where emp_no=10002);
-- <any mean less then the salary of maximum salary of subquery. minimum  then 72527 which is greatest in subquery.
select * from salaries where salary>All(select salary from salaries where emp_no=10002);