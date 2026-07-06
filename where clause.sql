
-- WHERE CLUSE 
-- WHERE Clause it acts like filter--

-- to find all the details from customer table address is pune --
select * from customers where address='Pune';

-- to find all the details from order table price less than 1000 --
select * from orders where price<1000;

-- to find all the details from order table price greater than 3500 --
select * from orders where price>3500;

-- to find all the details from order table price range is 3.5k to 50k --
select * from orders where price between 3500 and 50000;

-- to find all the details from order table price must be greater than 2k 
-- & category must be books ---
select * from orders where price>2000 and oname='books';

-- to find all the details from order table category may be shoes,watches,others--
select * from orders where oname in('shoes','watches','others');

-- to find all the details from order table except price 23500,3500---
select * from orders where price not in(23500,3500);

select * from customers