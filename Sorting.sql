
-- sorting on data order by --
select * from customers;
select * from orders;

-- to sort the address column in ascending order--
select * from customers order by address;

-- to sort the order name in descending order from order table--
select * from orders order by oname desc;

-- to sort the order name in descending order & price in asc order from order table--
select * from orders order by oname desc,price asc;

-- to find all the details from order table sort data w.r.t price desc and amt>3500 ---
select * from orders where price>3500 order by price desc;

-- to find all the details from order table sort data w.r.t price desc ,name 
-- and name must contain e --
select * from orders where oname like '%e%' order by price desc,oname;