--  Join -- 
-- a join clausae is use for combining two or more table based on a related column between them --
-- Types of join--
-- inner join,equi join,outer join,left outer join,right outer join ,full outer join, --

-- 1.Inner Join :- a inner join returns comman records from both table and it uses on cluse 
/* syntax :- select col1,col2 
            from t1
           inner join t2
           on t1.col1 = t2.col2 */
 
use ds_batch

select * from customers;
select * from orders;

-- to find order & customers details of those cust have placed orders--
select cid,oname,price
from customers c
inner join orders o
on c.cid = o.cust_id

 -- to find orders and customers details of those cust have placed orders 
 -- and price  > 5k & city = pune 
 
 select cid,oname,price,address
 from customers c
 inner join orders o
 on c.cid = o.cust_id
 where o.price > 1000  and c.address = 'pune';
 
 -- to find orders and customers details of those cust have placed orders 
 -- along with qty purched
 
 select cid,count(cust_id) as qty 
 from customers c
 inner join orders o
 on c.cid = o.cust_id
 group by cid;
 
  -- to find orders and customers details of those cust have placed orders 
 -- along with qty purched & total price > 2k
 
select cid,count(cust_id) as qty ,sum(price) as total_price
 from customers c
 inner join orders o
 on c.cid = o.cust_id
 group by cid
 having  sum(price)> 20000
 

-- Equi join-- 
-- it also retrive the matching column values of multiple tables the join condition all the comparision operator present in the where cluse
-- on the select statement
/*syntax :- select col1,col2 
            from table1 ,table2
           where t1.col1 = t2.col2 */
 -- to find order & customers details of those cust have placed orders--
select cid,oname,price
from customers c , orders o
where c.cid = o.cust_id          
           
 -- to find order & customers details of those cust have placed orders--
 -- & total_price > 5000 sort data by price
 select cid,sum(price) as  total_price
from customers c , orders o
where c.cid = o.cust_id 
group by cid
having sum(price) >5000
order by sum(price) desc

-- to find orders and customers details for each customer who has placed atlest two orders--
select cid,count(cust_id) as qty 
from customers c,orders o 
where c.cid = o.cust_id 
group by cid
having qty >= 2;

-- - to find orders and customers details for each customer who has placed atlest two orders--
-- & total price must br > 3000 and sort price in desc 
select cid,count(cust_id) as qty ,sum(price) as total_price
from customers c,orders o 
where c.cid = o.cust_id 
group by cid
having qty >= 2 and total_price > 3000 
order by total_price desc;


-- SELF JOIN -- 
-- self join mens join a table to itself --
-- syntax :-

use ds_batch;

-- display orders name and their price .--
select o1.oname,o2.price
from orders o1 ,orders o2
where o1.oname = o2.oname;

-- cross join -- 
-- cross join appiles where the two tables have a no join condition the cross join return the cartesian product 
-- of the two tables ,cartesian product where each row of one table combines with each row of the other table
-- suppose table 1 contain 10 rows and table 2 contain 10rows then result will be 100 rows 
-- corss join not have to use filter like where ,having

-- cross join on customers and orders table --
select cid,oname 
from customers 
cross join orders;

-- Outer join --
-- Left Outer Join :- it is also known as left join the left outer join returns all the rows from the left table and matching records from 
-- right table 
/* syntax :- select col1,col2
            from table1 
            left join table2s
            on table1.column = table2.column */
  
  
  -- left join --
  -- to find aal the records from customers tables who have placed order or not --
   select cid,oname,price
   from customers c 
   left join orders o 
   on c.cid = o.cust_id 
   
   -- to find aal the records from customers tables who have placed order or not --
-- purshed amout > 300

select cid ,oname ,price
from customers c
left join orders o
on c.cid = o.cust_id 
where price > 300 ;

-- to find aal the records from customers tables who have placed order or not --
-- and qty purched must be atlest 2 ,total_price > 300 ,sort data by price desc 

select cid ,count(cust_id) as qty ,sum(price) as total_price
from customers c
left join orders o 
on c.cid = o. cust_id 
group by cids
having qty >= 1 and total_price > 300 
order by total_price desc


-- RIGHT OUTER JOIN -- 
-- right Outer Join :- the right outer join returns contain all rows from the right table (according to specify condition ) 
-- and from the other table only those rows where the join condition is true
/* syntax :- select col1,col2
            from table1 
            right join table2s
            on table1.column = table2.column */
            
  -- to find all records from customer table who have plased order or not 
  use ds_batch;
  select cid,oname,price
  from orders  o
  right join customers c
  on o.cust_id = c.cid
  
-- to find all records from customer table who have plased order or not sort data on name
  select cid,oname,price
  from orders  o
  right join customers c
  on o.cust_id = c.cid
  order by oname 
  
   -- to find all records from customer table who have plased order or not sort data on name
   -- purched amount > 300 
   select cid,oname,price
  from orders  o
  right join customers c
  on o.cust_id = c.cid
  where price > 300;

     -- to find all records from customer table who have plased order or not sort data on name
-- and qty  purched must be atmost 2 , total price > 300 & sort data on price desc
  select cid,count(cust_id)as qty,sum(price) as total_price
  from orders  o
  right join customers c
  on o.cust_id = c.cid
  group by cid
  having total_price > 300 and qty < 2
  order by total_price desc
  
 -- FULL JOIN -- 
 -- the full outer join returns contain all rows from the left table and roighet table with null in field 
 -- where the join condition is not true 
 /* syntax :- select col1,col2
            from table1 
            full join table2s
            on table1.column = table2.column */
  -- full join is not supported in mysql   