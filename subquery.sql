-- subquery & correlated query -- 

use ds_batch;
select * from employee;

-- to find the higest salary from employee table --
select max(salary) from employee;

-- to find second higest salary from employee--
select max(salary) from employee where salary < (select max(salary) from employee);

-- to find third higest salary from employee--
select max(salary) as third_higest from employee where salary<
(select max(salary) from employee where salary <
 (select max(salary) from employee));
 
 
 -- product with above avg price --
 select * from orders;
 
 -- give me those records they have avg price is greater than their price
 
 select * from orders where price >
 (select avg(price) as avg_price from orders);
 
 -- multi row sunquery --
 -- result will be in multiple rows ,often use with in,any or all operator 
 
 -- display the all customers details with therir perticular address that is pune 
 use ds_batch;
 select * from customers;
 
 select * from customers where address in 
 (select address from customers where address = 'pune');
 
 -- to find only those customer who have placed order --
 select * from customers where customers.cid in
 (select distinct cust_id from orders);
 
 -- correlated subquery --
 -- display customers details who have max purches from orders --
 
 select c.cid,o.oname,o.price
 from customers c 
 inner join orders o 
 on c.cid = o.cust_id  where c.cid in 
 (select cust_id from orders group by cust_id having sum(price) >= 
 all (select sum(price) from orders group by cust_id));
 
 
 -- genric formula to find nth higest salary  n=5 --
 select * 
 from employee e1 
 where 3-1 =( select count(distinct salary ) from employee e2 
 where e1.salary > e2.salary);