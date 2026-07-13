-- DATE FUNCTION-- 

-- NOW() RETURN the date and time --
select now() as currentdate from dual;

-- curtime() return only time--
select curtime() as curtimes from dual;

-- curtime() return only date--
select curdate() as currentdate from dual;

 use ds_batch;
create table product(
pid int primary key,
pname varchar(23),
price float,
order_date datetime,
ship_date datetime);

describe product;

insert into product values
(101,'bottle',100,'2026-01-01','2026-01-05'),
(102,'airpods',3600,'2026-02-23','2026-03-04'),
(103,'shoose',2560.67,'2026-02-23','2026-02-05'),
(104,'fruits',500,'2026-05-01','2026-05-01'),
(105,'toys',6715.95,'2026-04-14','2026-04-25'),
(106,'acccerios',100,'2026-11-01','2026-11-08');


select * from product

-- extreact date and time as field e.g.YEAR,MONTH,DAY from a date time value

select *, extract(day from order_date) as days from product;
select *, extract(year from order_date) as years from product;
select *, extract(month from order_date) as months from product;

-- date add its add date --
-- this function or query add  and remove months or years on your data--
select *,date_add(ship_date ,interval 5 year ) as upcoming_year from product
select *,date_add(ship_date ,interval -5 year ) as privious_year from product 

select *,date_add(ship_date ,interval 5 month ) as upcoming_month from product 
select *,date_add(ship_date ,interval -5 year ) as privious_year from product 

select *,date_add(ship_date ,interval 5 day ) as upcoming_days from product ;
select *,date_add(ship_date ,interval -5 day ) as upcoming_days from product ;


-- date_format () taht is used for custom format--
select date_format(now() ,'%d-%M-%Y %T %p') as formatedate

select * , date_format(order_date,'%d-%M-%Y') as formatedate from product