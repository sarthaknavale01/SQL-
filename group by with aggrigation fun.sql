-- GROUP BY USING AGGRIGATION FUNCTION -- 
 SELECT  * from customers;
 select * from orders;
use ds_batch;
 -- to find total price of product purcherd by each customer order by desc--
 select cname,sum(price) as total_price
 from orders
 join customers
 on orders.cust_id = customers.cid
 group by cname
 order by total_price desc
 
 select cust_id,sum(price) as total_bill
 from orders
 group by cust_id 
 order by total_bill desc
 
 -- find the avg price of product purched by each customer where price must be > 4000
 select cust_id,avg(price) as avrage_price 
 from orders
 group by cust_id
 having avrage_price> 4000
 
 create table employee (
 empid int primary key,
 empname varchar(44),
 dept varchar(90),
 salary float);
 
 
 insert into employee values
(1, 'abc', 'Training', 89000),
(2, 'pqr', 'Banking', 56790.89),
(3, 'xyz', 'Training',45000.8), 
(4, 'lmn', 'Sales', 76900),
(5, 'uvw', 'Marketing', 34890.9),
(6, 'seeta', 'Banking', 47890),
(7, 'geeta', 'Sales',50000), 
(8, 'raj', 'Training', 32000);

select * from employee
 
 -- to find the total salary w.r.t department from employee table--
 select dept,sum(salary) as total_salary
 from employee
 group by dept
 
 -- to find the total salary ,no of employee ,dept w.r.t dept from emp table order by salary desc
 select dept,sum(salary) as total_salary,count(*)empid
 from employee
group by dept
order by total_salary desc

-- to find the total salary ,dept w.r.t dept from employee table where total salary >60000
-- order by total salary desc

select dept,sum(salary) as total_salary 
from employee 
group by dept
having total_salary > 60000
order by total_salary desc