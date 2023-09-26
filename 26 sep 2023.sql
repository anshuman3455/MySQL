use testdb;
show tables;

-- double (total,precision)
create table xyz(price double(5,2)); -- 3 value before point 2 for decimale values
insert into xyz values(15.2);
insert into xyz values(15.245); -- will run till 15.24
insert into xyz values(1343.3);  -- error

select * from xyz;
-- for both float and double
drop table xyz;
create table xyz(price1 float , price2 double);
insert into xyz values(42.3554 ,54.3433);
insert into xyz values(1.1234567 ,1.1234567);
select * from xyz;
-- float will take only 5 decimal values but double can take 15 decimal values
-- float space 4 byte , double 8 byte
 
 drop table xyz;
 create table xyz(birthdate date, birthtime time,
  allone datetime); -- YYYY- MM - DD
 insert into xyz values('2003-09-29',"10:23:21","2023-12-23 10:23:59");
 insert into xyz values(curdate(),curtime(),now());
 select * from xyz;
 select birthdate ,year(birthdate) , week(birthdate),
 quarter(birthdate),last_day(birthdate), Monthname(birthdate)
 from xyz;
 select birthdate, datediff(birthdate,now()),datediff(now(),birthdate)
 from xyz;
 select birthdate ,date_add(birthdate , interval 5 year),
 from xyz;
 select birthdate ,concat(year(birthdate)," ", month(birthdate)," ",
 day(birthdate)," ",week(birthdate)) from xyz;
 select birthdate , date_format(birthdate ,'%b %c') from xyz;
 -- datetime data type
 -- DATETIME data type stores the date and time values in the 
 -- format of 'YYYY-MM-DD HH:MM:SS' that’s range start from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'.
  
  -- Time stamp data type
-- TIMESTAMP data type is used to store date and time values. TIMESTAMP has a range of '1970-01-01 00:00:01'
-- UTC to '2038-01-19 03:14:07' UTC (Coordinated Universal Time).

create table captions ( text varchar(150) , create_at 
timestamp default current_timestamp);
insert into captions values( 'Hey' , '2002-12-11 10:23:53');
insert into captions(text) values( "hey2");
select * from captions;

create table caption2 ( text varchar(150) , create_at timestamp
default current_timestamp, update_at timestamp on update current_timestamp);

insert into caption2(text , create_at) values('hey', now());
update caption2 set text='hey2';
select * from caption2;
