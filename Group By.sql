-- GROUP BY -----grouping of similar kind of data--
-- to find all the details from customer table w.r.t to address --
select address from customers
group by address;

-- HAVING is used to apply filter with group by --
-- to find all the details from customer table w.r.t to address and address must be pune --

select address from customers 
group by address 
having address='pune';

-- to find all the details from customer table w.r.t to address sort address in desc order --
select address from customers 
group by address 
order by address desc;