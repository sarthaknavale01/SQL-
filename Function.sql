-- function in sql ---
-- alias name is temprory name given to a column ,table and it represnt as a keyword
select * from customers;
select * from orders;

-- to calcualate total price from orders
 select sum(price) as total 
 from orders 
 
 -- to calculate the average price from customer
 select avg(price) as avg_price 
 from orders
 
 -- to calculate minmum price from order
 select min(price) as min_price 
 from orders
 
 -- to calculate maximum price from order
 select max(price) as max_price 
 from orders

-- to calculate total number of records from order
select count(*) oid 
from orders

-- ROUNDOFF---
-- Round--

select round(355.24) as roundoff from dual; 
select round(355.51) as roundoff from dual; 
select round(355.2) as roundoff from dual; 

-- ceil and floor--
select ceiling(255.25)as ceilvalue from dual;
select ceil(255.55) as ceilvalue from dual;

select floor(255.25) as floorvalue from dual;
select floor(255.55) as floorvalue from dual;

-- absolute--
select abs(+8.9) as absolute from dual;
select abs(-8.9) as absolute from dual;

-- power() is used to calculate power of number
select power(2,4) as power from dual;

-- sqrt() is used to find square root of number
select sqrt(81) as sqrt from dual