-- WILDCARD CARACTERS(pattern match)
-- to find all details from customer table address must start with p___

select * from customers where address like 'p%'

-- to find all details from customer address must be pune or start with S
select * from customers where address = 'pune' and cname like 's%'

select * from orders

-- select the all details from order table where name contain e--
select * from orders where oname like '%e%'

-- to find all the details  from order table where name ends with es-
select * from orders where oname like '%es'

-- to find data from table with specific length using underscore (_)--
-- to find all the details from order table where oname length it 7 -

select * from orders where oname like '______'

-- to find all the details from order table where name contain bi at 3pos and total len = 12
select * from orders where oname like '__bi________'

-- to find all details from orders table where name contain es at  4pos and total len = 10
select * from orders where oname like '___es_____'