show databases;
use testdb;
 -- nested => result  
create table a (id int);
insert into a values(10);

create table b(newid int);
insert into b (newid) values (15);
select * from b where newid>10;
select * from b where newid> (select id from a) ;

-- if we enter 20 in data a
insert into a values(20);
select * from b where newid> (select id from a) ;
-- if subquerry return more than one value than operator > will not work 
-- any operator means that the condition will be ture if the operator id true for any of the values in the range
select * from b
where newid < any (select id from a);
-- any mai sabse chote se all mai sabse bade se !
-- any is like or all is like and condition 
select * from b
where newid < all (select id from a);
insert into a values(null);
insert into a values(5);
select * from a;
-- all return true if all of the subquery values meet the condition
-- querry to question ----- write a querry to find list of employee who have thier id 10001 to 10005
show databases;
use employees;

select * from employees where emp_no between (10001) and (10005);
select distinct emp_no , first_name , last_name , mgr.title 
from employees Join titles mgr using (emp_no) 
join titles nonmgr using (emp_no) 
where mgr.title = 'Manager' and nonmgr.title <> 'Manager';

select emp_no, first_name , last_name , title from 
employees join titles using (emp_no) 
where title = "Manager" and emp_no = ANY (select emp_no from employees
join titles using (emp_no) where title <> 'Manager');
-- scalar subquerry = query in parentheses that returns exactly one value
-- column subquerry =Multiple row subquery returns one or more rows to the outer SQL statement. You may use the IN, ANY, or ALL operator in outer query to handle
-- row subquerry = a subquery variant that returns a single row and can thus return more than one column value
select employees.emp_no , first_name , last_name , title 
from employees , titles 
where employees.emp_no = titles.emp_no and first_name = "Georgi"
and last_name = "Klassen" and title = 'Staff';
-- same from
select employees.emp_no , first_name , last_name , title 
from employees , titles 
where (employees.emp_no,first_name , last_name , title) = 
(titles.emp_no, 'Georgi', 'Klassen','Staff');

-- Other here ( ROW SubqQuery ) 
select mgr.emp_no , mgr.from_date, mgr.title As fd 
from titles as mgr, titles as other
where mgr.emp_no = other.emp_no;
select mgr.emp_no , mgr.from_date, mgr.title As fd 
from titles as mgr, titles as other
where mgr.emp_no = other.emp_no and mgr.title="Manager";

select mgr.emp_no , year(mgr.from_date) ,mgr.title ,other.title as fd 
from titles as mgr, titles as other 
where mgr.emp_no = other.emp_no and mgr.title = "Manager" and
mgr.title <> other.title;

select mgr.emp_no , year(mgr.from_date) ,mgr.title ,other.title as fd 
from titles as mgr, titles as other 
where mgr.emp_no = other.emp_no and mgr.title = "Manager" and
mgr.title <> other.title and year(mgr.from_date) = year(other.from_date);

select emp_no , year(from_date) as fd from titles where title = "Manager" and
(emp_no , year(from_date)) In
(select emp_no, year(from_date) from titles where title <> "Manager");

show tables;
select * from salaries;
select salary, count(salary) from salaries
group by salary;

-- find out the salary and the number of salary person for those data where
-- the total number of salary perosn of the salary is greater than or equal to 60117
select salary , count(salary) from salaries 
group by salary having count(salary) >=
(select  count(salary) from salaries 
where salary = 60117 group by salary);
