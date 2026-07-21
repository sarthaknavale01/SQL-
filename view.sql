 -- views -- 
  -- views are a virtual table that are creating by querying one or more tables or view 
  /*Key Characteristics of Views
1...Virtual Table: Unlike standard tables, views do not store data physically. Instead, the data
is generated dynamically from the underlying tables whenever the view is queried.
2....Simplification: They encapsulate complex logic (like joins, unions, or filters) into a single object, 
making repetitive data retrieval much simpler.
3....Security: Views act as a security layer by restricting user access to specific columns or rows, 
effectively hiding sensitive information in the base tables */

 select * from customers;
  select * from orders;
 
 -- create a view to store all records from orders table --
 create or replace view v1
 as select * from orders;
 
 -- to execute view --
 select * from v1;
 
 -- create a view to store all records from orders table 
 -- order price>4000 & sort price in desc order --
 create or replace view ds_v2
 as select * from orders where price>4000 order by price desc;
 
  -- to execute view --
 select * from ds_v2;

-- views on join --
-- create a view to find order & customer details of those customer who 
-- have placed orders along with the qty purchased ---
create or replace view ds_v2 as
select cid,count(cust_id) as qty
from customers c inner join orders o
on c.cid=o.cust_id
group by cid;

-- to execute view --
 select * from ds_v2;

-- create a view to find all the records from customer table
-- who have placed orders or not --

create or replace view ds_v3 as
select cid,oname,price
from customers c left join orders o
on c.cid=o.cust_id;

-- to execute view --
 select * from ds_v3;

-- to find order & customer details of those cust who have placed orders
-- where qty purchased must be atleast 2 and store the data in view --

create or replace view ds_v4 as
select cid,count(cust_id) as qty
from customers c,orders o
where c.cid=o.cust_id
group by cid having count(cust_id)>=2;

-- to execute view --
 select * from ds_v4;


-- Updatable View --
-- We can also perform operations on views:--
-- insert the data in orders table using view v1 --
insert into v1 values(9,'sunglasses',2500,103);

-- to execute view --
select * from v1;

select * from orders;

-- update price of clothes from rs 790 to 850 in existing view--
update v1 set price=850 where oname='clothes';

-- to execute view --
select * from v1;

select * from orders;

-- to drop view ds_v2--
drop view ds_v2;